
# Sistema de Pedidos - CodingFoodServer

Este projeto tem como objetivo a criação de um sistema de gerenciamento de pedidos, onde os clientes podem selecionar pratos, realizar pedidos e as cozinhas podem atualizar o status dos mesmos. O banco de dados foi projetado para ser executado no MySQL, com o Modelo de Dados do Sistema (MFD) descrito a seguir.

## Modelo de Dados do Sistema (MFD)

O modelo de dados é composto por 5 tabelas principais que armazenam as informações essenciais para o funcionamento do sistema. As tabelas e suas relações são descritas a seguir:

### Tabela `clientes`
- **Descrição**: Armazena informações sobre os clientes.
- **Campos**:
  - `id`: Identificador único do cliente (chave primária).
  - `endereco`: Endereço do cliente.
  - `nome`: Nome do cliente.

```sql
-- Criação da tabela clientes
CREATE TABLE `clientes` (
    `id` bigint NOT NULL AUTO_INCREMENT,  -- Identificador único do cliente (chave primária)
    `endereco` varchar(255) DEFAULT NULL,  -- Endereço do cliente
    `nome` varchar(255) DEFAULT NULL,      -- Nome do cliente
    PRIMARY KEY (`id`)                    -- Define a chave primária para a tabela clientes
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

### Tabela `cozinhas`
- **Descrição**: Armazena informações sobre os tipos de cozinhas.
- **Campos**:
  - `id`: Identificador único da cozinha (chave primária).
  - `tipo`: Tipo de cozinha (ex: Italiana, Chinesa, etc.).

```sql
-- Criação da tabela cozinhas
CREATE TABLE `cozinhas` (
    `id` bigint NOT NULL AUTO_INCREMENT,  -- Identificador único da cozinha (chave primária)
    `tipo` varchar(255) DEFAULT NULL,     -- Tipo de cozinha (ex: Italiana, Chinesa, etc.)
    PRIMARY KEY (`id`)                    -- Define a chave primária para a tabela cozinhas
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

### Tabela `dishes` (Pratos)
- **Descrição**: Armazena informações sobre os pratos disponíveis para os pedidos.
- **Campos**:
  - `id`: Identificador único do prato (chave primária).
  - `description`: Descrição do prato.
  - `name`: Nome do prato.
  - `price`: Preço do prato.

```sql
-- Criação da tabela dishes (pratos)
CREATE TABLE `dishes` (
    `id` bigint NOT NULL AUTO_INCREMENT,  -- Identificador único do prato (chave primária)
    `description` varchar(255) DEFAULT NULL,  -- Descrição do prato
    `name` varchar(255) DEFAULT NULL,        -- Nome do prato
    `price` double DEFAULT NULL,             -- Preço do prato
    PRIMARY KEY (`id`)                      -- Define a chave primária para a tabela dishes
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

### Tabela `pedidos`
- **Descrição**: Armazena informações sobre os pedidos realizados pelos clientes.
- **Campos**:
  - `id`: Identificador único do pedido (chave primária).
  - `data_criacao`: Data e hora de criação do pedido.
  - `status`: Status do pedido (ex: Em preparação, Enviado, Entregue).
  - `total`: Total do pedido.
  - `cliente_id`: Referência ao cliente que fez o pedido (chave estrangeira).
  - `cozinha_id`: Referência à cozinha do pedido (chave estrangeira).
  - `endereco_cliente`: Endereço do cliente.
  - `nome_cliente`: Nome do cliente.

```sql
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
```

### Tabela `pedido_dishes`
- **Descrição**: Relaciona os pedidos com os pratos que foram pedidos.
- **Campos**:
  - `pedido_id`: Referência ao pedido (chave estrangeira).
  - `dish_id`: Referência ao prato (chave estrangeira).

```sql
-- Criação da tabela pedido_dishes (relaciona os pedidos aos pratos)
CREATE TABLE `pedido_dishes` (
    `pedido_id` bigint NOT NULL,     -- Identificador do pedido (chave estrangeira)
    `dish_id` bigint NOT NULL,       -- Identificador do prato (chave estrangeira)
    KEY `FKjufulm1ik9k8hru5tt7i7krey` (`dish_id`),  -- Índice para a chave estrangeira dish_id
    KEY `FK11x83ju0c52jod0wxjat0trrv` (`pedido_id`), -- Índice para a chave estrangeira pedido_id
    CONSTRAINT `FK11x83ju0c52jod0wxjat0trrv` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`), -- Define a chave estrangeira referenciando a tabela pedidos
    CONSTRAINT `FKjufulm1ik9k8hru5tt7i7krey` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`)  -- Define a chave estrangeira referenciando a tabela dishes
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

## Passos para Execução do Script no MySQL

1. **Acesse o MySQL**: Utilize um terminal ou um cliente de banco de dados, como o MySQL Workbench, para acessar seu banco de dados MySQL.
   
   Exemplo de comando para acessar o MySQL:
   ```bash
   mysql -u seu_usuario -p
   ```

2. **Criação do Banco de Dados**:
   Se ainda não tiver um banco de dados criado, execute o seguinte comando SQL para criar o banco de dados `sistema_pedidos` e selecioná-lo:
   ```sql
   CREATE DATABASE sistema_pedidos;
   USE sistema_pedidos;
   ```

3. **Execução do Script**:
   Copie o script SQL acima e cole no seu cliente MySQL para criar as tabelas e as relações entre elas.

4. **Verifique as Tabelas Criadas**:
   Após a execução do script, você pode verificar se as tabelas foram criadas corretamente com o comando:
   ```sql
   SHOW TABLES;
   ```

   E para visualizar a estrutura de uma tabela específica:
   ```sql
   DESCRIBE nome_da_tabela;
   ```

## Observações Adicionais

### Dependências
- O script foi desenvolvido para ser executado em um banco de dados MySQL 5.7 ou superior.
- Não há dependências externas além do MySQL para o banco de dados.

### Restrição de Integridade
- As tabelas estão estruturadas com **chaves primárias** para garantir a unicidade dos registros.
- As **chaves estrangeiras** estabelecem relações entre as tabelas `pedidos`, `clientes`, `cozinhas` e `dishes`, garantindo a integridade referencial.
- **Índices** adicionais são criados nas chaves estrangeiras para melhorar a performance das consultas relacionadas.

### Potenciais Melhorias
- **Validação de Dados**: Dependendo do sistema, pode ser necessário adicionar mais restrições de integridade, como `NOT NULL` em campos críticos.
- **Triggers**: Para garantir maior controle sobre o estado dos pedidos, podem ser implementadas triggers que atualizam automaticamente o status de um pedido com base em ações externas.

---
