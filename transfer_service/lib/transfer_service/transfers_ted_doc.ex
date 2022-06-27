defmodule TransferService.Transfers_ted_doc do
  @moduledoc """
  The Transfers_ted_doc context.
  """

  import Ecto.Query, warn: false
  alias TransferService.Repo

  alias TransferService.Transfers_ted_doc.Transfer_ted_doc

  @doc """
  Returns the list of transfers_ted_doc.

  ## Examples

      iex> list_transfers_ted_doc()
      [%Transfer_ted_doc{}, ...]

  """
  def list_transfers_ted_doc do
    Repo.all(Transfer_ted_doc)
  end

  @doc """
  Gets a single transfer_ted_doc.

  Raises `Ecto.NoResultsError` if the Transfer ted doc does not exist.

  ## Examples

      iex> get_transfer_ted_doc!(123)
      %Transfer_ted_doc{}

      iex> get_transfer_ted_doc!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transfer_ted_doc!(id), do: Repo.get!(Transfer_ted_doc, id)

  @doc """
  Creates a transfer_ted_doc.

  ## Examples

      iex> create_transfer_ted_doc(%{field: value})
      {:ok, %Transfer_ted_doc{}}

      iex> create_transfer_ted_doc(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transfer_ted_doc(attrs \\ %{}) do
    %Transfer_ted_doc{}
    |> Transfer_ted_doc.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transfer_ted_doc.

  ## Examples

      iex> update_transfer_ted_doc(transfer_ted_doc, %{field: new_value})
      {:ok, %Transfer_ted_doc{}}

      iex> update_transfer_ted_doc(transfer_ted_doc, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transfer_ted_doc(%Transfer_ted_doc{} = transfer_ted_doc, attrs) do
    transfer_ted_doc
    |> Transfer_ted_doc.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transfer_ted_doc.

  ## Examples

      iex> delete_transfer_ted_doc(transfer_ted_doc)
      {:ok, %Transfer_ted_doc{}}

      iex> delete_transfer_ted_doc(transfer_ted_doc)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transfer_ted_doc(%Transfer_ted_doc{} = transfer_ted_doc) do
    Repo.delete(transfer_ted_doc)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transfer_ted_doc changes.

  ## Examples

      iex> change_transfer_ted_doc(transfer_ted_doc)
      %Ecto.Changeset{data: %Transfer_ted_doc{}}

  """
  def change_transfer_ted_doc(%Transfer_ted_doc{} = transfer_ted_doc, attrs \\ %{}) do
    Transfer_ted_doc.changeset(transfer_ted_doc, attrs)
  end
end
