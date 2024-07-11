# MovieListingApp 

MovieListingApp é um aplicativo desenvolvido em Swift que exibe uma lista de filmes e uma tela de erro em caso de falha na obtenção dos dados.

## Funcionalidades 

- Exibição de uma lista de filmes com título e imagem. 
- Tela de erro personalizada para exibir mensagens de falha na obtenção dos dados. 

## Tecnologias Utilizadas 

- Swift 
- UIKit 
- URLSession para requisições de rede 
- JSONDecoder para parse de dados JSON 

## Estrutura do Projeto 

- Arquitetura que foi utilizada é a VIP (View-Interactor-Presenter)
- App Configuration
- Scenes
- Networking
- Commons
- Resources
- Components
- Tests

## Melhorias

- Criado uma tela de detalhes com descrição dos filmes (em Swift UI)
- Ação de favoritar cada filme e salvado em UserDefaults
- Criado testes de snapshot
- Criado um arquivo de Spacings
- Criado um Coordinator para controlar as navegações