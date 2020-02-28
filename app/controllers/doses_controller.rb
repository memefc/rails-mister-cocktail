class DosesController < ApplicationController
  def create
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail), :notice => "The ingredient has been deleted"

  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
