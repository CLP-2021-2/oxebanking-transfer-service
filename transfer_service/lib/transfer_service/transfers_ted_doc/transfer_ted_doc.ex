defmodule TransferService.Transfers_ted_doc.Transfer_ted_doc do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transfers_ted_doc" do
    field :agencia, :string
    field :conta, :string
    field :transfer_id, :id

    timestamps()
  end

  @doc false
  def changeset(transfer_ted_doc, attrs) do
    transfer_ted_doc
    |> cast(attrs, [:conta, :agencia])
    |> validate_required([:conta, :agencia])
  end
end
