class Veiculo < ApplicationRecord

  belongs_to :cliente

  validates :placa, :quilometragem, :cliente, presence: true
  validates :quilometragem, numericality: {greather_than: 0}

  validates_format_of :ano_fabricacao, :ano_modelo, with: /((1|2)\d{3})/, allow_blank: true
  validates_format_of :placa, :with => /([a-z]{3}-?[0-9]{4})/i
  
  validate :quilometragem_sempre_maior_ou_igual_a_anterior, on: :update

  def quilometragem_sempre_maior_ou_igual_a_anterior    
    errors.add(:quilometragem, "inferior à atual.") unless quilometragem >= quilometragem_was
  end

  # inclui hífen e coloca em caixa alta, exemplo: abc12345 -> ABC-1234
  def placa=(val)
    nova_placa = val.upcase
    
    if !nova_placa.include? '-'
      nova_placa = "#{nova_placa[0..2]}-#{nova_placa[3..6]}"
    end

    write_attribute(:placa, nova_placa)
  end

end
