defmodule TransferService.TransfersPix.TransferPix do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transferspix" do
    field :chave, :string
    field :tipo, :string
    field :transfer_id, :id

    timestamps()
  end

  @doc false
  def changeset(transfer_pix, attrs) do
    transfer_pix
    |> cast(attrs, [:chave, :tipo])
    |> validate_required([:chave, :tipo])
  end
end
