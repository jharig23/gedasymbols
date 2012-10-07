module Helper
  
  def quote(text)
    text = text.to_s if text.respond_to?(to_s)
    "\"#{text}\""
  end

  def element_attr(hash)
    if hash.respond_to?(:each)
      hash.each do |key, value|
        eval "def #{key}; @#{key} || @value; end", value
        eval "def #{key}=(val); @#{key}=val; end"
      end
    end
  end    
end
