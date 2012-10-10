require 'ruby-units'

require_relative 'lib/attr'
require_relative 'lib/units'
require_relative 'lib/quoted.rb'
require_relative 'lib/helper'

require_relative 'pcb-element'
require_relative 'renderer'
require_relative 'position'
require_relative 'element'
require_relative 'pad'
require_relative 'pad-line'
require_relative 'pin'
require_relative 'line'
require_relative 'arc'


renderer = Renderer.new

e = Element.new(:name => "Test")

pad_line_params = {
  :number_of_pads => 7,
  :pad_thickness => Unit("8 mil"),
  :pad_clearance => Unit("8 mil"),
  :pad_mask_width => Unit("8 mil"),
  :pad_length => Unit("15 mil"),
  :pad_2_pad_distance => Unit("15 mil")}

e.add_child(PadLine.new(pad_line_params.merge(:p1 => Position.origin,
                                              :p2 => Position.new(x: Unit("0 mil"), y: Unit("4 mm")),
                                              :first_pad_number => 1)))
e.add_child(PadLine.new(pad_line_params.merge(:p1 => Position.new(x: Unit("0 mm"), y: Unit("4 mm")),
                                              :p2 => Position.new(x: Unit("4 mm"), y: Unit("4 mm")),
                                              :first_pad_number => 8)))
e.add_child(PadLine.new(pad_line_params.merge(:p1 => Position.new(x: Unit("4 mm"), y: Unit("4 mm")),
                                              :p2 => Position.new(x: Unit("4 mm"), y: Unit("0 mm")),
                                              :first_pad_number => 15)))
e.add_child(PadLine.new(pad_line_params.merge(:p1 => Position.new(x: Unit("4 mm"), y: Unit("0 mm")),
                                              :p2 => Position.new(x: Unit("0 mm"), y: Unit("0 mm")),
                                              :first_pad_number => 22)))

renderer.render(e)


puts renderer.rendered_element
