module Api
  module V1
    class FuncionariosController < ApplicationController    

      before_action :set_funcionario, except: [:index, :create]
      before_action :set_funcionarios


      def index        
        redirect_to edit_funcionario_path Funcionario.first   
      end


      def show
        redirect_to edit_funcionario_path @funcionario || Funcionario.first
      end

      def edit        
      end


      def create
        @funcionario = Funcionario.create!(funcionarios_params[:funcionario])
      rescue
        flash[:notice] = 'Funcionário não pode ser criado!'      
      else
        flash[:notice] = 'Funcionário criado com sucesso!'
      ensure
        show()
      end


      def destroy
        @funcionario.destroy
      rescue
        flash[:notice] = "Não foi possível excluir!"
      else
        flash[:notice] = "Funcionário excluído."
      ensure
        index()  
      end


      def update        
    
        if @funcionario.update( funcionarios_params[:funcionario] ) 
          flash[:notice] = 'Atualizado com sucesso!' 
        else
          flash[:notice] = 'Não foi possível atualizar' 
        end

        # render plain: funcionarios_params.to_json #params.to_json

        redirect_to edit_funcionario_path(@funcionario)
      end



      private

      def set_funcionario
        @funcionario = Funcionario.find(funcionarios_params[:id])
      end

      def set_funcionarios
        if params[:order].blank?
          @funcionarios = Funcionario.all      
        else
          @funcionarios = Funcionario.order(funcionarios_params[:order])
        end
      end

      def funcionarios_params
        params.permit(:id, :order, funcionario: {})
      end      
    end
  end
end