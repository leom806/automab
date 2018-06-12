module Api
  module V1
    class VeiculosController < ApplicationController    

      def index
        @veiculos = Veiculo.includes(:cliente)
      end
      
    end
  end
end