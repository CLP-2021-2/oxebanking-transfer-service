defmodule TransferService.Repo.Migrations.CreateTransfersTedDoc do
  use Ecto.Migration

  def change do
    create table(:transfers_ted_doc) do
      add :conta, :string
      add :agencia, :string
      add :transfer_id, references(:transfers, on_delete: :nothing)

      timestamps()
    end

    create index(:transfers_ted_doc, [:transfer_id])
  end
end
