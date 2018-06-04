module Api
  module V1
    class TerceirosController < ApplicationController

      # # Query third-parties
      # def index
      #   terceiros = Terceiro.all
      #   render json: { status: 'Sucesso', mensagem: 'Terceiro', dados: terceiros }, status: :ok
      # end

      # # Find one
      # def show
      #   terceiro = Terceiro.find(params[:id])
      #   render json: { status: 'Sucesso', mensagem: 'Terceiro', dados: terceiro }, status: :ok
      # end

      # # New third-party
      # def create
      #   terceiro = Terceiro.new(terceiro_params)

      #   if terceiro.save
      #     render json: { status: 'Sucesso', mensagem: 'Terceiro foi criado', dados: terceiro }, status: :ok
      #   else
      #     render json: { status: 'Erro', mensagem: 'Terceiro não foi criado.', motivo: terceiro.errors.full_messages, parametros: terceiro_params }, status: :unprocessable_entity
      #   end
      # end

      # # Update method
      # def update
      #   terceiro = Terceiro.find(params[:id])

      #   if terceiro.update(terceiro_params)
      #     render json: { status: 'Sucesso', mensagem: 'Terceiro foi atualizado.', dados: terceiro }, status: :ok
      #   else
      #     render json: { status: 'Erro', mensagem: 'Terceiro não foi atualizado.', motivo: terceiro.errors.full_messages, parametros: terceiro_params }, status: :unprocessable_entity
      #   end
      # end

      # # DELETE /terceiros/1
      # def destroy
      #   terceiro = Terceiro.find(params[:id])

      #   if terceiro != nil
      #     terceiro.destroy
      #     render json: { status: 'Sucesso', mensagem: 'Terceiro foi excluído.', dados: terceiro }, status: :ok
      #   else
      #     render json: { status: 'Erro', mensagem: 'Terceiro não encontrado.' }, status: :ok
      #   end
      # end

      # private

      #   def terceiro_params
      #     params.permit(:juridica, :inscricao_municipal, :cpf, :nome_fantasia, :cnpj, :data_ultima_alteracao, :data_cadastro, :rg, :data_nascimento)
      #   end
    end
  end
end
