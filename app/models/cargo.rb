class Cargo < ApplicationRecord
  has_many :funcionarios

  validates :nome, :salario, presence: true
  validates :nome, length: {in: 5..30}, uniqueness: true
  validates :salario, numericality: { greater_than_or_equal_to: 0.01 }
end
