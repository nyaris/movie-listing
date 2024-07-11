# MovieListingApp 

MovieListingApp é um aplicativo desenvolvido em Swift que exibe uma lista de filmes e uma tela de erro em caso de falha na obtenção dos dados.

## Fluxos
<img width=250 src=https://github.com/nyaris/movie-listing/assets/59100459/cbc1a06d-0594-41a0-912c-92dc32ee8b9b>
<img width=250 src=https://github.com/nyaris/movie-listing/assets/59100459/8d527b0f-fab3-4b04-a5ac-6102c0bfea56>
<img width=250 src=https://github.com/nyaris/movie-listing/assets/59100459/2075be4f-805e-43c2-b93c-00fbe5dec3d0>

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
