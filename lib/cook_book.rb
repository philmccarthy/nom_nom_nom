require 'date'

class CookBook
  attr_reader :recipes,
              :date

  def initialize
    @recipes = []
    @date = Date.today
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
  end

  def ingredients
    @recipes.flat_map do |recipe|
      recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end
