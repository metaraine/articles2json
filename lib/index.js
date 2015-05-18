(function() {
  var path, r;

  path = require('path');

  r = /(.*)\s+\((.*)\)\s+-\s+(.*(?!\(recommended\)).{13})(?:\((recommended)\))?$/i;

  module.exports = function(input) {
    var article, articleObj, articles, i, len, matches, results;
    articles = input.split('\n').map(function(filepath) {
      return path.basename(filepath, path.extname(filepath));
    });
    results = [];
    for (i = 0, len = articles.length; i < len; i++) {
      article = articles[i];
      matches = article.match(r);
      articleObj = {
        author: matches[1],
        year: +matches[2],
        title: matches[3].trim()
      };
      if (matches[4]) {
        articleObj.recommended = matches[4] != null;
      }
      results.push(articleObj);
    }
    return results;
  };

}).call(this);
