defmodule TransferServiceWeb.TransferController do
  use TransferServiceWeb, :controller

  alias TransferService.Tranfers
  alias TransferService.Tranfers.Transfer

  def index(conn, _params) do
    transfers = Tranfers.list_transfers()
    render(conn, "index.html", transfers: transfers)
  end

  def new(conn, _params) do
    changeset = Tranfers.change_transfer(%Transfer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"transfer" => transfer_params}) do
    case Tranfers.create_transfer(transfer_params) do
      {:ok, transfer} ->
        conn
        |> put_flash(:info, "Transfer created successfully.")
        |> redirect(to: Routes.transfer_path(conn, :show, transfer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    transfer = Tranfers.get_transfer!(id)
    render(conn, "show.html", transfer: transfer)
  end

  def edit(conn, %{"id" => id}) do
    transfer = Tranfers.get_transfer!(id)
    changeset = Tranfers.change_transfer(transfer)
    render(conn, "edit.html", transfer: transfer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transfer" => transfer_params}) do
    transfer = Tranfers.get_transfer!(id)

    case Tranfers.update_transfer(transfer, transfer_params) do
      {:ok, transfer} ->
        conn
        |> put_flash(:info, "Transfer updated successfully.")
        |> redirect(to: Routes.transfer_path(conn, :show, transfer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", transfer: transfer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    transfer = Tranfers.get_transfer!(id)
    {:ok, _transfer} = Tranfers.delete_transfer(transfer)

    conn
    |> put_flash(:info, "Transfer deleted successfully.")
    |> redirect(to: Routes.transfer_path(conn, :index))
  end
end
