(function() {
  var path, r;

  path = require('path');

  r = /(.*)\s+\((\d*(?:,\s*\w*\s*\d*)?)\)[\s-.]*(.*?)(?:\. ([^\n)]*?), (.*)[:;]\s*(.*?))?[.\s]*(?:\((recommended)\))?$/i;

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
        articleObj.city = matches[4];
      }
      if (matches[5]) {
        articleObj.state = matches[5];
      }
      if (matches[6]) {
        articleObj.publisher = matches[6];
      }
      if (matches[7]) {
        articleObj.recommended = matches[7] != null;
      }
      results.push(articleObj);
    }
    return results;
  };

}).call(this);
