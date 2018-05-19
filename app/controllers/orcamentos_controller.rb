class OrcamentosController < ApplicationController
  before_action :set_orcamento, only: [:show, :update, :destroy]

  # GET /orcamentos
  def index
    @orcamentos = Orcamento.all

    render json: @orcamentos
  end

  # GET /orcamentos/1
  def show
    render json: @orcamento
  end

  # POST /orcamentos
  def create
    @orcamento = Orcamento.new(orcamento_params)

    if @orcamento.save
      render json: @orcamento, status: :created, location: @orcamento
    else
      render json: @orcamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orcamentos/1
  def update
    if @orcamento.update(orcamento_params)
      render json: @orcamento
    else
      render json: @orcamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orcamentos/1
  def destroy
    @orcamento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def orcamento_params
      params.require(:orcamento).permit(:funcionario_id, :agendamento_id, :cliente_id, :servico_concluido, :veiculo_id)
    end
end
