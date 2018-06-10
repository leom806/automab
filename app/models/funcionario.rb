class Funcionario < ApplicationRecord
  belongs_to :cargo

  require 'terceiro'

end
