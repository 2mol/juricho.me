+++
title = "Problems"
+++

## Interesting problems

I often come across problems for which I'm not aware of an existing solution. This is basically a list of projects I'd like to work on.

Reach out if you have any insights or ideas, if you want to collaborate, or if there are existing tools/products that I have overlooked.


### A personal bookshelf

I grew up in a house full of bookshelves. It was amazing to browse through decades old stuff that my parents had read at some point, with the odd boardgame or CD collection in between. It is still a special feeling to look at these shelves and realize that it contains things that were special or influential to somebody at some point.

Over the years I added to the shelves, so they now represent a mish-mash history of everybody in my immediate family.

I would like to create something that let's me have a digital bookshelf. Realistically that means not the contents, just the titles. I want to track a reading list, a collection of books, articles, essays, games, etc that are near and dear to my heart, and a dump pile of stuff I've consumed, but don't need to highlight as anything special.

Part of this would be building a better [Goodreads](https://www.goodreads.com/), which is well known to be crappy, slow, and just overall _blergh_.


### Teaching with diffs

Tutorials and blog posts should more often be centered around letting me see the **diff of the code** in a particular step. Currently a common dilemma for authors is that they have to choose between:

- Only show the relevant code snippets at each step.
<br/>**Downside**: the reader has a hard time keeping track of the context of said snippet, as a lot of important definitions and assignments will be omitted.
- Display more context (or even the entire source code).
<br/>**Downside**: There will be a lot of repetition, and articles get very long and bloated, making it difficult to navigate.

Either way the result for the reader is often a lot of jumping back and forth, trying to piece together a full picture of what's happening. Why can't I just jump through the diff while reading the article next to it?

One possible solution: use a git commit history to render an **interactive diff viewer** next to the article text. The diffs could advance automatically when I scroll to the next section, and I want to jump to the full source code view at any time, so that I can explore the changes and the full context at my leisure.

> **Side note:** This ties into another observation: Despite it's unquestionable success, version control is **still** not used to its full potential, especially outside of software engineering.

**Possible problems** with my approach:

- interactive notebooks might already fulfill this need.
- maybe creating a clean git commit history is a hassle for most writers.


### SQL in your text editor

I want an editor plugin that lets me write **SQL queries against files with tabular data** (mostly csv, parquet, etc).

I want to see the resulting data right there in the editor. I know of [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv), but I think the experience can be improved. The query engine is awkward, and I have to address the columns by index instead of by name.

The approach I would like to try is to dump the data into sqlite and do some simple detection of column types. Then simply send the query to sqlite and make the output pretty.

**Prior art**: [q is a tool](http://harelba.github.io/q/) that lets you do exactly this from the commandline. This is great for a lot of use cases, but I also want editor integration so that I get syntax highlighting and a more interactive experience.
