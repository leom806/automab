module Api
  module V1
    class OrdemServicosController < ApplicationController
      before_action :set_ordem_servico, only: [:show, :update, :destroy]

      # GET /ordem_servicos
      def index
        @ordem_servicos = OrdemServico.all

        render json: @ordem_servicos
      end

      # GET /ordem_servicos/1
      def show
        render json: @ordem_servico
      end

      # POST /ordem_servicos
      def create
        @ordem_servico = OrdemServico.new(ordem_servico_params)

        if @ordem_servico.save
          render json: @ordem_servico, status: :created, location: @ordem_servico
        else
          render json: @ordem_servico.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /ordem_servicos/1
      def update
        if @ordem_servico.update(ordem_servico_params)
          render json: @ordem_servico
        else
          render json: @ordem_servico.errors, status: :unprocessable_entity
        end
      end

      # DELETE /ordem_servicos/1
      def destroy
        @ordem_servico.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_ordem_servico
          @ordem_servico = OrdemServico.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def ordem_servico_params
          params.require(:ordem_servico).permit(:orcamento_id, :valor_total, :descricao_servico, :observacao, :data_criacao, :garantia, :status_pagamento)
        end
    end
  end
end