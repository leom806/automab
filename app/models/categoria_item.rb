class CategoriaItem < ApplicationRecord

  has_many :items, dependent: :delete_all 

  validates :descricao, presence: true

end
