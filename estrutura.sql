-- Criação da tabela clientes
CREATE TABLE `clientes` (
  `id` bigint NOT NULL AUTO_INCREMENT,  -- Identificador único do cliente (chave primária)
  `endereco` varchar(255) DEFAULT NULL,  -- Endereço do cliente
  `nome` varchar(255) DEFAULT NULL,      -- Nome do cliente
  PRIMARY KEY (`id`)                    -- Define a chave primária para a tabela clientes
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Criação da tabela cozinhas
CREATE TABLE `cozinhas` (
  `id` bigint NOT NULL AUTO_INCREMENT,  -- Identificador único da cozinha (chave primária)
  `tipo` varchar(255) DEFAULT NULL,     -- Tipo de cozinha (ex: Italiana, Chinesa, etc.)
  PRIMARY KEY (`id`)                    -- Define a chave primária para a tabela cozinhas
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Criação da tabela dishes (pratos)
CREATE TABLE `dishes` (
  `id` bigint NOT NULL AUTO_INCREMENT,  -- Identificador único do prato (chave primária)
  `description` varchar(255) DEFAULT NULL,  -- Descrição do prato
  `name` varchar(255) DEFAULT NULL,        -- Nome do prato
  `price` double DEFAULT NULL,             -- Preço do prato
  PRIMARY KEY (`id`)                      -- Define a chave primária para a tabela dishes
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Criação da tabela pedidos (contém as informações dos pedidos feitos)
CREATE TABLE `pedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,      -- Identificador único do pedido (chave primária)
  `data_criacao` datetime(6) DEFAULT NULL,  -- Data e hora de criação do pedido
  `status` varchar(255) DEFAULT NULL,       -- Status do pedido (ex: Em preparação, Enviado, Entregue)
  `total` double NOT NULL,                  -- Total do pedido
  `cliente_id` bigint DEFAULT NULL,         -- Identificador do cliente (chave estrangeira)
  `cozinha_id` bigint DEFAULT NULL,         -- Identificador da cozinha (chave estrangeira)
  `endereco_cliente` varchar(255) DEFAULT NULL, -- Endereço do cliente
  `nome_cliente` varchar(255) DEFAULT NULL, -- Nome do cliente
  `cliente` varchar(255) DEFAULT NULL,      -- Nome do cliente adicional (duplicado para facilitar consultas)
  `endereco` varchar(255) DEFAULT NULL,     -- Endereço adicional do cliente
  PRIMARY KEY (`id`),                      -- Define a chave primária para a tabela pedidos
  KEY `FKg7202lk0hwxn04bmdl2thth5b` (`cliente_id`),  -- Índice para a chave estrangeira cliente_id
  KEY `FKk49tg42111o4od27e60s7xham` (`cozinha_id`),  -- Índice para a chave estrangeira cozinha_id
  CONSTRAINT `FKg7202lk0hwxn04bmdl2thth5b` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),  -- Define a chave estrangeira referenciando a tabela clientes
  CONSTRAINT `FKk49tg42111o4od27e60s7xham` FOREIGN KEY (`cozinha_id`) REFERENCES `cozinhas` (`id`)   -- Define a chave estrangeira referenciando a tabela cozinhas
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Criação da tabela pedido_dishes (relaciona os pedidos aos pratos)
CREATE TABLE `pedido_dishes` (
  `pedido_id` bigint NOT NULL,     -- Identificador do pedido (chave estrangeira)
  `dish_id` bigint NOT NULL,       -- Identificador do prato (chave estrangeira)
  KEY `FKjufulm1ik9k8hru5tt7i7krey` (`dish_id`),  -- Índice para a chave estrangeira dish_id
  KEY `FK11x83ju0c52jod0wxjat0trrv` (`pedido_id`), -- Índice para a chave estrangeira pedido_id
  CONSTRAINT `FK11x83ju0c52jod0wxjat0trrv` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`), -- Define a chave estrangeira referenciando a tabela pedidos
  CONSTRAINT `FKjufulm1ik9k8hru5tt7i7krey` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`)  -- Define a chave estrangeira referenciando a tabela dishes
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
