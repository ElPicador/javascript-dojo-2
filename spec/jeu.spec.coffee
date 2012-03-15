describe "le jeu", () ->
	beforeEach ->
		@paper = Raphael(10, 10, 320, 200)
		@plateau = new Plateau(@paper)
		spyOn(@paper, "rect").andCallThrough()

	describe "le plateau", () -> 
		it "doit dessiner le plateau", () ->
			@plateau.drawBoard()
			expect(@paper.rect).toHaveBeenCalledWith(0, 0, 320, 200)

		it "doit afficher une case sur la plateau", () ->
			@plateau.addCell( new Cell(0,0) )
			expect(@paper.rect).toHaveBeenCalledWith(0, 0, 32, 20)

		it "doit afficher une case sur l'emplacement (1,1) du tableau", () ->
			@plateau.addCell( new Cell(1, 1) )
			expect(@paper.rect).toHaveBeenCalledWith(32, 20, 32, 20)

		it "doit afficher toutes les cellules", () ->
			spyOn @plateau, 'addCell'
			
			@plateau.drawCells()

			expect(@plateau.addCell).toHaveBeenCalledWith(new Cell(0, 0))
			expect(@plateau.addCell).toHaveBeenCalledWith(new Cell(0, 1))
			expect(@plateau.addCell).toHaveBeenCalledWith(new Cell(9, 9))

	describe "la cellule", () ->
		beforeEach ->
			@cell = new Cell(0,0)

		it "doit se coloriser en noir quand on clique dessus", () ->
			toto = @cell.draw(@paper)
			spyOn(toto, "attr")
			@cell.click()
			expect(toto.attr).toHaveBeenCalledWith("fill","red")