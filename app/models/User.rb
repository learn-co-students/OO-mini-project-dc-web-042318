class User

  attr_accessor :name
  attr_reader :recipies, :id

  @@all = []
  @@id_count = 0

  def initialize(name)
    @name = name
    @recipies = []
    @@id_count += 1
    @id = @@id_count
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipie_card(recipie, date, rating)
    @recipies << recipie
    new_card = RecipieCard.new(recipie.id, self.id)
    new_card.date = date
    new_card.rating = rating
  end

  def return_all_cards
    RecipieCard.all.select do |card|
      card.user_id = self.id
    end
  end

end
