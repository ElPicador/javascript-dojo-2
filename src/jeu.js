(function() {

  this.Plateau = (function() {

    function Plateau(paper) {
      this.paper = paper;
    }

    Plateau.prototype.drawBoard = function() {
      return this.paper.rect(0, 0, 320, 200);
    };

    Plateau.prototype.addCell = function(cell) {
      return cell.draw(this.paper);
    };

    Plateau.prototype.drawCells = function() {
      var x, y, _results;
      _results = [];
      for (x = 0; x <= 9; x++) {
        _results.push((function() {
          var _results2;
          _results2 = [];
          for (y = 0; y <= 9; y++) {
            _results2.push(this.addCell(new Cell(x, y)));
          }
          return _results2;
        }).call(this));
      }
      return _results;
    };

    Plateau.prototype.draw = function() {
      this.drawBoard();
      return this.drawCells();
    };

    return Plateau;

  })();

  this.Cell = (function() {

    function Cell(x, y) {
      this.x = x;
      this.y = y;
    }

    Cell.prototype.draw = function(paper) {
      var rect;
      rect = paper.rect(this.x * 32, this.y * 20, 32, 20);
      rect.attr("fill", "white");
      console.log(rect);
      return rect;
    };

    Cell.prototype.click = function() {};

    return Cell;

  })();

}).call(this);
