module Api
  module V1
    class TransacoesController < ApplicationController
      before_action :set_transacao, only: [:show, :update, :destroy]

      # GET /transacoes
      def index
        @transacoes = Transacao.all

        render json: @transacoes
      end

      # GET /transacoes/1
      def show
        render json: @transacao
      end

      # POST /transacoes
      def create
        @transacao = Transacao.new(transacao_params)

        if @transacao.save
          render json: @transacao, status: :created, location: @transacao
        else
          render json: @transacao.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /transacoes/1
      def update
        if @transacao.update(transacao_params)
          render json: @transacao
        else
          render json: @transacao.errors, status: :unprocessable_entity
        end
      end

      # DELETE /transacoes/1
      def destroy
        @transacao.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_transacao
          @transacao = Transacao.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def transacao_params
          params.require(:transacao).permit(:ordem_servico_id, :funcionario_id, :data_transacao, :valor_recebido, :forma_pagamento)
        end
    end
  end
end