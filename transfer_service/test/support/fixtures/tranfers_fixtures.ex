defmodule TransferService.TranfersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TransferService.Tranfers` context.
  """

  @doc """
  Generate a transfer.
  """
  def transfer_fixture(attrs \\ %{}) do
    {:ok, transfer} =
      attrs
      |> Enum.into(%{
        bancoDestino: "some bancoDestino",
        bancoOrigem: "some bancoOrigem",
        dataHora: ~N[2022-06-21 12:48:00],
        docClienteDestino: "some docClienteDestino",
        docClienteOrigem: "some docClienteOrigem",
        nomeClienteDestino: "some nomeClienteDestino",
        nomeClienteOrigem: "some nomeClienteOrigem",
        valorTransf: 120.5
      })
      |> TransferService.Tranfers.create_transfer()

    transfer
  end
end
