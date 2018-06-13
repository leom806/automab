module Api
  module V1
    class ItemsController < ApplicationController       
      before_action :set_item, except: [:index, :create]
      before_action :set_items


      def index        
        redirect_to edit_item_path Item.first   
      end


      def show
        redirect_to edit_item_path @item || Item.first
      end

      def edit        
      end


      def create
        @item = Item.create!(items_params[:item])
      rescue
        flash[:notice] = 'Item não pode ser criado!'      
      else
        flash[:notice] = 'Item criado com sucesso!'
      ensure
        show()
      end


      def destroy
        @item.destroy
      rescue
        flash[:notice] = "Não foi possível excluir!"
      else
        flash[:notice] = "Item excluído."
      ensure
        index()  
      end


      def update        
    
        if @item.update( items_params[:item] ) 
          flash[:notice] = 'Atualizado com sucesso!' 
        else
          flash[:notice] = 'Não foi possível atualizar' 
        end

        redirect_to edit_item_path(@item)
      end



      private

      def set_item
        @item = Item.find(items_params[:id])
      end

      def set_items
        if params[:order].blank?
          @items = Item.includes(:categoria_item)        
        else
          @items = Item.includes(:categoria_item).order(items_params[:order])
        end
      end

      def items_params
        params.permit!#(:id, :order, item: {cliente:[:cliente_id]})
      end           
    end
  end
end
