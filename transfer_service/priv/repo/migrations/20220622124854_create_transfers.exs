defmodule TransferService.Repo.Migrations.CreateTransfers do
  use Ecto.Migration

  def change do
    create table(:transfers) do
      add :docClienteOrigem, :string
      add :nomeClienteOrigem, :string
      add :docClienteDestino, :string
      add :nomeClienteDestino, :string
      add :valorTransf, :float
      add :bancoOrigem, :string
      add :bancoDestino, :string
      add :dataHora, :naive_datetime

      timestamps()
    end
  end
end
