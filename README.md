# TweetDeck Assignment

## Requirements
- Node.js
- NPM
- Bower

## Installation
`git clone` this repo. Run `npm install` and `bower install`.

## Grunt

### Development
Running `grunt dev` will compile files from `/server` and `/public` into `./server` and `./public`. It will also launch a watcher to automaticaly compile any changes on the fly. There is no watchers on `/public/bower_components` folder, so when installing new Bower components, run the Grunt command again.

A local web server will be available at [`http://localhost:8080`](http://localhost:8080)

### Production
Running `grunt dist` will run the same compiling tasks as `grunt dev` but will then compress and package those compiled files into the `/dist` folder ready to be push to the production server.

The production distribution is hosted on Heroku at [`http://appdirectassignment.herokuapp.com/`](http://appdirectassignment.herokuapp.com/)


## Project struture

### Server
- Serve static assets without any processing whatsoever.
- Act as a proxy for the Twitter REST API.
- Serve the index.html file to all routes that weren't handle by the static middleware or the proxy routes.

### Public
- Backbone
- Marionette
- Underscore JST templating
- Bootstrap (limited use)
- Fontello (icon font)
- RequireJS
- Sass

## CoffeeScript
The decision to use CoffeeScript for this project was a based on the time restriction for the assignment. I evaluated in the past that I tend to have a 10% to 15% efficiency boost when I use CoffeeScript over JavaScript.