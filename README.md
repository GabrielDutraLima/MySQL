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

### Tabela `cozinhas`
- **Descrição**: Armazena informações sobre os tipos de cozinhas.
- **Campos**:
  - `id`: Identificador único da cozinha (chave primária).
  - `tipo`: Tipo de cozinha (ex: Italiana, Chinesa, etc.).

### Tabela `dishes` (Pratos)
- **Descrição**: Armazena informações sobre os pratos disponíveis para os pedidos.
- **Campos**:
  - `id`: Identificador único do prato (chave primária).
  - `description`: Descrição do prato.
  - `name`: Nome do prato.
  - `price`: Preço do prato.

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

### Tabela `pedido_dishes`
- **Descrição**: Relaciona os pedidos com os pratos que foram pedidos.
- **Campos**:
  - `pedido_id`: Referência ao pedido (chave estrangeira).
  - `dish_id`: Referência ao prato (chave estrangeira).

## Passos para Execução do Script no MySQL

1. **Acesse o MySQL**: Utilize um terminal ou um cliente de banco de dados, como o MySQL Workbench, para acessar seu banco de dados MySQL.
   
   Exemplo de comando para acessar o MySQL:
   ```bash
   mysql -u seu_usuario -p
