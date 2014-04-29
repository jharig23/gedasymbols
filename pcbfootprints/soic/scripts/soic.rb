require 'geda_footprint'

include GedaFootprint

attrs = {
  :soic8_narrow => {
    pad_length: Unit('1.7 mm'),
    pad_thickness: Unit('0.70 mm'),
    pitch: Unit('1.23 mm'),
    pad_rect: Rectangle.new(width: Unit('6.2 mm')),
    number_of_pads: 8,
    pad_anchor: :start
  },
  :soic16_narrow => {
    pad_length: Unit('2.4 mm'),
    pad_thickness: Unit('0.70 mm'),
    pitch: Unit('1.27 mm'),
    pad_rect: Rectangle.new(width: Unit('5.5 mm')),
    number_of_pads: 16,
    pad_anchor: :end}
    
}

e = Soic.new(attrs[:soic8_narrow])
Renderer.new.render_to_file(e, '../soic8_narrow.fp')

e = Soic.new(attrs[:soic16_narrow])
Renderer.new.render_to_file(e, '../soic16_narrow.fp')
