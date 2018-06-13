module Api
  module V1
    class VeiculosController < ApplicationController    

      before_action :set_veiculo, except: [:index, :create]
      before_action :set_veiculos


      def index        
        redirect_to edit_veiculo_path Veiculo.first   
      end


      def show
        redirect_to edit_veiculo_path @veiculo || Veiculo.first
      end

      def edit        
      end


      def create
        @veiculo = Veiculo.create!(veiculos_params[:veiculo])
      rescue
        flash[:notice] = 'Veículo não pode ser criado!'      
      else
        flash[:notice] = 'Veículo criado com sucesso!'
      ensure
        show()
      end


      def destroy
        @veiculo.destroy
      rescue
        flash[:notice] = "Não foi possível excluir!"
      else
        flash[:notice] = "Veículo excluído."
      ensure
        index()  
      end


      def update        
    
        if @veiculo.update( veiculos_params[:veiculo] ) 
          flash[:notice] = 'Atualizado com sucesso!' 
        else
          flash[:notice] = 'Não foi possível atualizar' 
        end

        # render plain: veiculos_params.to_json #params.to_json

        redirect_to edit_veiculo_path(@veiculo)
      end



      private

      def set_veiculo
        @veiculo = Veiculo.find(veiculos_params[:id])
      end

      def set_veiculos
        if params[:order].blank?
          @veiculos = Veiculo.includes(:cliente)        
        else
          @veiculos = Veiculo.includes(:cliente).order(veiculos_params[:order])
        end
      end

      def veiculos_params
        params.permit!#(:id, :order, veiculo: {cliente:[:cliente_id]})
      end      
    end
  end
end