defmodule TransferService.Transfers_ted_docFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TransferService.Transfers_ted_doc` context.
  """

  @doc """
  Generate a transfer_ted_doc.
  """
  def transfer_ted_doc_fixture(attrs \\ %{}) do
    {:ok, transfer_ted_doc} =
      attrs
      |> Enum.into(%{
        agencia: "some agencia",
        conta: "some conta"
      })
      |> TransferService.Transfers_ted_doc.create_transfer_ted_doc()

    transfer_ted_doc
  end
end
