Draft — independent blog federation
===================================

**Table of Contents**

* [The problem](#the-problem)
* [A solution?](#a-solution)
  * [Goal](#goal)
  * [As a blogger, you should](#as-a-blogger-you-should)
      * [provide one or more feeds URLs containing your full articles](#provide-one-or-more-feeds-urls-containing-your-full-articles)
      * [have the possibility to provide a stylesheet for each of your feed](#have-the-possibility-to-provide-a-stylesheet-for-each-of-your-feed)
      * [help us make sure we don't mess with your blog's SEO](#help-us-make-sure-we-dont-mess-with-your-blogs-seo)
      * [decide how much the platform shows](#decide-how-much-the-platform-shows)
      * [decide which blog posts are used by the platform](#decide-which-blog-posts-are-used-by-the-platform)
  * [As a reader, you should be able to](#as-a-reader-you-should-be-able-to)
      * [fav an article](#fav-an-article)
      * [navigate/filter content through tags, sorting options](#navigatefilter-content-through-tags-sorting-options)
      * [do full-text search on articles contents](#do-full-text-search-on-articles-contents)
      * [get recommended articles based on your](#get-recommended-articles-based-on-your)
      * [be able to follow people](#be-able-to-follow-people)
      * [recommend an article](#recommend-an-article)
      * [recommend and article to someone](#recommend-and-article-to-someone)
  * [As a software project, it should](#as-a-software-project-it-should)
      * [be free software](#as-a-software-project-it-should)
      * [foster a welcoming community](#as-a-software-project-it-should)
      * [favor accessibility](#as-a-software-project-it-should)
      * [use good practices](#as-a-software-project-it-should)
      * [be community-driven](#as-a-software-project-it-should)
* [FAQ](#faq---frequently-asked-questions)
    * [I already have a feed aggregator?](#i-already-have-a-feed-aggregator-and-i-love-it-why-would-i-use-this-thing)
    * [Isn't it reinventing Google Reader?](#isnt-it-reinventing-google-reader-which-was-discontinued-because-nobody-cares-about-xml-feeds-anymore)
    * [So it's reinventing Feedly?](#so-its-reinventing-feedly)
    * [Yet another content aggregation websites hurting authors?](#isnt-it-reinventing-google-news-or-yet-another-content-aggregation-websites-hurting-the-actual-authors)
    * [Can I contribute?](#can-i-contribute)
    * [Could it take off?](#do-you-really-think-this-idea-could-take-off)
    * [How can I help?](#how-can-i-help)
* [High-level technical aspects](#high-level-technical-aspects)
    * [Elixir/Phoenix](#high-level-technical-aspects)
    * [PostgreSQL](#high-level-technical-aspects)

## The problem

A few days ago I came across [Anywhere but Medium](http://scripting.com/liveblog/users/davewiner/2016/01/20/0900.html) by Dave Winer. It resonated with my feelings toward Medium. I had written a few posts there but quickly felt more comfortable hosting an "independent"<sup id="a1">[1](#f1)</sup> blog on GitHub. It felt more like I was in charge, I could write in the format of my choice from my favorite text editor, I could create the design I had in mind or choose from the thousands of existing themes and choose one of the hundreds of blog engine, I had access to advanced analytics, but it came with the cost of being "out of the loop." Having your own independent blog makes your content somewhat confidential compared to having it on an extremely popular and mainstream platform such as Medium.

I didn't close my Medium account because I quite liked their reading recommendations. Once a day I receive between 5 and 15 blog posts in a single email, out of which I usually save 2 or 3 to read later. (I open the email, save directly some links to my "readability" app and read them on it. Never actually going to Medium's website or mobile app isn't intentional.) While I benefit from this service, relying solely on it would be a huge mistake because a lot of interesting blog posts are (also) written outside of Medium. They are scattered all over the web. *The eternal silence of these unknown blog posts frightens me.*

Medium's success can probably be justified by some UX/UI/technical achievements (leaving aside funding, marketing, attracting famous authors, etc):

* Web writing done right.
* Content discovery done right.
* Awesome reading experience.

## A solution?

Thinking about Dave Winer's post and my own shady relationship with Medium, I thought we could build a centralized but open platform leveraging the best of both worlds.

Here is a first WIP non-technical specification.

### Goal

* To give more visibility to independent blogs with regards to content, authors and their blogs themselves.
* To create an awesome reading experience.
* Content discovery is key.
* Perhaps also to take a stab at solving writing, but it's not a priority.

### As a blogger, you should

#### provide one or more feeds URLs containing your full articles

* I insist on full articles. It will allow Draft to better match content and readers. We will, however, provide an option disallowing Draft from showing your full content and displaying an excerpt (*aka article summary*) instead:
    * via an excerpt tag (it should be customizable enough to let you use the one you already have in place: `<!-- more -->`, `%READMORE%`, ...)
    * via the feed itself (have your feed include both `entry > summary` and `entry > content`)
    * via two feeds, one providing the full content, another providing articles summaries (keep them in sync!).
    * If you're still thinking "full articles in my feed? Never!", keep in mind Draft does not reveal your feed URL. Draft polls your feed and works from here. You could, for example, setup your feed at an unlikely URL (security by obscurity). Also, keep in mind that if you provide summaries for each of your posts, you can choose to only display these on the platform.
* The more metadata your feed contains the better (`<summary>`, `<category>`, etc).
* It does not need to be the feed present on your blog's frontpage. You could for example provide a feed corresponding to a certain category of your blog. Or use a "summary-only" feed on your blog but setup a "hidden" feed for Draft.
* You will, however, need to prove that this feed actually belongs to you. I envision several options, some are easier for the bloggers, others are easier to implement in the platform:
    * UUID to place in an article content
    * Custom XML tag in the feed
    * File at domain root
    * TXT DNS Record in your blog's DNS entries

#### have the possibility to provide a stylesheet for each of your feed

* You probably want readers to have an optimal experience when reading your content (or articles summaries) on the platform.
* Technically, an idea could be automatically prefixing the markup we got from the feed and automatically prefixing the CSS you provide. This way you can test your stylesheet locally, and you (probably?) cannot do nasty things on Draft.

#### help us make sure we don't mess with your blog's SEO

* Canonical links are non-negotiable, it will be built in from the beginning.
* Opt-in robots.txt settings to disable spider crawling/indexing of your content.
* The platform will not re-syndicate the feeds your provide with links to the platform. It could however provide content-based feeds, syndicating e.g. all content tagged `foo`, yesterday's most popular articles, ...

#### decide how much the platform shows

* You choose if the full content is displayed on the platform or only the summary. Seeing how many people are already cross-posting from their blog to Medium or other websites (DZone, etc), I think allowing Draft to display your full content should not be regarded as a bad idea.
* You choose if you set a time limit on this setting, e.g. "full content for the first 7 days after publication and then summaries" or "summaries for the first 14 days and then full content."
* Fulltext search will still be available on your content no matter how much of it is shown on the platform. Search results won't include the actual text for summary-only articles.

#### decide which blog posts are used by the platform

A sane default would be to use whatever is on the feed.

* Opt-out of auto-publishing, i.e. switch to manually publishing items.
* Disable feed polling without deleting the feed from the platform (e.g. if you want to take a break).

### As a reader, you should be able to

#### fav an article

* It adds the original article URL to your private favorite list.
* Use case: I read it, I liked it, it's my way of saving the link as an alternative to bookmarking it.

#### navigate/filter content through tags, sorting options

* Show articles with "JavaScript" tag
* Show the most recent articles with both "JavaScript" and "rant" tags
* Show the most popular articles tagged "Beyonce"

#### do full-text search on articles contents

* We could highlight the matches in the full-posts published articles,
* highlight the matches in summaries,
* indicate the presence of full-text matches for summarized articles as "this article matches your query."

#### get recommended articles based on your

* interests (opt-out): the tags/categories you're subscribed to.
* reading history (opt-out): we log what you read and suggest things based on what people who read the same stuff as you do also read.

* Nothing new here, except we have no intent of actually tracking you. Wanna use a pseudonym instead of your real name? Sure! Don't feel comfortable reading articles using the same account as the one you use to publish content? We don't care! Still unsure and prefer to opt-out from the recommendation system? No problem, we'll stop and delete what "learned"!

#### be able to follow people

* Follow a blogger/stream.
* Follow other readers who have similar interests to get better reading recommendations based on what they read.

#### recommend an article

* Your recommendations will be publicly displayed on your profile.

#### recommend and article to someone

* They will get an in-site notification if their email is associated with an account on the platform, an email instead.

### As a software project, it should

* be free — as in 'free speech'.
* be an open and welcoming technical community.
* do its best with regards to web accessibility.
* use good software engineering practices such as testing, CI, ...
* have a community-driven product approach, which means that users take part to most product decisions by both *submitting suggestions/feature requests and *consultation process typically in the form of regular surveys about the direction to take, features priority, etc. The technical team has the last word but they pledge to contribute to the best of their ability to the project *for the community, *for the ideal goal of the project, *to create quality software (i.e. sometimes prioritizing refactoring over feature development).

## FAQ - Frequently Asked Questions

#### I already have a [feed aggregator](https://en.wikipedia.org/wiki/Feed_aggregator) and I love it, why would I use this thing?

That's good to hear, we share a common interest in XML feeds! We're not trying to make you stop using your aggregator. Thanks for your interest in this project, while you're at it take a look at the feeds Draft provide, perhaps you'll find one relevant to your interests.

Please note that Draft and your feed aggregator can coexist. They don't have the exact same purpose and don't target the exact same people.

#### Isn't it reinventing Google Reader, which was discontinued because nobody cares about XML feeds anymore?

Not really. Google Reader was a feed aggregator: the user was in charge of adding other people/org feeds. Also, it was old and ugly and didn't receive enough love from Google to keep up with their standards.

#### So it's reinventing Feedly?

It's similar in some ways, yes. I must say I haven't spent a lot of time researching Feedly, but it looks like they don't do much to promote authors.

#### Isn't it reinventing Google News or yet another content aggregation websites hurting the actual authors?

Not really. There's a huge difference in my opinion between a service that aggregates all it can find and a service that aggregates on a volunteer author basis. We'd like Draft to be beneficial to both bloggers and readers.

#### Can I contribute?

Sure, please do! [CONTRIBUTING.md](/CONTRIBUTING.md) is a great place to start!

#### Do you really think this idea could take off?

It doesn't hurt to try. Worst case scenario we'll have learned a lot of things.

#### How can I help?

A few ideas, pick the ones matching your skillset and the time you'd like to invest:

* [ ] Share this project
* [ ] Discuss the idea on-line or blog your thought about it
* [ ] Fix the typos/grammar in this file
* [ ] Suggest modifications/additions about any aspect of the project (the goal, features, technical things, project management ideas, help us with legal aspects (ToS, …), etc).

## High-level technical aspects

* The back-end will be written in Elixir using the Phoenix framework.
* The front-end is still TBD (open to suggestions!).
* ML aspects: TBD (open to suggestions!).
* Database: PostgreSQL

---

##### Footnotes

<b id="f1">1</b> I'm using quotes because I don't want to debate what qualifies as *independent blog*. Some would say it means hosted on a server you rent. Some would say it's only independent if you're hosting it on your home server. Some would say it cannot be independent unless you host it at home and you are your own ISP. Others would argue about p2p networks. In the context of this text, take it as "not **hosted** on a mainstream **blogging platform** such as Medium, Blogger, WordPress.com, etc." [↩](#a1)
