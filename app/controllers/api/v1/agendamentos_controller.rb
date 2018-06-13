module Api
  module V1
    class AgendamentosController < ApplicationController  
      before_action :set_agendamento, except: [:index, :create]
      before_action :set_agendamentos


      def index        
        redirect_to edit_agendamento_path Agendamento.first   
      end


      def show
        redirect_to edit_agendamento_path @agendamento || Agendamento.first
      end

      def edit        
      end


      def create
        @agendamento = Agendamento.create!(agendamentos_params[:agendamento])
      rescue
        flash[:notice] = 'Agendamento não pode ser criado!'      
      else
        flash[:notice] = 'Agendamento criado com sucesso!'
      ensure
        show()
      end


      def destroy
        @agendamento.destroy
      rescue
        flash[:notice] = "Não foi possível excluir!"
      else
        flash[:notice] = "Agendamento excluído."
      ensure
        index()  
      end


      def update        
    
        if @agendamento.update( agendamentos_params[:agendamento] ) 
          flash[:notice] = 'Atualizado com sucesso!' 
        else
          flash[:notice] = 'Não foi possível atualizar' 
        end

        redirect_to edit_agendamento_path(@agendamento)
      end



      private

      def set_agendamento
        @agendamento = Agendamento.find(agendamentos_params[:id])
      end

      def set_agendamentos
        if params[:order].blank?
          @agendamentos = Agendamento.includes(:funcionario)        
        else
          @agendamentos = Agendamento.includes(:funcionario).order(agendamentos_params[:order])
        end
      end

      def agendamentos_params
        params.permit!#(:id, :order, agendamento: {})
      end          
    end
  end
end