defmodule TransferServiceWeb.TransferControllerTest do
  use TransferServiceWeb.ConnCase

  import TransferService.TranfersFixtures

  @create_attrs %{bancoDestino: "some bancoDestino", bancoOrigem: "some bancoOrigem", dataHora: ~N[2022-06-21 12:48:00], docClienteDestino: "some docClienteDestino", docClienteOrigem: "some docClienteOrigem", nomeClienteDestino: "some nomeClienteDestino", nomeClienteOrigem: "some nomeClienteOrigem", valorTransf: 120.5}
  @update_attrs %{bancoDestino: "some updated bancoDestino", bancoOrigem: "some updated bancoOrigem", dataHora: ~N[2022-06-22 12:48:00], docClienteDestino: "some updated docClienteDestino", docClienteOrigem: "some updated docClienteOrigem", nomeClienteDestino: "some updated nomeClienteDestino", nomeClienteOrigem: "some updated nomeClienteOrigem", valorTransf: 456.7}
  @invalid_attrs %{bancoDestino: nil, bancoOrigem: nil, dataHora: nil, docClienteDestino: nil, docClienteOrigem: nil, nomeClienteDestino: nil, nomeClienteOrigem: nil, valorTransf: nil}

  describe "index" do
    test "lists all transfers", %{conn: conn} do
      conn = get(conn, Routes.transfer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Transfers"
    end
  end

  describe "new transfer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.transfer_path(conn, :new))
      assert html_response(conn, 200) =~ "New Transfer"
    end
  end

  describe "create transfer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transfer_path(conn, :create), transfer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.transfer_path(conn, :show, id)

      conn = get(conn, Routes.transfer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Transfer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transfer_path(conn, :create), transfer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Transfer"
    end
  end

  describe "edit transfer" do
    setup [:create_transfer]

    test "renders form for editing chosen transfer", %{conn: conn, transfer: transfer} do
      conn = get(conn, Routes.transfer_path(conn, :edit, transfer))
      assert html_response(conn, 200) =~ "Edit Transfer"
    end
  end

  describe "update transfer" do
    setup [:create_transfer]

    test "redirects when data is valid", %{conn: conn, transfer: transfer} do
      conn = put(conn, Routes.transfer_path(conn, :update, transfer), transfer: @update_attrs)
      assert redirected_to(conn) == Routes.transfer_path(conn, :show, transfer)

      conn = get(conn, Routes.transfer_path(conn, :show, transfer))
      assert html_response(conn, 200) =~ "some updated bancoDestino"
    end

    test "renders errors when data is invalid", %{conn: conn, transfer: transfer} do
      conn = put(conn, Routes.transfer_path(conn, :update, transfer), transfer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Transfer"
    end
  end

  describe "delete transfer" do
    setup [:create_transfer]

    test "deletes chosen transfer", %{conn: conn, transfer: transfer} do
      conn = delete(conn, Routes.transfer_path(conn, :delete, transfer))
      assert redirected_to(conn) == Routes.transfer_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.transfer_path(conn, :show, transfer))
      end
    end
  end

  defp create_transfer(_) do
    transfer = transfer_fixture()
    %{transfer: transfer}
  end
end
