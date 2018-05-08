class CategoriaItem < ApplicationRecord

  has_many :items

  validates :descricao, presence: true

end
