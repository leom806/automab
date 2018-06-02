class ApplicationController < ActionController::API

  before_action :authenticate, except: [:index, :show]

  def authenticate    
    if current_user.blank?
      render_unauthorized 
    end
  end

  def current_user    
    @usuario ||= Usuario.where(nome: params[:login], senha: params[:senha]).first
  end

  # ========================================================================== #
  @element ||= nil

  # CRUD genérico
  def index
    render_data current_model.all
  end


  def show
    render_data current_model.find params[:id]
  end


  def destroy
    @element = current_model.find( params[:id] ) and @element.destroy

    render_data @element
  end


  def create
    @element = current_model.new( element_params )    

    if @element.save then render_data @element else render_error end
  end


  def update
    @element = current_model.find params[:id]

    if @element.update( element_params ) then render_data @element else render_error end
  end



  protected 

  # facilita as chamadas pra renderizar os JSONs dentro do padrão
  def render_data (data = {})
    render json: { status: 'Sucesso', usuario: (current_user.blank? ? "visitante" : current_user.nome), mensagem: controller, dados: data }, status: :ok
  end


  def render_error

    if @element.nil?
      render json: {status: "Erro", parametros: element_params}, status: :ok
    else
      render json: { status: 'Erro', mensagem: "'#{controller}' - ação não realizada.", motivo: @element.errors.full_messages, parametros: element_params }, status: :unprocessable_entity
    end

  end


  def render_unauthorized
    render json: {status: "Não autorizado", parametros: element_params}, status: :unauthorized
  end


  # retorna uma nova instância do controller atual
  # por exemplo:
  # [GET] localhost:3000/api/v1/items -> pelas rotas será direcionado ao ItemsController
  def current_controller
    Object.const_get("Api::V1::#{controller}Controller").new
  end


  # retorna a classe do model atual
  def current_model
    Object.const_get(controller.singularize)
  end


  # retorna o nome do controller em camel case
  def controller
    controller_name.camelize
  end


  # retorna os parametros definidos por whitelist no controller original, se houver
  def element_params
    begin
      ##### DESCOMENTAR QUANDO ESTIVERMOS USANDO OS RELACIONAMENTOS #####
      # whitelist = current_controller.send("#{controller_name}_params") 
      whitelist = current_model.column_names # paliativo
    rescue
      logger.info("================================================")
      logger.info("#{controller} does not have a params whitelist!")
      logger.info("================================================")
      whitelist = current_model.column_names
    end        
    params.permit whitelist 
  end

end
