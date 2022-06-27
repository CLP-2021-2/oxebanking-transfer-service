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
  * database: transfer_service_dev
  * trocar http: [127.0.0.1, port: 5432] para http: [port: 4000]
* mix ecto.create
* mix ecto.migrate
* mix phx.server
