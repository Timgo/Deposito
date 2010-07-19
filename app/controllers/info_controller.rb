class InfoController < ApplicationController

  def quem_comprou
    @produto = Produto.find(params[:id])
    @pedidos = @produto.pedidos
    respond_to do |format|
      format.html
      format.xml { render :layout => false,
                  :xml => @produto.to_xml(:include => :pedidos) }
    end
  end

protected

  def autorizar
  end
  
end
