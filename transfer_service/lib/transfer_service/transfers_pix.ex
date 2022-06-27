defmodule TransferService.TransfersPix do
  @moduledoc """
  The TransfersPix context.
  """

  import Ecto.Query, warn: false
  alias TransferService.Repo

  alias TransferService.TransfersPix.TransferPix

  @doc """
  Returns the list of transferspix.

  ## Examples

      iex> list_transferspix()
      [%TransferPix{}, ...]

  """
  def list_transferspix do
    Repo.all(TransferPix)
  end

  @doc """
  Gets a single transfer_pix.

  Raises `Ecto.NoResultsError` if the Transfer pix does not exist.

  ## Examples

      iex> get_transfer_pix!(123)
      %TransferPix{}

      iex> get_transfer_pix!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transfer_pix!(id), do: Repo.get!(TransferPix, id)

  @doc """
  Creates a transfer_pix.

  ## Examples

      iex> create_transfer_pix(%{field: value})
      {:ok, %TransferPix{}}

      iex> create_transfer_pix(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transfer_pix(attrs \\ %{}) do
    %TransferPix{}
    |> TransferPix.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transfer_pix.

  ## Examples

      iex> update_transfer_pix(transfer_pix, %{field: new_value})
      {:ok, %TransferPix{}}

      iex> update_transfer_pix(transfer_pix, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transfer_pix(%TransferPix{} = transfer_pix, attrs) do
    transfer_pix
    |> TransferPix.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a transfer_pix.

  ## Examples

      iex> delete_transfer_pix(transfer_pix)
      {:ok, %TransferPix{}}

      iex> delete_transfer_pix(transfer_pix)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transfer_pix(%TransferPix{} = transfer_pix) do
    Repo.delete(transfer_pix)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transfer_pix changes.

  ## Examples

      iex> change_transfer_pix(transfer_pix)
      %Ecto.Changeset{data: %TransferPix{}}

  """
  def change_transfer_pix(%TransferPix{} = transfer_pix, attrs \\ %{}) do
    TransferPix.changeset(transfer_pix, attrs)
  end
end
