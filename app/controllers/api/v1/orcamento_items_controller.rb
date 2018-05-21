module Api
  module V1
    class OrcamentoItemsController < ApplicationController
      before_action :set_orcamento_item, only: [:show, :update, :destroy]

      # GET /orcamento_items
      def index
        @orcamento_items = OrcamentoItem.all

        render json: {status: 'Sucesso', mensagem: 'Itens x Orçamento', dados: @orcamento_items}, status: :ok
      end

      # GET /orcamento_items/1
      def show
        render json: {status: 'Sucesso', mensagem: 'Item x Orçamento', dados: @orcamento_item}, status: :ok
      end

      # POST /orcamento_items
      def create
        @orcamento_item = OrcamentoItem.new(orcamento_item_params)

        if @orcamento_item.save
          render json: {status: 'Sucesso', mensagem: 'Orçamento x Item foi criado.', dados: @orcamento_item}, status: :ok, status: :created
        else
          render json: {status: 'Erro', mensagem: 'Orcamento x Item não foi criado.', motivo: @orcamento_item.errors.full_messages, parametros: orcamento_item_params}, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /orcamento_items/1
      def update
        if @orcamento_item.update(orcamento_item_params)
          render json: {status: 'Sucesso', mensagem: 'Orçamento x Item foi atualizado.', dados: @orcamento_item}, status: :ok, status: :updated
        else
          render json: {status: 'Erro', mensagem: 'Orcamento x Item não foi atualizado.', motivo: @orcamento_item.errors.full_messages, parametros: orcamento_item_params}, status: :unprocessable_entity
        end
      end

      # DELETE /orcamento_items/1
      def destroy
        if @orcamento_item != nil
          @orcamento_item.destroy
          render json: { status: 'Sucesso', mensagem: 'Orçamento x Item foi excluído.', dados: @orcamento_item }, status: :ok
        else
          render json: { status: 'Erro', mensagem: 'Orçamento x Item não encontrado.' }, status: :ok
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_orcamento_item
          @orcamento_item = OrcamentoItem.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def orcamento_item_params
          params.permit(:orcamento_id, :item_id, :quantidade)
        end
    end
  end
end