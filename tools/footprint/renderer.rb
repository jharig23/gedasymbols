class Renderer
  require 'ruby_units'
  require 'helper'
  require 'units'
  
  include Helper

  def initialize
    @line = ''
  end


  def render(element)
    element.render_with(self) if element.respond_to?(:render_with)
    
    @line
  end

  def open_tag(tag_name)
    @line = tag_name << "["
    @first_unit = true
  end
  
  def close_tag(tag_name)
    @line << "]"
  end


  def<<(thing)
    render_attribute(thing)
  end
  
  def render_attribute(thing)
    @line << " " unless @first_unit
    if thing.nil?
      @line << ""
    end
    
    if thing.is_a?(Unit)
      @line << quote((thing >> 'zil').scalar.to_i)      
    elsif thing.respond_to?(:each)
      thing.each do |other_thing|
        self << other_thing
      end
    else
      @line << "" << thing.to_s
    end

    @first_unit = false
    @line
  end
    
  def line 
    @line
  end
end
