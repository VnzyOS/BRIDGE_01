--Inserção de registros aleatorios nas tabelas de acordo com a necessidade de cada uma delas
INSERT INTO categoria (nome) 
SELECT 'Categoria' || seq AS nome FROM generate_series(1, 50) AS seq;

INSERT INTO produto (nome, descricao, preco, categoria_id)
SELECT 'Produto' || seq AS nome, 'Descrição do produto ' || seq AS descricao, (random() * 1000)::numeric(10,2) AS preco, (random() * 49)::integer + 1 AS categoria_id FROM generate_series(1, 50) AS seq;

INSERT INTO cliente (nome, email) 
SELECT 'Cliente' || seq AS nome, 'cliente' || seq || '@exemplo.com' AS email FROM generate_series(1, 50) AS seq;

INSERT INTO pedido (data, endereco_entrega, cliente_id)
SELECT timestamp '2023-03-27 12:00:00' + ((random() * 7)::integer - 3) * interval '1 day' AS data, 'Endereço de entrega ' || seq AS endereco_entrega, (random() * 50)::integer + 1 AS cliente_id FROM generate_series(1, 50) AS seq;

INSERT INTO item_pedido (quantidade, preco, produto_id, pedido_id)
SELECT (random() * 10)::integer + 1 AS quantidade,
produto.preco AS preco,
produto.id AS produto_id,
pedido.id AS pedido_id
FROM produto
CROSS JOIN pedido
WHERE random() < 0.5; 

/*o número de registros inseridos em cada tabela é fixo em 50, mas pode ser alterado modificando os valores passados para a função generate_series().
 Também é possível ajustar a probabilidade de um produto ser inserido em um pedido alterando o valor passado para a função random() na cláusula WHERE*/