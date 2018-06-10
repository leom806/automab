class OrdemServico < ApplicationRecord
  belongs_to :orcamento, optional: true
end
