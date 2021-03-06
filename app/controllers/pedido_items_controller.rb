class PedidoItemsController < ApplicationController
  # GET /item_pedidos
  # GET /item_pedidos.xml
  def index
    @item_pedidos = ItemPedido.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item_pedidos }
    end
  end

  # GET /item_pedidos/1
  # GET /item_pedidos/1.xml
  def show
    @item_pedido = ItemPedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item_pedido }
    end
  end

  # GET /item_pedidos/new
  # GET /item_pedidos/new.xml
  def new
    @item_pedido = ItemPedido.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item_pedido }
    end
  end

  # GET /item_pedidos/1/edit
  def edit
    @item_pedido = ItemPedido.find(params[:id])
  end

  # POST /item_pedidos
  # POST /item_pedidos.xml
  def create
    @item_pedido = ItemPedido.new(params[:item_pedido])

    respond_to do |format|
      if @item_pedido.save
        flash[:notice] = 'ItemPedido was successfully created.'
        format.html { redirect_to(@item_pedido) }
        format.xml  { render :xml => @item_pedido, :status => :created, :location => @item_pedido }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item_pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /item_pedidos/1
  # PUT /item_pedidos/1.xml
  def update
    @item_pedido = ItemPedido.find(params[:id])

    respond_to do |format|
      if @item_pedido.update_attributes(params[:item_pedido])
        flash[:notice] = 'ItemPedido was successfully updated.'
        format.html { redirect_to(@item_pedido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item_pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /item_pedidos/1
  # DELETE /item_pedidos/1.xml
  def destroy
    @item_pedido = ItemPedido.find(params[:id])
    @item_pedido.destroy

    respond_to do |format|
      format.html { redirect_to(item_pedidos_url) }
      format.xml  { head :ok }
    end
  end
end
