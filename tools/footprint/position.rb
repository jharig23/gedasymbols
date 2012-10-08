class Position
  require 'ruby-units'

  attr x: Unit("0 mil"), y: Unit("0 mil")

 def element_name
    "Position"
  end

  def render_with(renderer)
    renderer << [x, y]
  end
end
