+++
title = "Juri Chomé"
+++


Hi, I'm Juri 👋

I'm a developer, currently employed as a full-stack engineer at [Valora Digital](https://valora.digital/). I work on autonomous stores and on making critical systems beautiful and reliable.

<!-- I have a deep nagging feeling that we _still_ haven't scratched the surface of what human-computer interaction could be. Some day I'll elaborate on that. -->

I started to collect [interesting problems](#problems) that are probably within reach of a motivated programmer with a couple of weekends to spare.

I enjoy typed functional programming. I write F# at my current day-job, and I co-organise [ZuriHac](http://zurihac.com/), a European Haskell Hackathon. I tend to reach for Elm for doing frontend work.

When I'm not earning money, I also like to make furniture, go climbing, cooking, and all that other cliché stuff.

You can contact me via [email](mailto:juri@juricho.me), or by messaging me on [twitter](https://twitter.com/jurichome).


## Projects

I like to work on small physical or digital projects. Here are some that have reached at least a minimum notion of finished or polished.

**Laser-cut jigsaw puzzles** - I wrote a [puzzle generator](/posts/puzzle-generator) so that I could generate SVGs to cut out with an industrial Laser.

**Züri Dësch** - A minimalist [couch table](/zurich-table) that has a second use as a bench. Go ahead, build a replica.

**Gulliver** - a trip planner with a focus on simplicity and a slick user interface.
<br/>→ [gllvr.com](https://gllvr.com)

**Paperboy** - a tiny commandline utility to help with your pdf hoarding.
<br/>→ [github.com/2mol/pboy](https://github.com/2mol/pboy)

**Divorce rate calculator** - This encodes Swiss law about separating estates and calculating child support. Built as a prototype, learning the hard way that [your biggest competitor is a spreadsheet](https://grid.is/blog/your-biggest-competitor-is-a-spreadsheet). The key idea was to expose complex rules via a simple UI, and to provide legal documentation to each of the inputs.
<br/>→ [demo](https://2mol.gitlab.io/urechner)


## Interesting problems {#problems}

I often come across problems for which I'm not aware of an existing solution. This is basically a list of projects I'd like to work on.

Reach out if you have any insights or ideas, if you want to collaborate, or if there are existing tools/products that I have overlooked.


### A personal bookshelf

I grew up in a house full of bookshelves. It was amazing to browse through decades of old stuff that my parents had read at some point, with the odd boardgame or CD collection in between. It is still a special feeling to look at these shelves and realise that it contains things that were special or influential to people that are very dear to me.

Over the years I added to the shelves, so they now represent a mish-mash history of everybody in my immediate family.

I would like to create something that let's me have a digital bookshelf. Realistically that means not the contents, just the titles. I want to track

- a reading list
- a collection of books, articles, essays, games, etc that hold a special place in my heart
- a dump pile of stuff I've read, but don't need to be kept around

Part of this would be building a better [Goodreads](https://www.goodreads.com/), which is well known to be crappy, slow, and just overall _blergh_.

It doesn't need big social features, but adding a short snippet to an item would be great.

**Prior ideas:** Reading clubs, Goodreads, general appreciation for the [link post](https://patrickcollison.com/links), many people's reading section on their personal blogs ([example](https://hojberg.xyz/reads/)).


### Teaching with diffs

Tutorials and blog posts should more often be centered around letting me see the **diff of the code** in a particular step. Currently a common dilemma for authors is that they have to choose between:

- Only show the relevant code snippets at each step.
<br/>_Downside_: the reader has a hard time keeping track of the context of said snippet, as a lot of important definitions and assignments will be omitted.
- Display more context (or even the entire source code).
<br/>_Downside_: There will be a lot of repetition, and articles get very long and bloated, making it difficult to navigate.

Either way the result for the reader is often a lot of jumping back and forth, trying to piece together a full picture of what's happening. Why can't I just jump through the diff while reading the article next to it?

One possible solution: use a git commit history to render an **interactive diff viewer** next to the article text. The diffs could advance automatically when I scroll to the next section, and I want to jump to the full source code view at any time, so that I can explore the changes and the full context at my leisure.

> **Side note:** This ties into another observation: Despite it's unquestionable success, version control is **still** not used to its full potential, especially outside of software engineering.

**Possible problems** with my approach:

- interactive notebooks might already fulfill this need.
- maybe creating a clean git commit history is a hassle for most writers.


**Existing work** I've found in the meantime:

- [GitChapter](https://github.com/chrissound/GitChapter)
- [kamo](https://github.com/matsumonkie/kamo)


### SQL in your text editor

I want an editor plugin that lets me write **SQL queries against files with tabular data** (mostly csv, parquet, etc).

I want to see the resulting data right there in the editor. I know of [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv), but I think the experience can be improved. The query engine is awkward, and I have to address the columns by index instead of by name.

The approach I would like to try is to dump the data into sqlite and do some simple detection of column types. Then simply send the query to sqlite and make the output pretty.

**Prior art**: [q is a tool](http://harelba.github.io/q/) that lets you do exactly this from the commandline. This is great for a lot of use cases, but I also want editor integration so that I get syntax highlighting and a more interactive experience.
