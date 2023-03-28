--Listei nome descricao e preço da tabela produto
SELECT nome, descricao, preco
FROM produto
ORDER BY Nome ASC;

--Listei as categorias com os nomes e numeros de id dos produtos associados a ela
SELECT categoria.nome, produto.nome, produto.id
FROM categoria
JOIN produto ON produto.categoria_id = categoria.id
WHERE produto.categoria_id IN (SELECT categoria.id FROM categoria)
ORDER BY categoria.nome ASC, produto.nome ASC

--Listei tabela com endereco de entrega, preco total com data decrescente
SELECT pedido.data, pedido.endereco_entrega, SUM(item_pedido.preco * item_pedido.quantidade) AS total_do_pedido
FROM Pedido
JOIN Item_Pedido ON Pedido.ID = Item_Pedido.Pedido_ID
GROUP BY Pedido.ID
ORDER BY Pedido.Data DESC;

--Listei os produtos presentes em um ou mais pedidos com nome, descricao, preco em ordem decrescente de vendas
SELECT produto.nome, produto.descricao, produto.preco, SUM(item_pedido.quantidade) AS quantidade_total_vendida
FROM Produto
JOIN Item_Pedido ON Produto.ID = Item_Pedido.Produto_ID
GROUP BY Produto.ID
ORDER BY SUM(Item_Pedido.Quantidade) DESC;

--Listei os pedidos de x cliente em um determinado periodo de tempo
SELECT pedido.id, pedido.cliente_id, pedido.data, pedido.endereco_entrega
FROM pedido
JOIN item_pedido ON pedido.ID = item_pedido.pedido_ID
JOIN cliente ON pedido.cliente_ID = cliente.ID
WHERE cliente.nome IN (SELECT nome FROM cliente limit 1) AND pedido.data BETWEEN '2023-01-01' AND '2023-04-23'
ORDER BY cliente.nome ASC, pedido.data ASC;

--Listei produtos com mais de uma reincidencia
SELECT produto.nome, COUNT(produto.nome) AS replicacoes
FROM produto
GROUP BY produto.nome
HAVING COUNT(produto.nome)>1
ORDER BY replicacoes DESC;