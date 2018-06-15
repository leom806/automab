module Api
  module V1
    class ClientesController < ApplicationController
      before_action :set_cliente, except: [:index, :create]
      before_action :set_clientes


      def index        
        redirect_to edit_cliente_path Cliente.first   
      end


      def show
        redirect_to edit_cliente_path @cliente || Cliente.first
      end

      def edit        
      end


      def create
        @cliente = Cliente.create!(clientes_params[:cliente])
      rescue
        flash[:notice] = 'Cliente não pode ser criado!'      
      else
        flash[:notice] = 'Cliente criado com sucesso!'
      ensure
        show()
      end


      def destroy
        @cliente.destroy
      rescue
        flash[:notice] = "Não foi possível excluir!"
      else
        flash[:notice] = "Cliente excluído."
      ensure
        index()  
      end


      def update        
    
        if @cliente.update( clientes_params[:cliente] ) 
          flash[:notice] = 'Atualizado com sucesso!' 
        else
          flash[:notice] = 'Não foi possível atualizar' 
        end

        # render plain: clientes_params.to_json #params.to_json

        redirect_to edit_cliente_path(@cliente)
      end



      private

      def set_cliente
        @cliente = Cliente.find(clientes_params[:id])
      end

      def set_clientes
        if params[:order].blank?
          @clientes = Cliente.all        
        else
          @clientes = Cliente.order(clientes_params[:order])
        end
      end

      def clientes_params
        params.permit!#(:id, :order, cliente: {cliente:[:cliente_id]})
      end      

    end
  end
end