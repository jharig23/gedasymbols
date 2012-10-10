class PadLine < PcbElement
  attr :pad_thickness => Unit("0 mil")
  attr :pad_clearance => Unit("0 mil")
  attr :pad_mask_width => Unit("0 mil")

  attr :pad_length => Unit("0 mil")

  attr :pad_orientation => :normal
  attr :first_pad_number => 1
  attr :number_of_pads => 1
  attr :pad_2_pad_distance => Unit("0 mil")

  attr :p1 => Position.origin
  attr :p2 => Position.origin

  def render_with(renderer)
    generate_pads.each do |pad|
      renderer.render(pad)
    end
  end

  def generate_pads()
    #origin (0, 0) is at top left
    total_width = self.pad_2_pad_distance * (self.number_of_pads - 1)

    delta = self.p2 - self.p1
    pad_length = self.pad_length
    pad_length = pad_length * -1 if self.pad_orientation != :normal

    # I'm sure we can condense this down into a matrix
    if delta.x == 0 and delta.y > 0
      #vertical, top to bottom
      pad_p1 = Position.new(x: p1.x, y: p1.y + (delta.y - total_width) / 2)
      pad_vector = Position.new(x: pad_length, y: Unit("0 mil"))
      position_vector = Position.new(x: Unit("0 mil"), y: self.pad_2_pad_distance)
    elsif delta.x == 0 and delta.y < 0
      # vertical, bottom to top
      pad_p1 = Position.new(x: p1.x, y: p2.y - (delta.y - total_width) / 2)
      pad_vector = Position.new(x: pad_length * -1, y: Unit("0 mil"))
      position_vector = Position.new(x: Unit("0 mil"), y: self.pad_2_pad_distance * -1)
    elsif delta.y == 0 and delta.x > 0
      # horizontal, left to right
      pad_p1 = Position.new(x: p1.x + ((delta.x - total_width)/2), y: p1.y)
      pad_vector = Position.new(x: Unit("0 mil"), y: (pad_length * -1))
      position_vector = Position.new(x: self.pad_2_pad_distance, y: Unit("0 mil"))
    elsif delta.y == 0 and delta.x < 0
      # horizontal, right to left
      pad_p1 = Position.new(x: p2.x - ((delta.x - total_width) / 2), y: p1.y)
      pad_vector = Position.new(x: Unit("0 mil"),y: (pad_length))
      position_vector = Position.new(x: (self.pad_2_pad_distance * -1), y: Unit("0 mil"))
    end

    # okay, build the pads
    pad_p = pad_p1
    pad_number = self.first_pad_number

    generated_pads = []
    self.number_of_pads.times do
      generated_pads << Pad.new(:p1 => pad_p, :p2 => (pad_p + pad_vector),
                                :thickness => self.pad_thickness,
                                :clearance => self.pad_clearance,
                                :mask_width => self.pad_mask_width,
                                :name => "",
                                :number => pad_number,
                                :flags => "")
      pad_p = pad_p + position_vector
      pad_number = pad_number + 1
    end
    generated_pads
  end

end
