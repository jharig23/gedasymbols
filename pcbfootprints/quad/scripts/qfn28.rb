require 'geda_footprint'

include GedaFootprint

attrs = {
  :qfp28 => {
    number_of_pads: 28,
    pad_thickness: Unit('0.22 mm'),
    pad_length: Unit('0.4 mm'),
    pitch: Unit('0.45 mm'),
    pad_rect: Rectangle.new(height: Unit('4 mm'), width: Unit('4 mm')),
    pad_anchor: :start}
}

e = QuadPackage.new(attrs[:qfp28])


r = Renderer.new
r.render_to_file(e, '../qfn28.fp')
