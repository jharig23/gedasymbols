class PadLine
  attr :pad_thickness => Unit("0 mil")
  attr :pad_length => Unit("0 mil")
  attr :pad_orientation => "normal" 
  attr :number_of_pads => 0
  attr :pad_2_pad_distance => Unit("0 mil")

  attr :p1 => Position.origin
  attr :p2 => Position.origin
  
  

  def initialize(hash = {})
    hash.each do |key, value|
      send("#{key}=".to_sym, value)
    end
  end
  
  
  
  def generate_pads()
    total_width = self.pad_2_pad_distance * self.number_of_pads
    
    delta = self.p2 - self.p1
    
    if delta.x == 0 and delta.y > 0
      #vertical, top to bottom
      pad_p1 = Position.new(p1.x, p2.y + (delta.y - total_width) / 2)
      pad_direction = Position.new(self.pad_2_pad_distance, Unit("0 mil")
      position_inc = Position.new(Unit("0 mil"), self.pad_2_pad_distance)
      
    elsif delta.y == 0 
      # horizontal
      
    elsif delta.x == 0
      
    end
  end

end
