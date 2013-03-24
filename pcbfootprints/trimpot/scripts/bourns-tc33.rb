require 'geda_footprint'
include GedaFootprint

top_pad_width = Unit('1.6 mm')
top_pad_height = Unit('1.5 mm')

top_2_bottom_pad_space = Unit('1.9 mm')

bottom_pad_width = Unit('1.2 mm')
bottom_pad_space = Unit('0.8 mm')

total_width = bottom_pad_width * 2 + bottom_pad_space

bottom_y = bottom_pad_width / 2

pad_bottom_left = Pad.new(p1: Position.new(x: Unit('0 mm'),
                                            y: bottom_y),
                          p2: Position.new(x: bottom_pad_width,
                                            y: bottom_y),
                          thickness: bottom_pad_width,
                          number: 1,
                          adjust_endpoints: true)

p1_x = bottom_pad_width + bottom_pad_space

pad_bottom_right = Pad.new(p1: Position.new(x: p1_x,
                                            y: bottom_y),
                          p2: Position.new(x: p1_x + bottom_pad_width,
                                            y: bottom_y),
                          thickness: bottom_pad_width,
                          number: 3,
                          adjust_endpoints: true)

top_y = bottom_pad_width + top_2_bottom_pad_space + (top_pad_height / 2)
top_x1 = (total_width / 2) - (top_pad_width / 2)

pad_top = Pad.new(p1: Position.new(x: top_x1,
                                   y: top_y),
                  p2: Position.new(x: top_x1 + top_pad_width,
                                   y: top_y),
                  thickness: top_pad_height,
                  number: 2,
                  adjust_endpoints: true)


element = Element.new()
element.add_child(pad_top)
element.add_child(pad_bottom_left)
element.add_child(pad_bottom_right)


Renderer.new.render_to_file(element, '../bourns-tc33.fp')
