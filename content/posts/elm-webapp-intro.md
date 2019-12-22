+++
title = "Ingredients to building an Elm app"
date = 2019-08-15
template = "post.html"
draft = true
+++


I recently started a new side-project for which I want to write a single-page app. Since my front-end language of choice is Elm, I had to figure out a lot of Elm-specific solutions and approaches to some of the common building blocks necessary for a SPA.

I'm writing down the bits and pieces I had to solve along the way, in addition to some of the things I learned on previous projects. For reference, (apart from toy sites) I've only ever built one simpler[^1] side-project, and one thing I have running in production at work.

I remember being confused about a bunch of specifics like url-routing, SPAs, the possible approaches to CSS/styling, ports, and a bunch more. My hope is that I can write something down while I still remember _why_ I was confused.

I usually forget why the problem was non-obvious the second I solve it for myself

> There are other great resources[^2], and I will link to them whenever they are better or complementary to my own explanations. One particular resource I come back to a bunch is of course the venerable [elm-spa-example](https://github.com/rtfeldman/elm-spa-example). This plus templates like [elm-batteries](https://github.com/cedricss/elm-batteries) and reading other people's code really helped me learn what I needed to know.
>
> **However**, there is no way getting around trying to digest the fundamental ideas listed below, since **a)** I feel the need to really grasp what is happening under the hood and **b)** I want to strip my stack down to only the things I really need.[^3]

# How

Here are the various questions that you might come across at some point. I will try to cover each of these with a short post:

- SPA or multiple pages? Will it mess up my search engine ranking?[^4]
- What stack do I want to chose?
- What's a good workflow?
- Understanding URL routing.
- How do you structure multiple sub-pages and sub-models?
- Painless JSON decoding. (this becomes weirdly easy at some point)
- Using local storage.
- How to fork a library to adapt it to your own use.
- Random cool things: copy-pasting, asset compression, creating an undo-history, etc.

There are also some topics that I will have to learn about in the future:

- What is a good choice for a backend?
    - I will want a database to store and share stuff at some point.
- How do I build user accounts and a login system in a safe way?

That's it for now, you will find everything else in the individual posts. I hope you participate in the fun of building your own thing!


[^1]: Simpler in the sense of not having multiple pages, more complex in the underlying logic. The latter had more to do with me inadvertently trying to re-invent Excel. You can check it out [here](https://2mol.gitlab.io/urechner/), it's a divorce-rate calculator (unfortunately in german).

[^2]: *Obviously* you should also read the [Elm Guide](https://guide.elm-lang.org/). I'm saying this, yet I'm still surprised at how often I was searching for something advanced, only to discover that it was right there under my nose the entire time. Perhaps it could have a richer table of contents? Keep coming back to it!

[^3]: I'm not a JavaScript developer, so I'm a bit biased, i.e. the need for webpack and several dependencies from npm is not obvious to me. If we discover that putting Elm in production doesn't need this additional complexity, then I'd consider that a huge plus!

[^4]: The Elm ecosystem currently has surprisingly bad [SEO](https://en.wikipedia.org/wiki/Search_engine_optimization). When googling a core module or a package you often land on outdated versions or other irrelevant things. The weirdest example is that when you currently search for "elm markdown", _none_ of the top results point towards the official [elm-explorations/markdown](https://github.com/elm-explorations/markdown), see [screenshot](/images/elm-markdown-google.png) as of 2019-08-16. Maybe diving in on the reasons for this is a topic for a future post.
