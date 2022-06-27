defmodule TransferServiceWeb.Transfer_ted_docControllerTest do
  use TransferServiceWeb.ConnCase

  import TransferService.Transfers_ted_docFixtures

  @create_attrs %{agencia: "some agencia", conta: "some conta"}
  @update_attrs %{agencia: "some updated agencia", conta: "some updated conta"}
  @invalid_attrs %{agencia: nil, conta: nil}

  describe "index" do
    test "lists all transfers_ted_doc", %{conn: conn} do
      conn = get(conn, Routes.transfer_ted_doc_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Transfers ted doc"
    end
  end

  describe "new transfer_ted_doc" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.transfer_ted_doc_path(conn, :new))
      assert html_response(conn, 200) =~ "New Transfer ted doc"
    end
  end

  describe "create transfer_ted_doc" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transfer_ted_doc_path(conn, :create), transfer_ted_doc: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.transfer_ted_doc_path(conn, :show, id)

      conn = get(conn, Routes.transfer_ted_doc_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Transfer ted doc"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transfer_ted_doc_path(conn, :create), transfer_ted_doc: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Transfer ted doc"
    end
  end

  describe "edit transfer_ted_doc" do
    setup [:create_transfer_ted_doc]

    test "renders form for editing chosen transfer_ted_doc", %{conn: conn, transfer_ted_doc: transfer_ted_doc} do
      conn = get(conn, Routes.transfer_ted_doc_path(conn, :edit, transfer_ted_doc))
      assert html_response(conn, 200) =~ "Edit Transfer ted doc"
    end
  end

  describe "update transfer_ted_doc" do
    setup [:create_transfer_ted_doc]

    test "redirects when data is valid", %{conn: conn, transfer_ted_doc: transfer_ted_doc} do
      conn = put(conn, Routes.transfer_ted_doc_path(conn, :update, transfer_ted_doc), transfer_ted_doc: @update_attrs)
      assert redirected_to(conn) == Routes.transfer_ted_doc_path(conn, :show, transfer_ted_doc)

      conn = get(conn, Routes.transfer_ted_doc_path(conn, :show, transfer_ted_doc))
      assert html_response(conn, 200) =~ "some updated agencia"
    end

    test "renders errors when data is invalid", %{conn: conn, transfer_ted_doc: transfer_ted_doc} do
      conn = put(conn, Routes.transfer_ted_doc_path(conn, :update, transfer_ted_doc), transfer_ted_doc: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Transfer ted doc"
    end
  end

  describe "delete transfer_ted_doc" do
    setup [:create_transfer_ted_doc]

    test "deletes chosen transfer_ted_doc", %{conn: conn, transfer_ted_doc: transfer_ted_doc} do
      conn = delete(conn, Routes.transfer_ted_doc_path(conn, :delete, transfer_ted_doc))
      assert redirected_to(conn) == Routes.transfer_ted_doc_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.transfer_ted_doc_path(conn, :show, transfer_ted_doc))
      end
    end
  end

  defp create_transfer_ted_doc(_) do
    transfer_ted_doc = transfer_ted_doc_fixture()
    %{transfer_ted_doc: transfer_ted_doc}
  end
end
