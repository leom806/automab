class UsuariosController < ApplicationController

  # garante que apenas usuários acessem 
  
  # before_action :authenticate

  # Impede que qualquer um veja as senhas dos usuários

  def index
    @usuarios = Usuario.all.select :id, :nome, :email

    render_data @usuarios
  end

  def show
    @usuario = Usuario.select( :id, :nome, :email ).find params[:id]
    
    render_data @usuario
  end

end
