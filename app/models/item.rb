class Item < ApplicationRecord

  belongs_to :categoria_item

  validates :codigo_fabricante, :nomeItem, :preco, presence: true
  validates :nomeItem, length: { in: 5..30 }, uniqueness: true
  validates :preco, numericality: { greather_than: 0.01 }  

  validate :validade_in_the_future

  def validade_in_the_future
    if validade.present? && validade <= Date.today
      errors.add(:validade, "A data deve ser posterior ao dia de hoje.")
    end
  end

end
