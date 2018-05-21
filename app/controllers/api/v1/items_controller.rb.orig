module Api
  module V1
    class ItemsController < ApplicationController

      # http_basic_authenticate_with name: "admin", password: "123"

      # Query items
      def index
        items = Item.all
<<<<<<< HEAD:app/controllers/api/v1/item_controller.rb
        render json: {status: 'Sucesso', mensagem: 'Item', dados: items}, status: :ok
=======
        render json: { status: 'Sucesso', mensagem: 'Items', dados: items }, status: :ok
>>>>>>> e95808b7c248a8059b540138e94d2126e723654d:app/controllers/api/v1/items_controller.rb
      end

      # Find one
      def show
        item = Item.find(params[:id])

        render json: {status: 'Sucesso', mensagem: 'Item', dados: item}, status: :ok
      end

      # New item
      def create
        item = Item.new(item_params)

        if item.save
          render json: {status: 'Sucesso', mensagem: 'Item foi criado.', dados: item}, status: :ok
        else
          render json: {status: 'Erro', mensagem: 'Item não foi criado.', motivo: item.errors.full_messages, parametros: item_params}, status: :unprocessable_entity
        end
      end

       # Delete one method
       def destroy
        item = Item.find(params[:id])

        if item != nil
          item.destroy
          render json: {status: 'Sucesso', mensagem: 'Item foi excluído.', dados: item}, status: :ok
        else
          render json: {status: 'Erro', mensagem: 'Item não encontrado.'}, status: :ok # [Breno]: O status é "ok" aqui, mesmo?
        end

      end

      # Update method
      def update
        item = Item.find(params[:id])

        if item.update(item_params)
          render json: {status: 'Sucesso', mensagem: 'Item foi atualizado.', dados: item}, status: :ok
        else
          render json: {status: 'Erro', mensagem: 'Item não foi atualizado.', motivo: item.errors.full_messages, parametros: item_params}, status: :unprocessable_entity
        end

      end

      private

      def item_params
        params.permit(:codigoFabricante, :nomeItem, :descricao, :validade, :preco, :item_item_id)
      end
    end
  end
end
