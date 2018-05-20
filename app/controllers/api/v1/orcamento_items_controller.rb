module Api
  module V1
    class OrcamentoItemsController < ApplicationController
      before_action :set_orcamento_item, only: [:show, :update, :destroy]

      # GET /orcamento_items
      def index
        @orcamento_items = OrcamentoItem.all

        render json: @orcamento_items
      end

      # GET /orcamento_items/1
      def show
        render json: @orcamento_item
      end

      # POST /orcamento_items
      def create
        @orcamento_item = OrcamentoItem.new(orcamento_item_params)

        if @orcamento_item.save
          render json: @orcamento_item, status: :created, location: @orcamento_item
        else
          render json: @orcamento_item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /orcamento_items/1
      def update
        if @orcamento_item.update(orcamento_item_params)
          render json: @orcamento_item
        else
          render json: @orcamento_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /orcamento_items/1
      def destroy
        @orcamento_item.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_orcamento_item
          @orcamento_item = OrcamentoItem.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def orcamento_item_params
          params.require(:orcamento_item).permit(:orcamento_id, :agendamento_id, :quantidade)
        end
    end
  end
end