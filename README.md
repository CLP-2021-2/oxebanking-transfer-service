# Serviço de transferências para o sistema OxeBanking

* Equipe: Michael Miller e Rafael Ribeiro
* Disciplina: Conceitos de Linguagens de Programação

## Como configurar o ambiente:

* Após clonar o repositório, vá para o diretório /transfer_service
* mix deps.get
* mix deps.compile
* Configure o arquivo /config/dev.exs com as credenciais da database no postgreSQL
* Garanta que o postgre tenha as seguintes credenciais:
  * username: postgres
  * password: postgres
  * database: "nome da database criada localmente"
* mix ecto.create
* mix ecto.migrate
* mix phx.server
