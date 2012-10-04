class Position
  require 'ruby-units'

  attr_accessor :x, :y
  
  def initialize (x = Unit("0mil"), y = Unit("0mil"))
    self.x = x
    self.y = y
  end

  def element_name
    "Position"
  end

  def render_with(renderer)
    renderer << [x, y]
  end
end
