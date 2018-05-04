class Allergen

  attr_accessor :user_id, :ingredient_id, :allergy_count

  @@all = []
  @@allergy_count = {}

  def initialize(user_id, ingredient_id)
    @user_id = user_id
    @ingredient_id = ingredient_id
    @@all << self
    count_allergy
  end

  def self.all
    @@all
  end

  def self.allergy_count
    @@allergy_count
  end

  def count_allergy
    if !@@allergy_count[ingredient_id]
      @@allergy_count[ingredient_id] = 1
    else
      @@allergy_count[ingredient_id] += 1
    end
  end

end
