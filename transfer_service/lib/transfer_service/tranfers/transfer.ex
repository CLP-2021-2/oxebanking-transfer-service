defmodule TransferService.Tranfers.Transfer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transfers" do
    field :bancoDestino, :string
    field :bancoOrigem, :string
    field :dataHora, :naive_datetime
    field :docClienteDestino, :string
    field :docClienteOrigem, :string
    field :nomeClienteDestino, :string
    field :nomeClienteOrigem, :string
    field :valorTransf, :float

    timestamps()
  end

  @doc false
  def changeset(transfer, attrs) do
    transfer
    |> cast(attrs, [:docClienteOrigem, :nomeClienteOrigem, :docClienteDestino, :nomeClienteDestino, :valorTransf, :bancoOrigem, :bancoDestino, :dataHora])
    |> validate_required([:docClienteOrigem, :nomeClienteOrigem, :docClienteDestino, :nomeClienteDestino, :valorTransf, :bancoOrigem, :bancoDestino, :dataHora])
  end
end
