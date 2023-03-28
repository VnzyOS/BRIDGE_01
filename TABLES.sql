--Criação das tabelas necessarias
CREATE TABLE produto(
id serial PRIMARY KEY,
nome VARCHAR(50),
descricao TEXT,
preco DOUBLE PRECISION,
categoria_id INTEGER NOT NULL,
FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE cliente(
id serial PRIMARY KEY,
nome VARCHAR(100),
email VARCHAR(100)
);

CREATE TABLE categoria(
id serial PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE produto_categoria(
produto_id INTEGER NOT NULL,
categoria_id INTEGER NOT NULL,
FOREIGN KEY (produto_id) REFERENCES produto(id),
FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE pedido(
id serial PRIMARY KEY,
cliente_id INTEGER NOT NULL,
data DATE,
endereco_entrega TEXT)

CREATE TABLE item_pedido(
id serial PRIMARY KEY,
pedido_id INTEGER NOT NULL,
produto_id INTEGER NOT NULL,
quantidade INTEGER,
FOREIGN KEY (pedido_id) REFERENCES pedido(id),
FOREIGN KEY (produto_id) REFERENCES produto(id)
);