module Api
  module V1
    class CargosController < ApplicationController
      # # GET /cargos
      # def index
      #   cargos = Cargo.all
      #   render json: { status: 'Sucesso', mensagem: 'Cargo', dados: cargos }, status: :ok
      # end

      # # GET /cargos/1
      # def show
      #   cargo = Cargo.find(params[:id])

      #   render json: { status: 'Sucesso', mensagem: 'Cargo', dados: cargo }, status: :ok
      # end

      # # POST /cargos
      # def create
      #   cargo = Cargo.new(cargo_params)

      #   if cargo.save
      #     render json: { status: 'Sucesso', mensagem: 'Cargo foi criado!', dados: cargo }, status: :created, location: cargo
      #   else
      #     render json: { status: 'Erro', mensagem: 'Cargo não foi criado.', motivo: cargo.errors.full_messages, parametros: cargo_params }, status: :unprocessable_entity
      #   end
      # end

      # # PATCH/PUT /cargos/1
      # def update
      #   cargo = Cargo.find(params[:id])

      #   if cargo.update(cargo_params)
      #     render json: { status: 'Sucesso', mensagem: 'Cargo foi atualizado.', dados: cargo }, status: :ok
      #   else
      #     render json: { status: 'Erro', mensagem: 'Cargo não foi atualizado.', motivo: cargo.errors.full_messages, parametros: cargo_params }, status: :unprocessable_entity
      #   end
      # end

      # # DELETE /cargos/1
      # def destroy
      #   cargo = Cargo.find(params[:id])
      #   if cargo != nil
      #     cargo.destroy
      #     render json: { status: 'Sucesso', mensagem: 'Cargo foi excluído.', dados: cargo }, status: :ok
      #   else
      #     render json: { status: 'Erro', mensagem: 'Cargo não encontrado.', dados: cargo }, status: :unprocessable_entity
      #   end
      # end

      # private
      # # Only allow a trusted parameter "white list" through.
      # def cargo_params
      #   params.require(:cargo).permit(:nome, :salario, :descricao)
      # end
    end
  end
end
