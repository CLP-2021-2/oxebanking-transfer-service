defmodule TransferServiceWeb.TransferPixController do
  use TransferServiceWeb, :controller

  alias TransferService.TransfersPix
  alias TransferService.TransfersPix.TransferPix

  def index(conn, _params) do
    transferspix = TransfersPix.list_transferspix()
    render(conn, "index.html", transferspix: transferspix)
  end

  def new(conn, _params) do
    changeset = TransfersPix.change_transfer_pix(%TransferPix{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"transfer_pix" => transfer_pix_params}) do
    case TransfersPix.create_transfer_pix(transfer_pix_params) do
      {:ok, transfer_pix} ->
        conn
        |> put_flash(:info, "Transfer pix created successfully.")
        |> redirect(to: Routes.transfer_pix_path(conn, :show, transfer_pix))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    transfer_pix = TransfersPix.get_transfer_pix!(id)
    render(conn, "show.html", transfer_pix: transfer_pix)
  end

  def edit(conn, %{"id" => id}) do
    transfer_pix = TransfersPix.get_transfer_pix!(id)
    changeset = TransfersPix.change_transfer_pix(transfer_pix)
    render(conn, "edit.html", transfer_pix: transfer_pix, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transfer_pix" => transfer_pix_params}) do
    transfer_pix = TransfersPix.get_transfer_pix!(id)

    case TransfersPix.update_transfer_pix(transfer_pix, transfer_pix_params) do
      {:ok, transfer_pix} ->
        conn
        |> put_flash(:info, "Transfer pix updated successfully.")
        |> redirect(to: Routes.transfer_pix_path(conn, :show, transfer_pix))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", transfer_pix: transfer_pix, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    transfer_pix = TransfersPix.get_transfer_pix!(id)
    {:ok, _transfer_pix} = TransfersPix.delete_transfer_pix(transfer_pix)

    conn
    |> put_flash(:info, "Transfer pix deleted successfully.")
    |> redirect(to: Routes.transfer_pix_path(conn, :index))
  end
end
