module Api
  module V1
    class ItemsController < ApplicationController            

      private def items_params
        [:codigoFabricante, :nomeItem, :descricao, :validade, :preco, :item_item_id]
      end      

    end
  end
end
