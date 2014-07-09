
/*
 * Dependencies
 */
var Server, Twit, express, fs, http, path, url, _;

_ = require('lodash');

express = require('express');

http = require('http');

path = require('path');

url = require('url');

fs = require('fs-extra');

Twit = require('twit');

Server = (function() {
  Server.prototype.app = null;

  Server.prototype.server = null;

  function Server(options) {
    _.extend(this.options, options);
    this.server_port = process.env.PORT || 8080;
    if (process.argv[2] === 'dev') {
      this.public_path = path.join(__dirname, '../.public');
    } else {
      this.public_path = path.join(__dirname, '../public');
    }
    this.init();
  }

  Server.prototype.init = function() {
    return this.initTwit((function(_this) {
      return function() {
        return _this.initServer(function() {
          return console.log('Server is ready on port ' + _this.server_port);
        });
      };
    })(this));
  };

  Server.prototype.initTwit = function(callback) {
    if (callback == null) {
      callback = function() {};
    }
    this.twit = new Twit({
      consumer_key: 'CsVKGw4s9iuNZS5iBSAsDsg82',
      consumer_secret: 'oEwocQr7u1Ougrv0lZJG2Lp3a6BRdW90dra0mHBwT3sMd0c4Lu',
      access_token: '14946209-66LNceUHlvwBwX1WExZziG9zLaO7wjMlTsvw877vp',
      access_token_secret: 'jC1sS0fz6CMtsbRUGnuGV5Rbrko0r1xxaP0ZnIsykF7oA'
    });
    return callback();
  };

  Server.prototype.initServer = function(callback) {
    if (callback == null) {
      callback = function() {};
    }
    this.app = express();
    this.app.use(express.bodyParser());
    this.app.use((function(_this) {
      return function(req, res, next) {
        console.log("%s %s", req.method, req.url);
        return next();
      };
    })(this));
    this.app.use('/twit/search', (function(_this) {
      return function(req, res, next) {
        return _this.twit.get('search/tweets', req.query, function(err, data, response) {
          return res.json(data);
        });
      };
    })(this));
    this.app.use('/twit/user', (function(_this) {
      return function(req, res, next) {
        return _this.twit.get('statuses/user_timeline', req.query, function(err, data, response) {
          return res.json(data);
        });
      };
    })(this));
    this.app.use(express["static"](this.public_path));
    this.app.use((function(_this) {
      return function(req, res, next) {
        return res.sendfile('html/index.html', {
          root: _this.public_path
        });
      };
    })(this));
    return this.server = http.createServer(this.app).listen(this.server_port, function() {
      return callback();
    });
  };

  return Server;

})();


/*
 * Exports
 */

module.exports = Server;
