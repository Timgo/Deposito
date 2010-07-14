class AdminController < ApplicationController
  def login
    if request.post?
      usuario = Usuario.autenticar(params[:nome], params[:senha])
      if usuario
        session[:usuario_id] = usuario.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || {:action => 'index'})
      else
        flash.now[:notice] = 'Combinação usuário/senha inválida'
      end
    end
  end

  def logout
  end

  def index
    @total_pedidos = Pedido.count
  end

end
