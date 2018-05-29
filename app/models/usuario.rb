class Usuario < ApplicationRecord
  validates :nome, uniqueness: true
end
