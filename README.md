# Script de cotação e avaliação da desvalorização do REAL

Este script executa uma chamada API para resgatar os valores das cotações atuais do dólar, euro e real.

E exibe alguns resultados comparativos entre as moedas, exemplo:

```shell
Cotação Atual e verificação da desvalorização do REAL:
1 USD = 5.8226 BRL
1 EUR = 6.3569 BRL

Comparação entre moedas:
1 EUR equivale a 1.0918 USD
1 USD equivale a 0.916 EUR

Valores comuns convertidos de dólar para real:
100 USD = 582.0 BRL
500 USD = 2910.0 BRL
1000 USD = 5820.0 BRL

Valores comuns convertidos de euro para real:
100 EUR = 636.0 BRL
500 EUR = 3180.0 BRL
1000 EUR = 6360.0 BRL
```

## Como executar o script

É necessário ter o Ruby instalado na sua máquina na versão 3.4.0.

No terminal, execute:

```shell
ruby cotacaodia.rb
```

## Executando a api:

```shell
ruby app.rb
```

## Visualizando as linhas da tabela exchanges

```shell
bundle exec rake exchanges
```
## Inicialiando Docker

Para buildar a imagem do Docker, no terminal execute: 
```shell
docker compose up
```

## Inicializando o PostgreSQL no Docker

Para iniciar o banco de dados dentro do Docker, com o aplicativo já rodando, no terminal execute respectivamente: 

```
docker-compose run cotacao bundle exec rake db:create
docker-compose run cotacao bundle exec rake db:migrate
```