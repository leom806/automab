module Api
  module V1
    class CategoriaItemController < ApplicationController

      # Query method
      def index
        categorias = CategoriaItem.all        
        render json: {status: 'Sucesso', mensagem: 'CategoriaItem', dados: categorias}, status: :ok
      end

      # Find method
      def show
        categoria = CategoriaItem.find(params[:id])
        render json: {status: 'Sucesso', mensagem: 'CategoriaItem', dados: categoria}, status: :ok
      end

      # New method
      def create
        categoria = CategoriaItem.new(categoria_params)

        ultima_categoria_criada = CategoriaItem.last
        categoria.id = ultima_categoria_criada.id + 1

        if categoria.save
          render json: {status: 'Sucesso', mensagem: 'CategoriaItem foi criada.', dados: categoria}, status: :ok
        else
          render json: {status: 'Erro', mensagem: 'CategoriaItem não foi criada.', motivo: categoria.errors.full_messages, parametros: categoria_params}, status: :unprocessable_entity
        end

      end

      # Delete one method
      def destroy
        categoria = CategoriaItem.find(params[:id])

        if categoria != nil 
          categoria.destroy 
          render json: {status: 'Sucesso', mensagem: 'CategoriaItem foi excluída.', dados: categoria}, status: :ok
        else
          render json: {status: 'Erro', mensagem: 'CategoriaItem não encontrada.'}, status: :ok
        end

      end

      # Update method
      def update
        categoria = CategoriaItem.find(params[:id])

        if categoria.update(categoria_params)
          render json: {status: 'Sucesso', mensagem: 'CategoriaItem foi atualizada.', dados: categoria}, status: :ok
        else
          render json: {status: 'Erro', mensagem: 'CategoriaItem não foi atualizada.', motivo: categoria.errors.full_messages, parametros: categoria_params}, status: :unprocessable_entity
        end

      end


      private 

      def categoria_params
        params.permit(:descricao)
      end

    end
  end
end