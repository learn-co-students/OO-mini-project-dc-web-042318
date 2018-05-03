class Ingredient
  attr_accessor :name

 @@ingredients =  []

  def initialize(name)
    @name = name
    @@ingredients << self
  end

  def most_common
    
  end

end
