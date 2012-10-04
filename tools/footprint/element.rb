class Element
  require 'helper'
  require 'ruby-units'

  include Helper
  
  attr_accessor :flags, :description, :name, :value
  attr_accessor :mark_position
  attr_accessor :text_position, :text_direction, :text_scale, :text_flags

  # todo: defaults for all values so that nils are rendererd correctly, or use getters


  def render_with(renderer)
    renderer.open_tag("Element")
    renderer << [@flags, @description, @name, @value, @mark_position, 
                 @text_position, @text_direction, @text_scale, @text_flags]
    renderer.close_tag("Element")
  end

  
end
