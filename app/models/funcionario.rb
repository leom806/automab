class Funcionario < ApplicationRecord
  belongs_to :terceiro
  has_one :cargo
end
