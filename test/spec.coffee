assert = require('chai').assert
articles2json = require '../lib'

describe 'articles2json', ->

	it 'should convert an article in the correct format to json', ->
		assert.deepEqual articles2json('Cozolino, L. J. (2002) - Interpersonal Trauma.pdf'), [
			author: 'Cozolino, L. J.'
			year: 2002
			title: 'Interpersonal Trauma'
		]

	it 'should parse "recommended"', ->
		assert.deepEqual articles2json('Kumin, I. (1996) - Trauma and Enactments (recommended).pdf'), [
			author: 'Kumin, I.'
			year: 1996
			title: 'Trauma and Enactments'
			recommended: true
		]

	it 'should ignore leading paths', ->
		assert.deepEqual articles2json('./04.20/Cozolino, L. J. (2002) - Interpersonal Trauma.pdf'), [
			author: 'Cozolino, L. J.'
			year: 2002
			title: 'Interpersonal Trauma'
		]
