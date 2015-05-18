path = require('path')

# https://regex101.com/r/xR0qV9
r = /(.*)\s+\((.*)\)\s+-\s+(.*(?!\(recommended\)).{13})(?:\((recommended)\))?$/i

module.exports = (input)->

	# get all articles on each line and remove the extraneous path information
	articles = input
		.split('\n')
		.map (filepath)->path.basename(filepath, path.extname(filepath))

	# extract the author, title, year, and rec. of each article
	for article in articles
		matches = article.match(r)
		articleObj =
			author: matches[1]
			year: 	+matches[2]
			title: 	matches[3].trim()

		if matches[4]
			articleObj.recommended = matches[4]?

		# return an array of article objects
		articleObj

