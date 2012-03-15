class @Plateau
	constructor: (paper) ->
		@paper = paper

	drawBoard: ->
		@paper.rect(0, 0, 320, 200)

	addCell: (cell) ->
		cell.draw(@paper)

	drawCells: () ->
		for x in [0..9]
			for y in [0..9]
				@addCell(new Cell(x, y))
				
	draw: () ->
		@drawBoard()
		@drawCells()

class @Cell
	constructor: (x, y) ->
		@x = x
		@y = y

	draw: (paper) ->
		rect = paper.rect(@x*32, @y*20, 32, 20)
		rect.attr("fill", "white")
		console.log rect
		rect

	click: () ->
		# @rect.click () =>
		# 	@rect.attr("fill", "red")