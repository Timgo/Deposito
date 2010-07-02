class Lista
  attr_reader :items
  
  def initialize
    @items = []
  end
  
  def adicionar_produto(produto)
      item_existente = @items.find {|item| item.produto == produto}
      if item_existente
        item_existente.incrementa_quantidade
      else
        item_existente = ListaItem.new(produto)
        @items << item_existente
      end
      item_existente
  end
  
  def retirar_produto(produto)
    item_existente = @items.find {|item| item.produto == produto }
    item_existente.decrece_quantidade
    @items.delete(item_existente) if item_existente.quantidade == 0
    item_existente
  end
  
  def preco_total
    @items.sum { |item| item.preco_item }
  end
  
  def items_total
    @items.sum { |item| item.quantidade }
  end
  
end