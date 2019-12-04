+++
title = "Write Haskell in your browser"
date = 2019-02-13
template = "post.html"
draft = false
+++


## tl;dr

- More Haskell programmers and learners might enjoy using online dev environments.
- You can write and execute non-trivial Haskell on [repl.it](https://repl.it/) (I'm not affiliated with them).
- That environment secretly includes not just `base`, but couple of other useful libraries.
- You can write interactive command-line programs and have them automagically served up on the web.[^1]


## Why an online REPL?

In case you don't already know, there has been a surge of online programming environments in recent years, most notably [interactive notebooks](https://en.wikipedia.org/wiki/Notebook_interface) and [REPLs](https://en.wikipedia.org/wiki/REPL). This stuff is really popular the webdev and data science communities[^4].

The idea is that you can type in some commands, have them executed by whatever interpreter, write code in files/modules, build interactive programs, create visualizations, entire websites, and so on.

Here are the major examples I can think of for various languages:

- [Ellie](https://ellie-app.com/) for Elm. (sidenote: Elm is SO much fun!)
- [Observable](https://observablehq.com/), focused on creating notebooks and interactive visualizations. Seriously, if you're a JavaScript hater, go look at [these][torus] [utterly cool][sounds] [things][fisheye].
- [Jupyter](https://jupyter.org/try) - this is the big badass one that you can use if you happen to be detecting [gravitational waves][gravitational-waves]. First-class supported languages[^2] are **Ju**lia, **Pyt**hon, and **R**[^3].
- [Glitch](https://glitch.com/). Another JavaScript based one. I haven't extensively tried it, but it seems to bring happiness and joy to everybody using it.
- [ClojureScript REPL](https://clojurescript.io/)
- [repl.it](https://repl.it), supporting a bazillion languages.

That last one is what this post is about. Repl.it is great for many reasons, not least because it started providing a [Haskell environment](https://repl.it/site/blog/haskell) two years ago.

> sidenote: repl.it lets multiple people join the same editor and all edit at the same time, which is insanely cool. Get some friends and click the "multiplayer" button.


## The libraries nobody told you about

Unfortunately it's not clear which packages apart from `base` are built in. Random guessing quickly shows that at least `containers` and `text` are available, but I couldn't find a complete list anywhere. Of course we won't let that stop us. After a bit of fiddling and exploring:

<s>`:! ls -l /opt/ghc/8.6.3/lib/ghc-8.6.3/`</s>

`:! ghc-pkg list`[^6]

Explanation: `:!` is a ghci command[^5] that lets you execute whatever you want in the shell.

We can see that we have access to the following[^8] libraries:

```plaintext
/opt/ghc/8.6.3/lib/ghc-8.6.3/package.conf.d
    Cabal-2.4.0.1
    array-0.5.3.0
    base-4.12.0.0
    binary-0.8.6.0
    bytestring-0.10.8.2
    containers-0.6.0.1
    deepseq-1.4.4.0
    directory-1.3.3.0
    filepath-1.4.2.1
    (ghc-8.6.3)
    ghc-boot-8.6.3
    ghc-boot-th-8.6.3
    ghc-compact-0.1.0.0
    ghc-heap-8.6.3
    ghc-prim-0.5.3
    ghci-8.6.3
    haskeline-0.7.4.3
    hpc-0.6.0.3
    integer-gmp-1.0.2.0
    libiserv-8.6.3
    mtl-2.2.2
    parsec-3.1.13.0
    pretty-1.1.3.6
    process-1.6.3.0
    rts-1.0
    stm-2.5.0.0
    template-haskell-2.14.0.0
    terminfo-0.4.1.2
    text-1.2.3.1
    time-1.8.0.2
    transformers-0.5.5.0
    unix-2.7.2.2
    xhtml-3000.2.2.1
```

FUN. I don't know about you, but at this point I get pretty excited, since this means that we can write a lot more serious stuff than I had initially realized.

For example, we can write entire interactive command-line programs that repl.it will automatically serve up at `https://[replname].[username].repl.run`. [Here](https://haskeline-example.2mol.repl.run/) you can play with an example I simply copy-pasted from the [haskeline](https://hackage.haskell.org/package/haskeline) documentation.

If you're not familiar with the libraries above, here's an (incomplete) overview:

- The great [containers](https://hackage.haskell.org/package/containers) lets you use `Set`, `Map`, `Graph`, and `Tree`. The first two are especially nice if you're used to dictionaries and sets from other languages.
- The low-level [array](https://hackage.haskell.org/package/array) gives you a structure that is faster than list for accessing elements at an arbitrary index.
- [parsec](https://hackage.haskell.org/package/parsec) is your entry ticket into the world of <s>parser-combinators</s> INDUSTRIAL-STRENGTH PARSER COMBINATORS.
- [text](https://hackage.haskell.org/package/text) and [bytestring](https://hackage.haskell.org/package/bytestring) replace `String` as the proper way to do either user-readable strings or binary data respectively.
- [mtl](https://hackage.haskell.org/package/mtl) is how [people cooler than me](https://www.parsonsmatt.org/2018/03/22/three_layer_haskell_cake.html) structure big-boy programs.
- [template-haskell](https://hackage.haskell.org/package/template-haskell) is how you write Haskell that <s>writes Haskell</s> creates [splices](https://en.wikipedia.org/wiki/Splice_(film)), which is metaprogramming and probably nice.
- [filepath](https://hackage.haskell.org/package/filepath) and [directory](https://hackage.haskell.org/package/directory) let you interact with the file system, which repl.it _totally lets you do_!

That's it for now, figure out the other libraries yourself. It would obviously be great to have more. For example to have [wreq](https://hackage.haskell.org/package/wreq) to make network requests, or some graphics package to create images or draw on the DOM.

With enough interest repl.it might be persuaded to include more packages. Before discovering all this, I messaged them on their [twitter](https://twitter.com/replit) to ask if they could update GHC from 8.0.x to 8.6.3 in the coming year, and they literally did it within an afternoon. Amazing.

## What now?

Now that you have no more excuses, I guess you just have to go and build stuff. If you're a newbie, then work through the exercises from [Haskell Programming from first principles](http://haskellbook.com/) (paid, but very worth it), or [Learn You a Haskell](http://learnyouahaskell.com/) (free and utterly charming).

Use [haskeline](https://hackage.haskell.org/package/haskeline) and go write a clone of [Zork](https://en.wikipedia.org/wiki/Zork). Do whatever! Share what you make on [r/haskell](https://old.reddit.com/r/haskell/), and come ask questions in the #haskell channel on the [functional programming discord](https://discordapp.com/channels/280033776820813825).

Here is a code snippet so that you don't get bored in the meantime. Save it into a new file in repl.it, hit run and load up the module with something like `:l Entropy.hs`.

Do you have the right intuition for what has high or low entropy? I didn't.

```haskell
{-# LANGUAGE ScopedTypeVariables #-}

module Entropy where

import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as M

-- tally the number of occurrences of all the items in a list:
count :: forall a . Ord a => [a] -> Map a Int
count elements =
    foldl addCount M.empty elements
    where
        addCount :: Map a Int -> a -> Map a Int
        addCount counter el = M.insertWith (+) el 1 counter

-- calculate which element occurs which percentage of the time
proportions :: Ord a => [a] -> [Double]
proportions xs =
    [c / n | c' <- counts, let c = fromIntegral c']
    where
        counts = M.elems (count xs)

        n = fromIntegral $ length xs

-- entropy measure
-- https://en.wikipedia.org/wiki/Entropy#Statistical_mechanics
entropy :: Ord a => [a] -> Double
entropy xs =
    -sum [p * logBase 2 p | p <- proportions xs]
```

---

[^1]: Your `main` function will be run in a little pseudo-terminal, so all your `putStrLn` and `getLine` will print text or wait for user input. You can't pass arguments or flags to your program tough, since you don't control stdin.

[^4]: I was skeptical of online programming environments at first, since the idea sounds a bit gimmicky. I changed my mind[^7] after seeing how many children build really impressive things in them, and how joyful it feels to use one for quick demos and experiments. It's really easy to send somebody a code snippet that just executes, zero friction. Beginners can still install stack or cabal afterwards, no rush.

[^2]: We also have our very own [Haskell Kernel](https://github.com/gibiansky/IHaskell) currently maintained by total champion [Vaibhav Sagar](https://github.com/vaibhavsagar). It's all there, but more help is needed to remove some frictions for beginners, like a noob-friendly install experience and more cool [tutorials](https://www.youtube.com/watch?v=gR8LdlrEFnM). EDIT: I'm being informed on reddit that you can actually [use IHaskell online](https://mybinder.org/v2/gh/gibiansky/IHaskell/master).

[^3]: Get it? JuPytR!

[^6]: I didn't know about `ghc-pkg list`, but my friend [Nicolas](https://github.com/nmattia/) did.

[^5]: I came across this in a [list of all ghci commands](https://downloads.haskell.org/~ghc/7.4.1/docs/html/users_guide/ghci-commands.html), hoping for one that lists all importable modules for a specific ghci session.

[^8]: Why precisely those? Turns out they are probably just the [core packages](https://ghc.haskell.org/trac/ghc/wiki/Commentary/Libraries/VersionHistory) that GHC ships with. Again, thanks Nicolas!

[^7]: _meta-footnote_: Come to think of it, it was actually [https://tryhaskell.org/](https://tryhaskell.org/) that got me all fired up about Haskell for the very first time.

[torus]: https://beta.observablehq.com/@renatoppl/torus-knots
[sounds]: https://beta.observablehq.com/@freedmand/sounds
[fisheye]: https://beta.observablehq.com/@benmaier/a-visually-more-appealing-fisheye-function
[gravitational-waves]: https://www.gw-openscience.org/s/events/GW150914/GW150914_tutorial.html
