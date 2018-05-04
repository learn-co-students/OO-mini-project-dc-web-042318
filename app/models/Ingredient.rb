class Ingredient

  attr_accessor :ingredient_name, :id

  @@all = []
  @@id_count = 0

  def initialize(ingredient_name)
    @ingredient_name = ingredient_name
    @@all << self
    @@id_count += 1
    @id = @@id_count
  end

  def self.all
    @@all
  end

  def self.find_by_id(ingredient_id)
    @@all.find{|ingredient| ingredient.id == ingredient_id}
  end

  def self.most_common_allergen
    result = Allergen.allergy_count.sort_by do |ingredient, number|
      number
    end.last
    if !result
      "No allergies"
    else
    "#{result[1]} people are allergic to #{find_by_id(result[0]).ingredient_name}"
    end
  end

end
