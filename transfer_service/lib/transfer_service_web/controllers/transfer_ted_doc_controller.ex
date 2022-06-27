defmodule TransferServiceWeb.Transfer_ted_docController do
  use TransferServiceWeb, :controller

  alias TransferService.Transfers_ted_doc
  alias TransferService.Transfers_ted_doc.Transfer_ted_doc

  def index(conn, _params) do
    transfers_ted_doc = Transfers_ted_doc.list_transfers_ted_doc()
    render(conn, "index.html", transfers_ted_doc: transfers_ted_doc)
  end

  def new(conn, _params) do
    changeset = Transfers_ted_doc.change_transfer_ted_doc(%Transfer_ted_doc{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"transfer_ted_doc" => transfer_ted_doc_params}) do
    case Transfers_ted_doc.create_transfer_ted_doc(transfer_ted_doc_params) do
      {:ok, transfer_ted_doc} ->
        conn
        |> put_flash(:info, "Transfer ted doc created successfully.")
        |> redirect(to: Routes.transfer_ted_doc_path(conn, :show, transfer_ted_doc))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    transfer_ted_doc = Transfers_ted_doc.get_transfer_ted_doc!(id)
    render(conn, "show.html", transfer_ted_doc: transfer_ted_doc)
  end

  def edit(conn, %{"id" => id}) do
    transfer_ted_doc = Transfers_ted_doc.get_transfer_ted_doc!(id)
    changeset = Transfers_ted_doc.change_transfer_ted_doc(transfer_ted_doc)
    render(conn, "edit.html", transfer_ted_doc: transfer_ted_doc, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transfer_ted_doc" => transfer_ted_doc_params}) do
    transfer_ted_doc = Transfers_ted_doc.get_transfer_ted_doc!(id)

    case Transfers_ted_doc.update_transfer_ted_doc(transfer_ted_doc, transfer_ted_doc_params) do
      {:ok, transfer_ted_doc} ->
        conn
        |> put_flash(:info, "Transfer ted doc updated successfully.")
        |> redirect(to: Routes.transfer_ted_doc_path(conn, :show, transfer_ted_doc))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", transfer_ted_doc: transfer_ted_doc, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    transfer_ted_doc = Transfers_ted_doc.get_transfer_ted_doc!(id)
    {:ok, _transfer_ted_doc} = Transfers_ted_doc.delete_transfer_ted_doc(transfer_ted_doc)

    conn
    |> put_flash(:info, "Transfer ted doc deleted successfully.")
    |> redirect(to: Routes.transfer_ted_doc_path(conn, :index))
  end
end
