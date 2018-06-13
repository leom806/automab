module Api
  module V1
    class CategoriaItemsController < ApplicationController    

      before_action :set_categoria_item, except: [:index, :create]
      before_action :set_categoria_items


      def index        
        redirect_to edit_categoria_item_path CategoriaItem.first   
      end


      def show
        redirect_to edit_categoria_item_path @categoria_item || CategoriaItem.first
      end

      def edit        
      end


      def create
        @categoria_item = CategoriaItem.create!(categoria_items_params[:categoria_item])
      rescue
        flash[:notice] = 'A categoria não pode ser criada!'      
      else
        flash[:notice] = 'Categoria criada com sucesso!'
      ensure
        show()
      end


      def destroy
        @categoria_item.destroy
      rescue
        flash[:notice] = "Não foi possível excluir!"
      else
        flash[:notice] = "Categoria de item excluída."
      ensure
        index()  
      end


      def update        
    
        if @categoria_item.update( categoria_items_params[:categoria_item] ) 
          flash[:notice] = 'Atualizado com sucesso!' 
        else
          flash[:notice] = 'Não foi possível atualizar' 
        end

        redirect_to edit_categoria_item_path(@categoria_item)
      end



      private

      def set_categoria_item
        @categoria_item = CategoriaItem.find(categoria_items_params[:id])
      end

      def set_categoria_items
        if params[:order].blank?
          @categoria_items = CategoriaItem.all       
        else
          @categoria_items = CategoriaItem.order(categoria_items_params[:order])
        end
      end

      def categoria_items_params
        params.permit(:id, :order, categoria_item: {})
      end      

    end
  end
end