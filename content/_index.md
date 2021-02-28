+++
title = "Juri Chomé"
+++


Hi, I'm Juri. I like to make things, so here are some of them. Currently I'm gainfully employed as a [full-stack developer](https://valora.digital/), working on autonomous stores and making backend systems beautiful and reliable.

Lately my interests revolve around good design, minimalist UIs, and making complex workflows easy and intuitive. I've experienced time and time again that we can still unlock huge productivity gains with better UX.

I believe that if there is any point to software, it's to augment human capabilities and provide new tools for thinking. See [interesting problems](#problems) below for some examples.

You can contact me on [twitter](https://twitter.com/jurichome), or by sending an email to [juri@juricho.me](mailto:juri@juricho.me).


## Projects

Here is some of what I've built in the past:

- **gulliver** - a trip planner with a focus on simplicity and a slick user interface.
<br/>→ [website](https://gllvr.com)
- **paperboy** - a tiny commandline utility to help with your pdf hoarding.
<br/>→ [github](https://github.com/2mol/pboy)
- **divorce rate calculator** - built as a prototype to show how a bespoke tool can bring clarity into complex legal rules. The tool also provides legal documentation to each of the key inputs, enabling lawyers and judges to be more efficient and consistent. Only applicable to Swiss law.
<br/>→ [demo](https://2mol.gitlab.io/urechner)


## Interesting problems {#problems}

I often come across problems for which I'm not aware of an existing solution. This is basically a list of projects I'd like to work on.

Reach out if you have any insights or ideas, if you want to collaborate, or if there are existing tools/products that I have overlooked.


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


## Woodworking

I like making furniture. This is where I will gradually put plans, and photos of the more interesting projects.

- [Züri Dësch - The Zurich couch table](/zurich-table)
