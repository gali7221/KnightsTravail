
class KnightPathFinder

  attr_reader :start_pos, :visited_positions

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos, [1,2]]
    # Write an instance method #new_move_positions(pos); this should call the ::valid_moves class method,
    #but then throw out any positions that are already in @visited_positions.
    #It should then add the remaining new positions to @visited_positions and return these new positions.
  end
  #VALID MOVES SHOULD BE A CLASS METHOD.
  def find_path
    #find path to end position
  end

  def new_move_positions(pos)
    valids = KnightPathFinder.valid_moves(pos)

    #valid moves is an array of moves
    #remove visited positions from that array of moves
    new_valids = valids.reject! do |position|
      visited_positions.include?(position)
    end

    visited_positions << new_valids #
    new_valids
  end

  MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def self.valid_moves(pos)
    valids = []
    MOVES.each do |r, c|
      row, col = pos
      row += r
      col += c
      unless row < 0 || row > 7 || col < 0 || col > 7
        valids << [row, col]
      end
    end
    valids
  end

  def build_move_tree
    # q = [@start_pos]
    root_node = PolyTreeNode.new(start_pos)

    # build tree with queue structure
    queue = [root_node]
    until queue.empty?
      el = queue.shift
      el.new_move_positions.each do |new_moves|

      queue << new_moves
    #
    end

  end

end







kpf = KnightPathFinder.new([0,0]) #position I'm starting at
kpf.find_path([2,1]) #returns [][0,0], [2,1]]

def bfs(target_value)
  queue = [self] # this is initial queue with your root value

  until queue.empty?
    # shift the first element of the queue
    el = queue.shift

    return el if el.value == target_value
    el.children.each do |child|
      queue << child
    end
  end
  nil
end
