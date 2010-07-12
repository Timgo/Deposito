class AdminController < ApplicationController
  def login
    if request.post?
      usuario = Usuario.autenticar(params[:usuario], params[:senha])
      if usuario
        session[:usuario_id] = usuario.id
        redirecto_to(:action => 'index')
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
