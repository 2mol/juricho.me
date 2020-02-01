+++
title = "Juri Chomé"
+++


Hi, I'm Juri. I like to make things, so here are some of them. Currently I enjoy [working with data](https://d-one.ai), [woodworking](#woodworking), and making webapps.

Lately my interests revolve around good design, minimalist UIs, and making complex workflows easy and intuitive. I've experienced time and time again that we can still unlock huge productivity gains with better UX.

I believe that if there is any point to software, it's to augment human capabilities and provide new tools for thinking. See [intresting problems](#problems) below for some examples.

You can contact me on [twitter](https://twitter.com/jurichome), or by sending an email to [juri@juricho.me](mailto:juri@juricho.me).

## projects

Here is some of what I've built in the past:

- **gulliver** - a trip planner with a focus on simplicity and a slick user interface.
<br/>→ [website](https://gllvr.com)
- **paperboy** - a tiny commandline utility to help with your pdf hoarding.
<br/>→ [github](https://github.com/2mol/pboy)
- **a divorce rate calculator** - built as a prototype to show how a custom, reactive user interface can bring clarity into complex legal rules. The tool also provides legal documentation to each of the key inputs, enabling lawyers and judges to be many times more efficient and consistent when handling a case.
<br/>(In German, and only applicable to Swiss law.)
<br/>→ [demo](https://2mol.gitlab.io/urechner)


## interesting problems {#problems}

I often come across problems that I find interesting, so I started collecting them. Below is a list for which I'm not aware of an existing solution. This is basically a list of projects I'd like to work on.

Reach out if you have any insights or ideas, if you want to collaborate, or if there are existing tools/products that I have overlooked.


### teaching with diffs

Tutorials and blog posts should more often be centered around letting me see the **diff of the code** in a particular step. Currently a common dilemma for authors is that they have to choose between:

- only showing the relevant code snippets at each step.
<br/>**Downside**: the reader has a hard time keeping track of the context of said snippet, as a lot of important definitions and assignments will be omitted.
- displaying more context (or even the entire source code) For context.
<br/>**Downside**: There will be a lot of repetition, and articles get very long and bloated, making it difficult to navigate.

Either way the result for the reader is often a lot of jumping back and forth, trying to piece together a full picture of what's happening.

The way I imagine the solution: use a git commit history to render an **interactive diff viewer** next to the article text. The diffs could advance automatically when I scroll to the next section, and I want to jump to the full source code view at any time, so that I can explore the changes and the full context at the same time.

> **Side note 1**: It would be fun to try the same thing for teaching writing or other topics centered around text.

> **Side note 2**: This exposes another belief I have: Despite it's unquestionable success, version control is **still** not used to its full potential, especially outside of software engineering.

**Possible problems** with my approach:

- interactive notebooks might already fill this need a lot better.
- creating a clean git commit history could be too much hassle for most writers.


### SQL in your text editor

I want an editor plugin that lets me write **SQL queries against files with tabular data** (mostly csv, parquet, etc).

I want to see the resulting data right there in the editor. I know of [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv), but I think the experience can be improved. The query engine is awkward, and I have to address the columns by index instead of by name.

The approach I would like to try is to dump the data into sqlite and do some simple detection of column types. Then simply send the query to sqlite and make the output pretty.

**Prior art**: [q is a tool](http://harelba.github.io/q/) that lets you do exactly this from the commandline. This is great for a lot of use cases, but I also want editor integration so that I get syntax highlighting and a more interactive experience.


## woodworking

I like making furniture. This is where I will gradually put plans, and photos of the more interesting projects.

- [Züri Dësch - The Zurich couch table](/zurich-table)
