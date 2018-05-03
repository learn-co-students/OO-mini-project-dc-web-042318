
class User
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def recipes 
        rcpcards = RecipeCard.all.select {|recipecard| recipecard.user == self}
        rcpcards.map {|rcpcard| rcpcard.recipe}
    end

    def add_recipe_card(recipe, rating)
        rcp_crd = RecipeCard.new(self, recipe, rating)
        rcp_crd
    end

    def declare_allergen(ingredient) 
        Allergen.new(ingredient, self)
    end

    def allergens
        allergens_array = []
        Allergen.all.select do |allergen|
             if (allergen.user == self) 
                allergens_array << allergen.ingredient 
            end
        end
        allergens_array
    end
    def top_three_recipes 
        users_recipecards= RecipeCard.all.select do |recipecard| 
            if recipecard.user == self
                recipecard 
            end
        end
        users_recipecards.sort{|recipecard| recipecard.rating}.slice(0..2)
    end
    def most_recent_recipe
        users_recipecards= RecipeCard.all.select do |recipecard| 
            if recipecard.user == self
                recipecard 
            end
        end
        users_recipecards.max_by {|o| o.date}  
    end
    def check_if_recipe_safe?(recipe)
        check = true
        recipe.ingredients.each do |recipe_ingredient|
            if self.allergens.include?(recipe_ingredient)
                check = false
            end
        end
        check
    end
    def safe_recipes
        Recipe.all.select { |recipe| check_if_recipe_safe?(recipe)}
    end
end