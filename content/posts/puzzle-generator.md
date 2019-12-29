+++
title = "Write a puzzle generator in Elm"
date = 2019-12-27
template = "post.html"
draft = true
+++


![LASERS](/img/lasercutter.gif)

This holiday season I wanted to make some custom jigsaw puzzle gifts. The plan:

- Write a jigsaw puzzle generator.
- Use a Lasercutter to cut them out[^1]. (so much fun!)

Since randomly generating puzzles is a fun problem for beginners and tinkerers, I want to write up the approach that I came up with. I'd love to hear from you if you attempted to do something similar, especially if you came up with different solutions.

I used [Elm](https://elm-lang.org/), because it has a nice way to produce SVGs, and it happens to be the frontend language I know best.


## Intro

I actually made two attempts, the first one being based on generating a [Voronoi tesselation](https://en.wikipedia.org/wiki/Voronoi_diagram) and making heavy use of [`elm-geometry`](https://package.elm-lang.org/packages/ianmackenzie/elm-geometry/latest/). That approach had some subtle problems[^2], which made me go back to the drawing board for a second attempt.

I will not describe that approach in much detail, instead I'll walk you through a fully working solution based on my second attempt.

Here is how I broke down the problem:

1. [Generate a grid with square pieces](#grid).
1. [Randomly move all the inner corners of the grid a little bit](#wiggle).
1. [Replace the edges with a tongue shape](#edges).

That's it for the highlevel view! It turns out however that you need to solve some smaller problems to make it work. You can have a look at the code on [Ellie](TODO) or the [code repo of this tutorial](TODO).

See [possible improvements](#possible-improvements) below for some ideas about how to make the puzzles better, or polish the overall tool.


## Setting up your Elm project

I'll assume that you have the [Elm compiler installed](https://guide.elm-lang.org/install/elm.html). Here is everything you need to initialise the project:

```plaintext
mkdir jigsaw-tutorial
cd jigsaw-tutorial
elm init
elm install elm/random
elm install elm/svg
elm install elm-community/list-extra
```

Now create `src/Main.elm`, launch `elm reactor` in the commandline, and open `http://localhost:8000/src/`

Let me give you a skeleton for `Main.elm`. The commented out imports will be needed in a second, so feel free to uncomment them already:

```elm
module Main exposing (main)

-- import Dict exposing (Dict)
-- import List.Extra as List
-- import Random
import Svg exposing (Svg)
import Svg.Attributes exposing (..)

main : Svg msg
main =
    Svg.svg
        [ width "800"
        , height "600"
        , viewBox "0 0 800 600"
        ]
        [ Svg.rect
            [ x "0", y "0"
            , width "100", height "100"
            ]
            []
        ]
```

So already I'm not _super_ loving two things:

- I have to repeat the dimensions in two places, and they are strings.
- I don't have a nice canvas backdrop that gives me visual feedback about where my drawing window is.

I fixed this with a convenience function that parametrises the dimensions and draws a checkered background pattern. The code to this is not terribly interesting, but you can have a look at it [here](https://github.com/2mol/jigsaw-tutorial/blob/43dbeb76767a8a1139ff8aa54a3abb063ba67385/src/Main.elm#L17), or use it interactively in Ellie [here](https://ellie-app.com/7C5JTJsPNCRa1). It will look like this:

<img srcset="/img/canvas.png 1x, /img/canvas.png 2x" src="/img/canvas.png"/>

Amazing! With that out of the way, we start solving the actual problem.


## Generate a grid {#grid}

With the benefit of hindsight, we'll abstract a couple of things: let's define some basic datatypes and a top-level record that holds the parameters of our puzzle:

```elm
module Main exposing (main)

-- [...]

puzzle =
    { piecesX = 12
    , piecesY = 6
    -- , gridPerturb = 6
    -- , seed = Random.initialSeed 666
    -- , draftMode = False
    , pixelsPerCell = 50
    }

type alias Point =
    { x : Int
    , y : Int
    }

-- type alias Edge =
--     { start : Point
--     , end : Point
--     }
```

Again, the commented out parts are to give you a taste of what we'll need in a minute.

Now we need to make a grid of square pieces. Some thoughts:

- a grid is a 2-dimensional list of corner points, but it is _also_ a list of edges. Which one you generate depends on what you want to do with it.
- our units will be pixels
- we might want to keep the coordinates of the pieces separate from the numbering of the pieces. I often confused the two!
- Carrying over this numbering when we work on edges is tricky, but super useful later when we want to sort the paths.

With this in mind, I decided to describe my grid as a `Dict` of points. The keys are tuples that correspond to my x-y _numbering_ of the pieces.

With a bit of programming 101, here is the function that gives us a dictionary of corner points for our grid:

```elm
rectangularGrid : Int -> Int -> Dict ( Int, Int ) Point
rectangularGrid nx ny =
    let
        indicesX =
            List.range 0 nx

        indicesY =
            List.range 0 ny

        indices =
            List.lift2 Tuple.pair indicesX indicesY
    in
    indices
        |> List.map
            (\( ix, iy ) ->
                ( ( ix, iy )
                , { x = ix * puzzle.pixelsPerCell
                  , y = iy * puzzle.pixelsPerCell
                  }
                )
            )
        |> Dict.fromList
```

Unless we can draw this, it's not going to be very useful. So let's draw some points

```elm
main : Svg msg
main =
    let
        grid =
            rectangularGrid puzzle.piecesX puzzle.piecesY

        markers =
            Dict.values grid
                |> List.map drawMarker
    in
    canvas params.width params.height
        markers

-- DRAWING FUNCTIONS

drawMarker : Point -> Svg msg
drawMarker { x, y } =
    Svg.circle
        [ cx <| String.fromInt x
        , cy <| String.fromInt y
        , r "2"
        , stroke "#666"
        , fillOpacity "0"
        ]
        []
```

Checkpoint: you can [look at this on Ellie](https://ellie-app.com/7CwmXqJVYbDa1), or [browse the code repo at this point in time](https://github.com/2mol/jigsaw-tutorial/blob/6add4558d19afddf19e090fb72168fb012189351/src/Main.elm).

<img srcset="/img/grid.png 1x, /img/grid.png 2x" src="/img/grid.png"/>

This seems nice, but unfortunately we still have some work to do. We ultimately want to work with edges, not corners. The challenge is therefore to find a function with the following type signature:

```elm
type alias Point =
    { x : Int
    , y : Int
    }

type alias Edge =
    { start : Point
    , end : Point
    }

calcEdges : Dict ( Int, Int ) Point -> List Edge
calcEdges = ???
```

This is the kind of stuff I like solving as a programming exercise, so if you want to do that, now's the time.

Here is one solution:

```elm
calcEdges : Dict ( Int, Int ) Point -> List Edge
calcEdges grid =
    let
        maybeConnect indices point =
            Dict.get indices grid
                |> Maybe.map (\point2 -> { start = point, end = point2 })

        horizontals =
            grid
                |> Dict.map (\( ix, iy ) point -> maybeConnect ( ix + 1, iy ) point)
                |> Dict.toList
                |> List.sortBy (\( ( _, iy ), _ ) -> iy)
                |> List.map Tuple.second
                |> List.filterMap identity

        verticals =
            grid
                |> Dict.map (\( ix, iy ) point -> maybeConnect ( ix, iy + 1 ) point)
                |> Dict.toList
                |> List.sortBy (\( ( ix, _ ), _ ) -> ix)
                |> List.map Tuple.second
                |> List.filterMap identity
    in
    horizontals ++ verticals
```

It might be slightly more complicated than necessary, but I really wanted to have control over the sorting order.

Again, let's draw this:

```elm
main : Svg msg
main =
    let
        grid =
            rectangularGrid puzzle.piecesX puzzle.piecesY

        markers =
            Dict.values grid
                |> List.map drawMarker

        edges =
            calcEdges grid
    in
    canvas params.width params.height
        [ Svg.g [] markers
        , Svg.g [] <| List.map drawEdge edges
        ]

-- DRAWING FUNCTIONS

drawEdge : Edge -> Svg msg
drawEdge { start, end } =
    Svg.line
        [ x1 <| String.fromInt start.x
        , y1 <| String.fromInt start.y
        , x2 <| String.fromInt end.x
        , y2 <| String.fromInt end.y
        , strokeWidth "1"
        , stroke "#c66"
        ]
        []
```

> Sidenote: Ping me if you know why the highlight.js syntax highlighting for elm sometimes breaks, like above.

Progress! This is what it looks like:

<img srcset="/img/edges.png 1x, /img/edges.png 2x" src="/img/edges.png"/>

Here are the checkpoints for [Ellie](https://ellie-app.com/7CwR5kHgB2La1) and the [code repo](https://github.com/2mol/jigsaw-tutorial/blob/fae0f5b5c897e19d229778cefc91da52c294b9be/src/Main.elm) for this step.


## Wiggle the grid {#wiggle}

Time to make this grid less boring. I think with the setup we chose it is nice to have a function that just transforms a grid `Dict` into another grid `Dict`. Here are the new pieces of code:

```elm
module Main exposing (main)

-- ...
import Random

puzzle =
    { draftMode = True
    , piecesX = 12
    , piecesY = 6
    , pixelsPerCell = 50
    , seed = Random.initialSeed 666
    , gridPerturb = 6
    }

perturbGrid : Dict ( Int, Int ) Point -> Dict ( Int, Int ) Point
perturbGrid grid =
    let
        pert =
            puzzle.gridPerturb

        randomPair =
            Random.pair
                (Random.int -pert pert)
                (Random.int -pert pert)

        randomPairListGen =
            Random.list (Dict.size grid) randomPair

        ( randomPairList, _ ) =
            Random.step randomPairListGen puzzle.seed
    in
    Dict.values grid
        |> List.map2 (\( rx, ry ) point -> { x = point.x + rx, y = point.y + ry }) randomPairList
        -- optional: keep borders straight
        |> List.map snapToBorder
        |> List.map2 Tuple.pair (Dict.keys grid)
        |> Dict.fromList


snapToBorder : Point -> Point
snapToBorder { x, y } =
    { x = snapToBorder_ puzzle.gridPerturb params.width x
    , y = snapToBorder_ puzzle.gridPerturb params.height y
    }


snapToBorder_ : Int -> Int -> Int -> Int
snapToBorder_ howClose maxCoord coord =
    if coord - howClose <= 0 then
        0

    else if coord + howClose >= maxCoord then
        maxCoord

    else
        coord
```

Again, this is mostly simple code, but it was fairly tricky to get the random parts working correctly. It's easy to fall into the trap of using the same seed for a list of things, getting the same perturbation everywhere.

Additionally, the bulk of the code consists of some boring logic to snap the outer edges back into the rectangular border shape. You could skip this to get a more interesting puzzle!

<img srcset="/img/edges-pert.png 1x, /img/edges-pert.png 2x" src="/img/edges-pert.png"/>

Yay.

[Ellie](https://ellie-app.com/7Cx2fryTJH3a1) and [code](https://github.com/2mol/jigsaw-tutorial/blob/6efea6c463c3dd0aca57727c26af6f84641552d4/src/Main.elm) checkpoints.

## Puzzle edge shapes {#edges}

It doesn't look like much yet, but everything is goint to fall into place with this next step.


## Possible improvements




---

[^1]: You don't need to own one, check your local maker spaces. There is one at a community workshop in my city, and a friend was nice enough to teach me how to use it.

[^2]: One problem was how the paths in the generated svg were laid out. In particular, the first time I went to cut out my puzzles, I learned that the algorithm to generate the cutting path is not particularily fancy. If you've ever looked at the source code for an SVG file, you've noticed that it's just a bunch nested of XML elements, which describe the rectangles, circles, Bézier curves, and other shapes.
<br><br>
It turns out that the Laser just cuts the path **in the same order** as they appear in that file. This works fine for small puzzles, butor a larger ones this means that the head has to jump to whatever path comes next, no matter how close it is to the current position.
<br><br>
Long story short, my paths were in a pretty random order, so the cutting time estimate on the machine for a medium sized puzzle was 30min. This wasn't feasible with the way the machine is rented out. So I decided to go back and optimize the path generation to somehow group long chains of consecutive sub-paths together.

<!-- [^99]: https://developer.mozilla.org/en/docs/Web/SVG/Tutorial/Paths -->
