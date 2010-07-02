class ListaItem
  
  attr_reader :produto, :quantidade
  
  def initialize(produto)
    @produto = produto
    @quantidade = 1
  end
  
  def incrementa_quantidade
    @quantidade += 1
  end
  
  def decrece_quantidade
    @quantidade -= 1 if @quantidade > 0
  end
  
  def title
    @produto.title
  end
  
  #def price
   # @produto.price
  # => end
  
  def preco_item
    @produto.price * @quantidade
  end
  
  def quantidade
    @quantidade
  end
  
  def produto
    @produto
  end
  
end