require 'pry'
class Recipe
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.most_popular
        i = 0
        recipe = nil
        count= []
        self.all.each do |rcp|
            count << [rcp, RecipeCard.all.count{|rcpcrd| rcpcrd.recipe == rcp}]
        end
        count.each do |item|
            if item[1] > i
                i = item[1]
                recipe = item[0]
            end
        end
        recipe
    end

    def users
        self.recipecards.map{|rcpcrd| rcpcrd.user}
    end

    def recipecards
        RecipeCard.all.select{|rcpcrd|rcpcrd.recipe == self}
    end

    def ingredients
        ing = RecipeIngredients.all.select{|rcping|rcping.recipe == self}
        ing.map{|recing| recing.ingredient}
    end

    def allergens
        self.ingredients.select do |ingrt|
            if (Allergen.all.any?{|allr| allr.ingredient == ingrt})
                ingrt 
            end
        end
    end

    def add_ingredients(array)
        array.each do |ingredient|
            RecipeIngredients.new(self, ingredient)
        end
    end

end
