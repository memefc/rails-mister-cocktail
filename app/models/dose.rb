class Dose < ApplicationRecord
  DOSE = ["0.5cl", "1 cup", "0.1cl", "0.2cl", "0.3cl","0.6cl","0.7cl", "0.8cl","0.9cl" ]
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end
