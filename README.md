# MAGICVIEW

![Logo](https://raw.githubusercontent.com/viniciusmatoso/magicview/main/assets/image/magicview.gif)

### Objetivo

O objetivo principal do aplicativo é proporcionar uma experiência de descoberta de
conteúdo intuitiva e envolvente para os usuários, facilitando a navegação por uma ampla
variedade de filmes e séries populares. No entanto, antes de começar a integrar dados reais
da API TMDb, a empresa decidiu lançar uma versão inicial do aplicativo que apresentará
uma lista estática de filmes e séries populares, com informações básicas sobre cada título.

### Telas do Aplicativo:

1. Tela de Início: Exibe uma seleção dos filmes e séries mais populares atualmente.
   Cada item na lista será clicável para visualizar mais detalhes.

2. Tela de Detalhes do Filme/Série: Mostra informações completas do filme ou série
   selecionado, como sinopse, elenco, avaliações dos usuários, trailer (se disponível),
   etc.

### Funcionalidades do Aplicativo:

1. Visualização de Filmes e Séries Populares: O aplicativo exibirá uma lista dos filmes e
   séries mais populares, permitindo que os usuários naveguem e descubram novos
   conteúdos.

2. Detalhes de Filmes e Séries: Os usuários poderão visualizar os detalhes completos de
   cada filme ou série, incluindo sinopse, elenco, avaliações dos usuários, trailer (se
   disponível), etc ao clicar em um título específico na tela inicial.

3. Pesquisa de Filmes e Séries (desafio extra): Os usuários poderão pesquisar por
   filmes e séries utilizando palavras-chave, títulos, gêneros, etc., para encontrar
   conteúdos específicos

   ### Arquivo constants.dart

   Na pasta utility possui um arquivo chamado constants_sample.dart; renomear o arquivo para constants.dart.
   No atributo TOKEN_BEAR adicionar o TOKEN BEAR na API que esta disponivel no site themoviedb.org.

## Configuração DOCKER

Para Rodar o aplicativo instale atravé do docker as seguintes imagens.

API
etsfspontocom/magicview:1.2
Banco de dados
mysql

Crie um arquivo chamado docker-compose.yaml com os seguintes linhas

```
networks:
  magicview-network:
    driver: bridge

services:
  magicview-mysql:
    container_name: magicview-mysql
    image: mysql:latest
    container_name: magicview-mysql
    environment:
      MYSQL_ROOT_PASSWORD: SENHAROOT
      MYSQL_DATABASE: magicview
      MYSQL_USER: USUARIODOBANCO
      MYSQL_PASSWORD: SENHADOUSUARIOBANCO
    ports:
      - "3306:3306"
    networks:
      - magicview-network
    volumes:
      - d:\volumes_docker\magic_view\mysql:/var/lib/mysql

  magicview-api:
    image: magiview:1.1
    environment:
      SRV_PORT: 8080
      DATABASE_HOST: magicview-magicview-mysql-1
      DATABASE_USER: USUARIODOBANCO
      DATABASE_PASSWORD: SENHADOUSUARIOBANCO
    ports:
      - "8080:8080"
    networks:
      - magicview-network
    volumes:
      - d:\volumes_docker\magic_view\uploads:/uploads
    depends_on:
      - magicview-mysql
    restart: on-failure

```

#Para subir as imagens execute o comando abaixo.

```
docker-composer up -d

```

Mais detalhes consulte o github github.com/adevalter/magicview
