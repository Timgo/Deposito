xml.pedido_listar(:for_produto => @produto.title) do
  for o in @pedidos
    xml.pedido do
      xml.nome(o.nome)
      xml.email(o.email)
    end
  end
end