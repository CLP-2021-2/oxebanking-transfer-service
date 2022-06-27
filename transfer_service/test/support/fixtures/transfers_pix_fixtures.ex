defmodule TransferService.TransfersPixFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TransferService.TransfersPix` context.
  """

  @doc """
  Generate a transfer_pix.
  """
  def transfer_pix_fixture(attrs \\ %{}) do
    {:ok, transfer_pix} =
      attrs
      |> Enum.into(%{
        chave: "some chave",
        tipo: "some tipo"
      })
      |> TransferService.TransfersPix.create_transfer_pix()

    transfer_pix
  end
end
