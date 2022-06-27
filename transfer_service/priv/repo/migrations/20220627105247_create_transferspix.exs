defmodule TransferService.Repo.Migrations.CreateTransferspix do
  use Ecto.Migration

  def change do
    create table(:transferspix) do
      add :chave, :string
      add :tipo, :string
      add :transfer_id, references(:transfers, on_delete: :nothing)

      timestamps()
    end

    create index(:transferspix, [:transfer_id])
  end
end
