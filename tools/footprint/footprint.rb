require 'ruby-units'

require_relative 'lib/attr'
require_relative 'lib/units'
require_relative 'lib/quoted.rb'
require_relative 'lib/helper'

require_relative 'renderer'
require_relative 'position'
require_relative 'element'
require_relative 'pad'
require_relative 'pin'
require_relative 'line'
require_relative 'arc'


renderer = Renderer.new

e = Element.new
e.add_child(Pad.new)
e.add_child(Pad.new)
e.add_child(Pin.new)
e.add_child(Line.new)
e.add_child(Arc.new)
renderer.render(e)

puts "rendered element:"
puts renderer.rendered_element
