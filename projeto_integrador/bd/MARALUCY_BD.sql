create database if not exists MARALUCY;
use MARALUCY;

create table Cliente (
    ClienteID decimal(15, 0) primary key,
    Nome varchar(100),
    Email varchar(100),
    Senha varchar(50),
    Telefone varchar(15),
    Endereco text,
    DataCadastro date
);

create table Categoria (
    CategoriaID decimal(15, 0) primary key,
    Nome varchar(100),
    Descricao text
);

create table Produto (
    ProdutoID decimal(15, 0) primary key,
    CategoriaID decimal(15, 0),
    Nome varchar(100),
    Descricao text,
    Preco decimal(10, 2),
    QuantidadeEstoque INT,
    foreign key (CategoriaID) references Categoria(CategoriaID)
);

create table Carrinho (
    CarrinhoID decimal(15, 0) primary key,
    ClienteID decimal(15, 0),
    Data_Criacao date,
    foreign key (ClienteID) references Cliente(ClienteID)
);

create table ItemCarrinho (
    ItemCarrinhoID decimal(15, 0) primary key,
    CarrinhoID decimal(15, 0),
    ProdutoID decimal(15, 0),
    Quantidade int,
    foreign key (CarrinhoID) references Carrinho(CarrinhoID),
    foreign key (ProdutoID) references Produto(ProdutoID)
);

create table Pedido (
    PedidoID decimal(15, 0) primary key,
    ClienteID decimal(15, 0),
    DataPedido date,
    StatusPedido varchar(50),
    ValorTotal decimal(10, 2),
    foreign key (ClienteID) references Cliente(ClienteID)
);

create table Item_do_Pedido (
    ItemPedidoID decimal(15, 0) primary key,
    PedidoID decimal(15, 0),
    ProdutoID decimal(15, 0),
    Quantidade int,
    PrecoUnitario decimal(10, 2),
    foreign key (PedidoID) references Pedido(PedidoID),
    foreign key (ProdutoID) references Produto(ProdutoID)
);

create table MetodoPagamento (
    MetodoPagamentoID decimal (15, 0) primary key,
    ClienteID decimal (15, 0),
    TipoPagamento varchar (50),
    DetalhePagamento text,
    foreign key (ClienteID) references Cliente(ClienteID)
);

