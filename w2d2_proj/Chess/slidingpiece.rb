module SlidingPiece


  Directions = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0],
    diag_up_right: [1,1],
    diag_down_right: [-1,1],
    diag_up_left: [1,-1],
    diag_down_left: [-1,-1]
  }

  def MOVES(board,position,move_dir)
    valid_moves = []
    new_x, new_y = 0,0
    move_dir.each do |direction|
      until new_x > 7 || new_x < 0 || new_y > 7 || new_y < 0
        new_x = position[0] + direction[0]
        new_y = position[1] + direction[1]
        if board[new_x][new_y].is_a? NullPiece
          valid_moves << [new_x, new_y]
        else
          break
        end
      end
    end
     valid_moves
  end


end
