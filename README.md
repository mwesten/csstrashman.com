## csstrashman.com

A simple web interface for the [CSS
Ratiocinator](https://github.com/begriffs/css-ratiocinator).  Allows
you to refactor CSS for your site, compare the changes, and download
a new stylesheet.

## Running locally

1. Install [PhantomJS](http://phantomjs.org/)
1. `git submodule update --init` for dependencies
1. `rake db:create && rake db:migrate`
1. `rake jobs:work` to start the ratiocinating workers

## Deploying to Heroku

This app requires a vendored PhantomJS on Heroku, so you'll need to
enable multiple buildpacks. Before pushing to a new Heroku instance,
run this:

    heroku config:add BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
    heroku config:set PATH=bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin:vendor/phantomjs/bin
