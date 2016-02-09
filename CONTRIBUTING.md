# Contributing to Draft

You'd like to contribute to Draft, that's awesome!

The following is here to help you help. It contains guidelines that all of us follow.

### Code of Conduct and License

By participating (submitting pull requests or issues, commenting on those, editing the wiki, …) to this project you are excepted to uphold our [Code of Conduct](/CODE_OF_CONDUCT.md).

By contributing artwork, code or documentation to this project, you grant Draft a license to distribute your contribution under the terms of the [GNU Affero General Public License version 3](/LICENSE) or any later version.

### I Found an Issue

If you encountered a bug on draft's website, spotted a bug in the source code or a mistake in the documentation, please open an issue after performing a [quick search](https://github.com/draftli/draft/issues?q=is%3Aissue+) in our bug tracker.

When submitting an issue, please include all the details that might be relevant.

Example for an issue with the website:

* Tell us what you did, what happened and what should have happened instead.
* Give the webpage address (URL) at which you encountered the issue and explain how we could reproduce the issue.
* Give the version of the website (copy-paste it from the website's footer, it looks like this: `v0.1.2/a51dd1f`), the operating system and version you're using, the web browser and version you're using.
* If you have any idea how we could fix it, please tell us.

### I Want a Feature

If you think Draft misses a feature, please open an issue. Don't hesitate to thoroughly describe your idea - the better the description, the better the discussion. For example you could explain why you need it (problems it fixes, use cases, …), how it would fit (the project's goals, the UI, …), how it could be implemented. These are just pointers, you don't actually have to answer all these questions.

### I Want Better Doc

Please help us improve the documentation. Open issues, comment on commits, submit pull requests, try to install and run the project on exotic operating systems… anything helps!

### I Want to Contribute

Pull Requests are most welcome, even if you are a beginner. We will do our best to guide you through the PR process, from (beginning) choosing an issue/feature to fix/implement to getting it merged (end).

### Coding Rules and Guidelines

#### Organization

* Work on branches and submit PRs. Nobody commits directly to master.
* We care a lot about testing. Good PRs come with good tests.
* 100% documentation. Everything is documented.
* Browser support: TBD

#### Elixir

* [Dogma](https://github.com/lpil/dogma) is the linter used to enforce code style consistency. We also use [Credo](https://github.com/rrrene/credo) for static code analysis, but its usage is not enforced here.
* [ExUnit](http://elixir-lang.org/docs/stable/ex_unit/ExUnit.html) is the unit testing framework of choice.
* [Coverex](https://github.com/alfert/coverex) is used for coverage reports.
* Travis runs all of these.

#### SASS

* [Style guide](https://github.com/airbnb/css#sass)

#### JavaScript

* ES2015 transpiled to ES5.
* [Style guide](https://github.com/airbnb/javascript/#airbnb-javascript-style-guide-) enforced by eslint.
