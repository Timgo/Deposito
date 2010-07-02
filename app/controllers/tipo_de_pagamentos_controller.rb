class TipoDePagamentosController < ApplicationController
  # GET /tipo_de_pagamentos
  # GET /tipo_de_pagamentos.xml
  def index
    @tipo_de_pagamentos = TipoDePagamento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_de_pagamentos }
    end
  end

  # GET /tipo_de_pagamentos/1
  # GET /tipo_de_pagamentos/1.xml
  def show
    @tipo_de_pagamento = TipoDePagamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_de_pagamento }
    end
  end

  # GET /tipo_de_pagamentos/new
  # GET /tipo_de_pagamentos/new.xml
  def new
    @tipo_de_pagamento = TipoDePagamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_de_pagamento }
    end
  end

  # GET /tipo_de_pagamentos/1/edit
  def edit
    @tipo_de_pagamento = TipoDePagamento.find(params[:id])
  end

  # POST /tipo_de_pagamentos
  # POST /tipo_de_pagamentos.xml
  def create
    @tipo_de_pagamento = TipoDePagamento.new(params[:tipo_de_pagamento])

    respond_to do |format|
      if @tipo_de_pagamento.save
        flash[:notice] = 'TipoDePagamento was successfully created.'
        format.html { redirect_to(@tipo_de_pagamento) }
        format.xml  { render :xml => @tipo_de_pagamento, :status => :created, :location => @tipo_de_pagamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_de_pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_de_pagamentos/1
  # PUT /tipo_de_pagamentos/1.xml
  def update
    @tipo_de_pagamento = TipoDePagamento.find(params[:id])

    respond_to do |format|
      if @tipo_de_pagamento.update_attributes(params[:tipo_de_pagamento])
        flash[:notice] = 'TipoDePagamento was successfully updated.'
        format.html { redirect_to(@tipo_de_pagamento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_de_pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_de_pagamentos/1
  # DELETE /tipo_de_pagamentos/1.xml
  def destroy
    @tipo_de_pagamento = TipoDePagamento.find(params[:id])
    @tipo_de_pagamento.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_de_pagamentos_url) }
      format.xml  { head :ok }
    end
  end
end
