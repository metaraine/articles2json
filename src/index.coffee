path = require('path')

# https://regex101.com/r/xR0qV9
r = /(.*)\s+\((\d*(?:,\s*\w*\s*\d*)?)\)[\s-.]*(.*?)(?:\. ([^\n)]*?), (.*)[:;]\s*(.*?))?[.\s]*(?:\((recommended)\))?$/i

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

		if matches[4] then articleObj.city = matches[4]
		if matches[5] then articleObj.state = matches[5]
		if matches[6] then articleObj.publisher = matches[6]
		if matches[7] then articleObj.recommended = matches[7]?

		# return an array of article objects
		articleObj

