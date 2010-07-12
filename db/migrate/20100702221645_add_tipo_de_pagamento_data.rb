class AddTipoDePagamentoData < ActiveRecord::Migration
  def self.up
    TipoDePagamento.create(:exibido => "Depósito Bancário", :registro => "banco")
    TipoDePagamento.create(:exibido => "Boleto Bancário", :registro => "boleto")
    TipoDePagamento.create(:exibido => "PagSeguro",:registro => "pagseguro")
  end

  def self.down
    Tipo_De_Pagamento.delete_all
  end
end
