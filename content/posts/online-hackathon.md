+++
title = "How to move a 400-person hackathon online"
date = 2021-06-05
template = "post.html"
draft = true

[extra]
headerclass = "text-white"
headerstyle = "background-color: rgb(93,80,130);"
toc = true
+++

I co-organise[^organisers] a hackathon called [ZuriHac](https://zurihac.com) that takes place in June every year. Last year when the pandemic hit, we had the choice to cancel the event or hold it online.

We tried to find some guidance on how to organise virtual events, but there wasn't much out there that we could apply. Most of the information was (and still is) geared towards conferences, often with a focus on corporate events.

Hackathons are different enough from conferences that we had to come up with our own approach. Here are some notes on what we learned.

## About ZuriHac

You can jump straight down to the conclusions, but here is some context on the hackathon itself. I think that our learnings might only apply to you if you're trying to achieve similar goals. If you're organising a conference with a lot of talks, or a professional networking-plus-salespitch event, then your choices in structure, technology, and content will look very different.

In a normal year ZuriHac looks as follows:

- The physical event takes place near Zurich, on the beautiful lakeside campus of a technical university now called [OST](https://www.ost.ch/).
- It's **free** to attend, however you have to feed yourself and find a place to stay (which is not always cheap in Switzerland).
- We have a capacity for 500 people, and we usually end up with ~20% no-shows, so let's call that 400 attendees.
- It's centered around the programming language [Haskell](https://www.haskell.org/), which makes it fairly niche, but it also means that 400 people is relatively large[^size].

### Content

Apart from just getting people together, we also try to make sure there are a bunch of interesting things to do at ZuriHac. This is what we want to replicate online.

- People come to hack on their open-source projects together. Last year we counted [73 projects](https://zfoh.ch/zurihac2020/projects.html), across a wide range of complexity and maturity.
- We have 5 talks. This is not a lot (by conference standards) so we get to focus on a few incredibly great speakers. This helps with streaming and not needing to create a complicated overlapping schedule.
- We have a couple of tracks that are structured like classes or workshops. Generally we try to cover the range between beginners, intermediate, advanced, and compiler hacking.
- People socialise and make friends.

Below is a screenshot of our 2020 schedule. As you can see, there is not a _huge_ amount going on in terms of fixed events.

![2020 schedule](/img/zurihac2020/schedule-2020.png)

**Which one of these is the most important?**

In 2019 we conducted a survey after the event, to which 156 people responded. Amongst other things we asked: "Which aspect of ZuriHac is most important to you?". It was possible to choose multiple options, so the sum total is above 100%.

| Most important aspect of ZuriHac | number of respondents | % of respondents |
| -------------------------------- | --------------------- | ---------------- |
| Socializing & community          | 119                   | 76%              |
| The keynotes (talks)             | 103                   | 66%              |
| Hacking together on projects     | 75                    | 48%              |
| The beginner/advanced tracks     | 53                    | 34%              |

The social aspects clearly play a huge role in what makes a hackathon fun and rewarding. Incidentally, this is also the hardest part to move online. How do you provide a space for social interactions in an online setting? You've probably worked from home for a while now, and know what I mean when I say Zoom fatigue and lack of feeling engaged.

### Sponsors

As a team of all-volunteer amateurs, we are very cost-effective. But we still rely on sponsors to help finance various things like drinks, coffee machines, BBQ equipment, snacks, t-shirts, scholarships, etc.

Here's the breakdown for the physical event:

- The largest supporter by far is OST, who reserves part of their campus for us. As any conference organiser knows, getting a place is really difficult and expensive. We estimate the value of this to be around 20'000 CHF (you can map this to EUR or USD in your head, it's roughly the same).
- We have companies that give us in-kind sponsorship. For example we have teaching tracks that you could otherwise only experience if your company paid for training sessions.
- The remaining sponsors give us between 1'500 CHF and 4'500 CHF.

But that all concerns the physical event! See below for how we decided to work with companies, in the light of needing much less money for the virtual ZuriHac.

## The goal

So for the online event we want to:

1. Provide a space to do community things. People should be able to just talk, code together, give presentations, form working groups, and make new friends.
2. Stream talks, ideally with a lively Q&A afterwards.
3. Have a classroom-like setup for teaching.
4. Have companies participate in the event.
5. The people demand t-shirts.

There are some thing's that we _don't_ need (but you might): Booking/ticket system, schedule software, event planning, marketing & analytics.

We were agnostic on virtual worlds (2D/3D spaces) for hanging out[^virtualoffice]. I've had superficial experience with [Mozilla Hubs](https://hubs.mozilla.com/), and I've seen [Online Town](https://theonline.town/) being used here and there. But as cool as the idea is, it's not clear how well this scales to 400 people.

## The tools

Let me just spoil the outcome and tell you how we addressed the goals above:

1. [Discord](https://discord.com) as a hub for working on projects, coordinating announcements, chat rooms, voice/video calls, and just general socializing.
2. Zoom for one mob programming event, because we weren't confident of Discord's ability to handle 30 participants per video room[^zoom].
3. YouTube to stream the main talks, as well as the advanced and GHC tracks
4. [StreamYard](https://streamyard.com/) as a "broadcasting studio" for the YouTube streams. It let us stitch together camera feeds, screen sharing, and some decorative stuff[^streamyard].
5. A combination of pre-recorded videos and live lessons in Discord for the beginner's track.
6. [repl.it](https://repl.it) for a beginner-friendly zero-setup Haskell environment, as well as some live coding.
7. Our [website](https://zurihac.com) with the most important event information, as well as the schedule calendar, and a list of projects.
8. A [registration system](https://github.com/zfoh/zureg) that we had built in 2019 for the physical event.

On the organizational side, we've always used Google Docs to coordinate everything: budget, sponsorships, email drafts, a full event plan document, surveys, and much more. This was super valuable, and I'm even referring back to those old notes while writing this post.

### Discord

{{ image(url="/img/zurihac2020/discord-screenshot.jpg") }}

Discord is great, and it mostly comes from how it combines features that you would otherwise need separate apps for. It's being used as a hub for a huge amount of online communities these days, so I don't really need to bang the advertisement drum.

In the past we've maintained a ZuriHac Slack server. This was great for having topical channels, technical discussions, and a way for participants to ping or find each other. IRC also plays an important part in the Haskell community, so many people hung out there too.

What Discord adds to this is:

- Video rooms.
- Channels that are visible by default and can be categorized by a server admin.
- An overview of members and their online status.
- Super fine-grained permissions for admins and moderators. Good
- Extremely easy to use[^easy]

None of these are revolutionary, but the UX works well to create a sense of togetherness and to facilitate "finding the action". To give an example, it's extremely easy to join a group of people in a video chat. You just click on the channel, and you'll immediately see the video feed and get audio. At most you'll spend one more click enabling your own video. Compare this to the weird dance that Zoom does whenever you join via a link.

It's also pretty polished and stable. Of course it's not without its small annoyances:

- For most topics it would make sense to have both a text chat as well as a voice/video channel. Since those are separate, you have to awkwardly create two channels, and you even have to name them differently. They are also grouped differently, so they end up being quite far apart.
- The voice and video is not as glitch free as some of the more mature video conferencing software.
- It likes to use my battery up faster than I would like.

### Streamyard + YouTube

Not much has to be said about YouTube, except oh my god, is the backstage UI for streamers awful. It drove me insane to find any settings in the 2 (or 3?) competing interfaces, even _after_ I had already performed the same action multiple times before. I've gained new respect for YouTube creators, and a small amount of doubt about my own intelligence.

StreamYard[^bbcon] on the other hand is a godsend, it did exactly what we needed, and it did it in the simplest way possible.

Basically it lets you combine people's video feeds (like on a regular Zoom/Google Meet call), slides, and some framing and logos. That then gets streamed through YouTube. You can see the result below, but please don't judge out sense of aesthetics, we're engineers.

{{ image(url="/img/zurihac2020/streamyard-yt.png") }}

It's worth highlighting another amazing aspect of StreamYard: To invite somebody who has never used the platform, you just send them a link. This means that speakers don't need to create an account, and it's trivially simple for them to start presenting.

One minor sad thing was that it supported only up to 720p resolution, but that's fixed this year, so we can stream and record in glorious 1080p.

### repl.it

I already mentioned Zoom, but we also tried to use Visual Studio Code with the LiveShare extension for mob programming. This failed hilariously, because with 30 people the syncing between the editors completely glitched out. I'm sure the extension has matured since, but you know what _did_ work in a pinch? [repl.it](https://repl.it).

We also recommended it as the default environment for the beginner's track, and the lessons were structured such that they didn't require any external libraries that are not pre-installed on repl.it.

Not being able to install additional Haskell libraries on repl.it was a major downside, but because they now added [nix support](https://blog.replit.com/nix), we can theoretically add whatever we want, and even provide participants with fully preconfigured environments!

### Why not X?

We looked at a bunch of other options before settling on the above. A common wish was to exclusively use free software/open source solutions. While I sympathise with that, it simply came down to what was available, stable, and could handle hundreds of simultaneous participants, while still being user friendly.

Here are some alternatives that we considered:

- Twitch - streaming video
- Slack - chat rooms
- Zulip - chat / forum
- Zoom - video conferencing with up to dozens of participants
- Google Meet - video conferencing
- [Sococo](https://www.sococo.com/) - virtual office
- [Matrix](https://matrix.org/) - chat protocol with multiple clients, think IRC
- [Jitsi](https://jitsi.org/) - video conferencing

I'm not going through the pros and cons of each of these, so just know that we tested them, and they were not a good fit. But maybe they might be great for your event.

### Other software you might want to look at

Tooling isn't everything, but here are a couple of random things that seemed promising:

- [Hopin](https://hopin.com/) - Online events platform with integrated video. (StreamYard is part of Hopin now).
- [Miro](https://miro.com/) - Collaborative whiteboard.
- [OBS Studio](https://obsproject.com/) - I hear OBS is excellent, even if a little complex. It basically does what StreamYard does, only with a lot more features, and it's open source.

Apart from that, there are the aforementioned virtual world spaces that mimick meeting in a physical space:

- [Mozilla Hubs](https://hubs.mozilla.com/)
- [Online Town](https://theonline.town/)
- [Virtual Office](https://virtualoffice.team/)

There are probably more, feel free to let me know of any amazing ones that you've come across.

## The plan

The software and platforms above do a lot of the heavy lifting, but it's also worth mentioning how we structured the event.

### The hub

We considered it extremely important to have one central hub, so that it was clear where to start and where most of the action could be found. As I said above, for us this was Discord.

Judging by the repeated questions we got about things that were already on our website, I'd say there almost can't be too much centralisation.

We had a few default channels, and then created new ones by request. There was a big demand for language-specific social channels, topical ones, and of course one for each project.

We also had moderator and organizer specific hidden channels that allowed us to quickly coordinate without having to go through yet another medium.

Just for fun and a sense of scale, here is what our channel list (excluding video/voice) ended up looking like:

```
General
├─ announcements
├─ beginners
├─ find-a-project
├─ helpdesk
├─ intermediates
├─ introduce-yourself
├─ jobs
├─ organizers
├─ post-anything
├─ shop
├─ talk-discussion
└─ welcome

Social
├─ aula
├─ barbecue
├─ coffee-machine
├─ lakeside
├─ lakeside-dutch
├─ lakeside-esperanto
├─ lakeside-french
├─ lakeside-german
├─ lakeside-hindi
├─ lakeside-italian
├─ lakeside-russian
├─ lakeside-spanish
├─ lakeside-voice-text
├─ next-to-the-fridge-that-had-the-free-redbull-and-people-drank-litres-of-that-stuff
└─ photos-from-last-year-so-you-have-fomo

Tracks
├─ advanced
├─ ghc-track-discussion
└─ hallway-announce

Beginner Track
├─ coordination
├─ links-and-instructions
├─ space-invaders
├─ workgroup-1
├─ workgroup-2
├─ workgroup-3
├─ workgroup-4
└─ workgroup-5

Projects
├─ aeson
├─ apecs
├─ arduino-copilot
├─ ariel
├─ asterius
├─ beseder
├─ cardano
├─ carp
├─ contracts4tshirts
├─ convex-optimization-with-dependent-types
├─ curry
├─ cut-the-crap
├─ dependabot
├─ dhall
├─ disco
├─ distros
├─ fficxx
├─ fido2
├─ futhark
├─ gadoc
├─ ghc
├─ gingersprinkles
├─ gnunet
├─ grpc-native
├─ haskell-code-spot
├─ haskell-editor-setup
├─ haskell-katas
├─ haskell-types-in-prolog
├─ hasktorch
├─ hatrace
├─ hip
├─ ide
├─ juvix
├─ mission-control
├─ neuron
├─ nix
├─ opaleye
├─ opt-expect
├─ pandoc
├─ pomelo
├─ servant
├─ smos
├─ spago
├─ talloy
├─ tasklite
├─ tcplugins
├─ tsearch
├─ utf8ãƒâ¼
├─ xmobar
└─ zephyr
```

That's a lot! I think it was quite discoverable, thanks in part to the grouping and the fact that you don't have join channels like you do in Slack.

### The talks

The important stuff is already described in the StreamYard section above. What's worth mentioning is that we wanted to keep the activity withing Discord, so we held the Q&A session there. The first couple of questions were relayed to the speaker by a moderator, and we even had a bit of an upvote system (via Discord emoji reactions) to surface the best questions.

### Sponsors

It turns out that an online event is orders of magnitude cheaper that holding a physical one. This put us in a somewhat embarassing spot, since we have many long-term and very trusting relationships with our sponsors and we're not super keen on amassing a huge war-chest for no reason. [Zürich Friends of Haskell](http://zfoh.ch/) is a not-for-profit organisation, and we have about a year's worth of ZuriHac + general expenses in the bank account.

The easy thing to do was just to offer to reimburse all our sponsors, and get back to them next year.

This is where I want to mention a change for 2021 that I'm a bit prouf of. See, here's the thing:

- We still don't need money.
- But having companies as part of your event is **really great**. It shows people that there are Haskell jobs out there, it lets participants ask questions of companies, it lets companies recruit extremely smart people, and it helps us be an active and interconnected community.

So this year, we decided to have companies on board as partners instead of sponsors. Basically it means that they participate in the event, each in their own way. Some companies will hold Q&As and present a little bit about their industry, others will show off some cool technical thing, and others are gracious enough to hold tutorials and workshops.

And because there is no money involved, I feel a little bit less nervous about standardising company participation to give everybody exactly the same exposure and attention.

### Miscellaneous

Some things worth mentioning for completeness' sake:

We had a **registration system** to control the flow of people a little. Basically this allowed us to send out announcement emails, as well as the Discord invite link. You can definitely do without, but for us the communication is pretty crucial. We often only finalise the schedule very late, so the last announcement email serves as both info about the content, as well as a timely reminder.

We decided to sell **t-shirts** simply because it turns out people _really_ love and want their yearly t-shirt. Jasper set up a shop, and they were printed and shipped by an external company. This was fun (but see below for our bad experience with PayPal), and we committed to donating the money to a Covid-19 related charity, since we didn't need the money, as mentioned above.

## So, how did it go?

It was great! But that's only the subjective experience of the organisers, so let's dive into some details.

- We had around 1000 people register and join Discord.
- Out of those, 500 people sent at least one message. But people can also just join voice/video chats (or watch talks) without having to type a single character, so it's hard to estimate "how many people" we actually were. If I had to make an very rough estimation, I would say 300-400 people were active to a degree that can be considered "participation".
- Some of the talks ended up gathering around 10K views since the event.

### The good

- Due to being online, we had a wider reach, and a lot of people could join ZuriHac for the first time without having to buy a plane ticket.
- Some of the projects were amazing. I only had time for being a passive observer on a couple, but the level of know-how, diversity of domains, and quality of presentations was really impressive[^mission-control].

- People seemed to have a good time and we received positive feedback.
- Q&A sessions after talks are much better! I didn't expect this, but because the questions can be a little async, and the speaker can stick around, the resulting discussion has a lot more depth, and isn't time constrained. Also, questions can be answered by other participants _during_ the talk!
- The community was extremely friendly, actively helpful towards newcomers, and just generally very chill. We had zero spam or moderation issues.
- Virtual events are much cheaper.
- In a lot of aspects they also create _less_ work for the organisers. Not just that, but also somehow less stress and risk. The things that can go wrong IRL might result in people having no food (or worse, no coffee). Online, the worst that can happen is that the content is boring.
- We actually managed to pull it off! We didn't have to cancel ZuriHac. Yay!

### The improvable

**Gathering online** isn't as great as seeing your friends and community in real-life. I'm sure we can make it a little bit better, but honestly it will never be the real thing.

**Engagement** is extremely hard to figure out. My personal feeling is that activity follows a 80-20 rule.

- A small amount of people are participating the most, chatting everywhere, joining projects, impromptu talks, etc. These people are great, because a lot of them also helped out others everywhere, all the time.

- A large majority seemed to enjoy themselves in smaller groups, maybe joining a project or chatting to the people they already knew.
- Finally, a good amount of people were just lurking, or maybe lost interest after a short while. 

I hope that shy people also managed to have some fun and find their little groups or projects. But without spying on everybody, it's kinda hard to know.

**Classes**

It was super hard to figure out how to hold a classroom online! The burden of this fell onto the teachers of the beginner's track, Julie Moroniku and Chris Martin of [TypeClasses](https://typeclasses.com/). They did an amazing job and even prepared a series of videos in advance.

But there was definitely a feeling of herding cats, and I think as organisers we failed to give a clearer structure to the participants. Overall, I think a bunch of people got good value out of it, but I wish it had been more. The physical class in 2018 was also held by Julie and it was insanely full and popular, so we have a high bar to aspire to.

**T-shirts:** We had a whole PayPal Odyssey that I was luckily less involved in. Of course they blocked our account (what else does PayPal do) after we had sold a couple thousand bucks worth of t-shirts. Solving this took more than half a year, but it's really not worth discussing in detail.

### Things we're doing differently in 2021

We're sticking to the general approach we took in 2020. There are a couple of important things we've ironed out though.

- sponsors -> partners
- streamyard has 1080p now. yay!
- no tshirts, screw you paypal
- no complicated instructions - simplify

## Final notes and learnings

**Instructions for participants:**

Don't make up new concepts or complicated five step processes for participating in workshops, streams, etc. With a couple of different tools it's already hard enough to sheperd people into the right places at the right time. Our rule of thumb was that if you can't explain it in a sentence, it's too high-maintenance.

Examples from ZuriHac:

- "If you are a project maintainer, ask in *#helpdesk* to have text and video channels created, and then people can join you there."
- The talks are streamed, so you can watch them live. We publish them afterwards.
- The Q&A after a talk takes place in Discord, and questions will be relayed to the speaker. (YouTube chat was disabled to make this even clearer)

I've been to online events that made it super confusing to know how to even participate, and it's very tempting to overdo it with the rules and instructions. But nobody reads them, so keep things simple!

**Misc:**

Have a **registration system**, even when the tickets are free. It's useful to keep track of interest, by seeing how many people intend to attend. It's also great to be able to send people announcements emails.

**Definitely send a survey** afterwards so that you can gauge how people felt, what was important to them, and how they rate individual aspects. Without this it's really hard to know what worked and what didn't. We failed to do that in 2020 and I hope we can make up for it this year.

**Test the setup** beforehand. For example we testes the streaming setup with every speaker individually. No issues popped up because StreamYard worked so well, but it bought us some peace of mind.

Have a **runbook**. We created a Google doc with super dumb instructions of what to do at which time, and who's responsible for it. Again, our event isn't crazy complex, but it's still easy to get lost in a dozen other things, and in the rush I can't always think straight. Having a runbook is good advice even for physical events.

**Have a plan**

![captain obvious](/img/zurihac2020/capt-obv.gif)

If you've ever organised anything, you're mumbling "well duh" to yourself right now. But we're a bunch of nerds, so having a structured approach to an unforseen event like the pandemic was very helpful. Here's a screenshot of our "Plan B" document:

> ![planb](/img/zurihac2020/planb.png)

Here an excerpt is how we took a structured approach to the question "How the hell do we even hold this event online??":

> We are solving two separate problems: broadcasting (one presenter, many viewers) and people p2p communicating in groups of various sizes. This will need something that is both video based and text based.
>
> Criteria that we want from a combination of tools:
>
> - Easy to set up multiple rooms.
> - Should have good quality, even when scaled to a lot of participants.
> - Should help foster some sense of presence / community.
> - Has to work on Linux, Windows, and Mac.

Very scientific. But it gave us a lot of clarity, after the initial confusion. It might not be clear from the context, but just canceling the hackathon was the default alternative outcome.

## The End

Well, not quite! You can join us at [this year's ZuriHac](https://zurihac.com) if you've ever had any inclination to learn (or continue practicing) Haskell. We're nice ~~and we have cookies~~!

---

[^organisers]: The other organisers are [Jasper Van der Jeugt](https://jaspervdj.be/), Prof. ‪Farhad Mehta, and Bieke Hoefkens. In addition to that we rely on a dozen volunteers for the physical event.

[^size]: I found this cute reddit post from 11 years ago that announces ZuriHac with 70+ people as the "[largest Haskell hackathon ever](https://old.reddit.com/r/haskell/comments/bd55q/zurihac_this_week_largest_haskell_hackathon_ever/)".

[^virtualoffice]: This year our friends at digitally induced have built their own [Virtual Office](https://virtualoffice.team/), so we'll definitely keep an eye on that one.

[^zoom]: It's supported, but it can get glitchy or laggy or generally weird. At least that was our superficial experience before the event, so we didn't want to risk it.

[^streamyard]: You can have a look at the [2020 videos](https://www.youtube.com/watch?v=kCpQ4aTzlis&list=PLiU7KJ5_df6aZbNfh_TUJt-6w9N3rYkTX) to see what I mean.

[^bbcon]: Shout-out to our role-models at [!!Con](https://bangbangcon.com/), where I first saw it in use.

[^easy]: You might disagree with something here, but I'm personally keen on getting newcomers into the language, and it's not always productive to require them to jump through hoops to join your community. Maybe get them into IRC and Emacs _after_ you've hooked them on the joy of your language.



[^mission-control]: I think my favourite was an intro to [mission control software](https://youtu.be/26ViUXHtah0)!
