class LojaController < ApplicationController
  before_filter :encontrar_lista, :except => :limpar_lista
  
  def index
    @produtos = Produto.encontrar_produtos_a_venda
    @lista = encontrar_lista
    #if session[:frequencia].nil?
     # session[:frequencia] = 0
      #flash[:notice] = 'Primeira visita'
    #else 
     # session[:frequencia] += 1
      #flash[:notice] = "Essa é a sua sessão número #{session[:frequencia]}"
    #end
  end
  
  def adicionar_a_lista
    produto = Produto.find(params[:id])
    @lista = encontrar_lista
    @item_existente = @lista.adicionar_produto(produto)
    respond_to do |format|
      format.js if request.xhr?
      format.html {encaminhar_index}
    end
    #encaminhar_index
    rescue ActiveRecord::RecordNotFound
      logger.error("Tentativa de acessar um produto inválido  #{params[:id]}")
      encaminhar_index('Produto Inválido')
  end
  
  def limpar_lista
    session[:lista] = nil
    respond_to do |format|
      format.js if request.xhr?
      format.html {encaminhar_index}
    end
  end
  
  def limpar_item 
    @lista = encontrar_lista
    produto = Produto.find(params[:id])
    @item_existente = @lista.retirar_produto(produto)
    respond_to do |format|
      format.js if request.xhr?
      format.html {encaminhar_index}
    end
    #encaminhar_index
    rescue ActiveRecord::RecordNotFound
      logger.error("Tentativa de acessar um produto inválido  #{params[:id]}")
      encaminhar_index('Produto Inválido')
  end
  
#  def checkout
 #   @lista = encontrar_lista
  #  if @lista.items.empty?
   #   encaminhar_index("Não há nenhum produto na sua lista de compras")
    #else
     # @pedido = Pedido.new
    #end
  #end
  
  #def salvar_pedido
   # @lista = encontrar_lista
  #  @pedido = Pedido.new(params[:pedido])
   # @pedido.adicionar_pedido_items_da_lista(@lista)
  #  if @pedido.save
   #   session[:lista] = nil
    #  encaminhar_index("Pedido enviado com sucesso!")
    #else
     # render :action => 'checkout'
    #end
  #end
  
  def checkout
    @lista = encontrar_lista
    encaminhar_index("Não há nenhum produto na sua lista de compras") if @lista.items.empty?
    if request.get?
      @pedido = Pedido.new
    else
      @pedido = Pedido.new(params[:pedido])
      @pedido.adicionar_pedido_items_da_lista(@lista)
      if @pedido.save 
        session[:lista] = nil
        encaminhar_index('Pedido enviado com sucesso!')
      #else
        #@pedido
        #render :action => 'checkout'
        #encaminhar_index("Não há nenhum produto na sua lista de compras")
      end
    end
  end
  
private

  def encaminhar_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end
  
  def encontrar_lista
    @lista = (session[:lista] ||= Lista.new)
  end


protected

def autorizar
end

end