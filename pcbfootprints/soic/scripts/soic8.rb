require 'geda_footprint'

include GedaFootprint

attrs = {
  :soic8_narrow => {
    pad_length: Unit('1 mm'),
    pad_thickness: Unit('0.63 mm'),
    pitch: Unit('1.23 mm'),
    pad_rect: Rectangle.new(width: Unit('6.2 mm')),
    number_of_pads: 8,
    pad_anchor: :start}
}

e = Soic.new(attrs[:soic8_narrow])

Renderer.new.render_to_file(e, '../soic8_narrow.fp')
