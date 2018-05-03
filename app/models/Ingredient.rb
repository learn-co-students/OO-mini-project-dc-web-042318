class Ingredient
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        i = 0
        ingredient = nil
        count= []
        self.all.each do |ingrt|
            count << [ingrt, Allergen.all.count{|alrgn| alrgn.ingredient == ingrt}]
        end
        count.each do |item|
            if item[1] > i
                i = item[1]
                ingredient = item[0]
            end
        end
        ingredient
    end

end
