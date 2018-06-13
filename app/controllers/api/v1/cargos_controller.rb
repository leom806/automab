module Api
  module V1
    class CargosController < ApplicationController    

      before_action :set_cargo, except: [:index, :create]
      before_action :set_cargos


      def index        
        redirect_to edit_cargo_path Cargo.first   
      end


      def show
        redirect_to edit_cargo_path @cargo || Cargo.first
      end

      def edit        
      end


      def create
        @cargo = Cargo.create!(cargos_params[:cargo])
      rescue
        flash[:notice] = 'Cargo não pode ser criado!'      
      else
        flash[:notice] = 'Cargo criado com sucesso!'
      ensure
        show()
      end


      def destroy
        @cargo.destroy
      rescue
        flash[:notice] = "Não foi possível excluir!"
      else
        flash[:notice] = "Cargo excluído."
      ensure
        index()  
      end


      def update        
    
        if @cargo.update( cargos_params[:cargo] ) 
          flash[:notice] = 'Atualizado com sucesso!' 
        else
          flash[:notice] = 'Não foi possível atualizar' 
        end

        # render plain: cargos_params.to_json #params.to_json

        redirect_to edit_cargo_path(@cargo)
      end



      private

      def set_cargo
        @cargo = Cargo.find(cargos_params[:id])
      end

      def set_cargos
        if params[:order].blank?
          @cargos = Cargo.all      
        else
          @cargos = Cargo.order(cargos_params[:order])
        end
      end

      def cargos_params
        params.permit(:id, :order, cargo: {})
      end      
    end
  end
end