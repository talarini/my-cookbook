class RecipesController < ApplicationController
  def show
    @recipes = Recipe.find(params[:id])
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render '_error'
    end

  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty, :cook_time, :ingredients, :method, :portion)
  end

end
