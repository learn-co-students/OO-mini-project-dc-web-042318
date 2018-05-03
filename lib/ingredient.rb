class Ingredient
  attr_accessor :name

 @@ingredients =  []

  def initialize(name)
    @name = name
    @@ingredients << self
  end

  def self.all
    @@ingredients
  end

  def self.most_common_allergen
    ingredient_hash = Allergen.all.each_with_object(Hash.new(0)) do |obj, hash|
      hash[obj.ingredient] += 1
    end
    ingredient_hash.max_by { |ind, c| c }
  end




end
