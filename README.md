# biojava.github.io
The new location of the BioJava homepage, accessible at either http://biojava.org or http://biojava.github.io.

## Running Locally

The website uses [Jekyll](https://jekyllrb.com/) to generate static HTML content from Markdown. This is done automatically for the master branch of github.com/biojava/biojava.github.io, but can also be run locally for testing.

### Installation

Compiling the site locally requires ruby. Install the following gems:

```
gem install github-pages
```

The `github-pages` plugin bundles all gems required for hosting, including the jekyll executable. You can immediately start a server for the content with

```
jekyll serve --incremental
```

Note that we aren't yet using bundler ([recommended by github](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/#keeping-your-site-up-to-date-with-the-github-pages-gem)), but this would be a nice feature to configure.

## Conversion from Mediawiki

All content was ported from the prior BioJava wiki following @peterjc 's [instructions and scripts](https://github.com/peterjc/mediawiki_to_git_md).

## Template

We use the [HTML5 UP](http://html5up.net) template.

