+++
title = "Write a puzzle generator in Elm"
date = 2019-12-27
template = "post.html"
draft = true
+++

##

This holiday season I wanted to make some custom jigsaw puzzles as a gifts. The plan:

- Write a jigsaw puzzle generator.
- Use a Lasercutter to cut them out[^1] (so much fun!).

Since randomly generating puzzles is a fun problem for beginners and tinkerers, I want to write up the approach that I came up with. I'd love to hear from you if you attempted to do something similar, especially if you came up with different solutions.

I used [Elm](https://elm-lang.org/), because it has a nice way to produce SVGs, and it happens to be the frontend language I know best.


## intro

I actually made two attempts, the first one being based on generating a [Voronoi tesselation](https://en.wikipedia.org/wiki/Voronoi_diagram) and making heavy use of `elm-geometry`. That one had some subtle problems with how the paths in the generated svg were laid out[^2].

I will not describe that approach in much detail, instead I'll walk you through a fully working solution based on my second attempt.

Here is how I broke down the problem:

1. Generate a grid with square piecs.
1. Randombly move all the inner corners of the grid a little bit.
1. Replace the edges with a hardcoded tongue shape.

That's it for the highlevel view! It turns out however that you need to solve some smaller problems to make it work. You can have a look at the code on [Ellie](TODO) or the [code repo of this tutorial](TODO).

See [possible improvements](#possible-improvements) below for some ideas about how to make the puzzles better, or polish the overall tool.

## prep your elm project

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

Our `Main.elm` skeleton looks like this:

```elm
module Main exposing (main)

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
- I don't have a nice canvas backdrop that gives me a feeling for where my drawing window is.

I fixed this with a convenience function that parametrises the dimensions and draws a checkered background pattern. The code to this is not terribly interesting, but you can have a look at it [here](https://github.com/2mol/jigsaw-tutorial/blob/43dbeb76767a8a1139ff8aa54a3abb063ba67385/src/Main.elm#L17), or use it interactively in Ellie [here](https://ellie-app.com/7C5JTJsPNCRa1)

With that out of the way, we can focus on the actual problem.

## generating a grid

## possible improvements




---

[^1]: You don't need to own one, check your local maker spaces. There is one at a community workshop in my city, and a friend was nice enough to teach me how to use it.

[^2]: In particular, the first time I went to cut out my puzzles, I learned that the algorithm to generate the cutting path is not particularily fancy. If you've ever looked at the source code for an SVG file, you've noticed that it's just a bunch nested of XML elements, which describe the rectangles, circles, Bézier curves, and other shapes.
<br><br>
It turns out that the Laser just cuts the path **in the same order** as they appear in that file. This works fine for small puzzles, butor a larger ones this means that the head has to jump to whatever path comes next, no matter how close it is to the current position.
<br><br>
Long story short, my paths were in a pretty random order, so the cutting time estimate on the machine for a medium sized puzzle was 30min. This wasn't feasible with the way the machine is rented out. So I decided to go back and optimize the path generation to somehow group long chains of consecutive sub-paths together.

[^99]: https://developer.mozilla.org/en/docs/Web/SVG/Tutorial/Paths
