defmodule TransferServiceWeb.TransferPixControllerTest do
  use TransferServiceWeb.ConnCase

  import TransferService.TransfersPixFixtures

  @create_attrs %{chave: "some chave", tipo: "some tipo"}
  @update_attrs %{chave: "some updated chave", tipo: "some updated tipo"}
  @invalid_attrs %{chave: nil, tipo: nil}

  describe "index" do
    test "lists all transferspix", %{conn: conn} do
      conn = get(conn, Routes.transfer_pix_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Transferspix"
    end
  end

  describe "new transfer_pix" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.transfer_pix_path(conn, :new))
      assert html_response(conn, 200) =~ "New Transfer pix"
    end
  end

  describe "create transfer_pix" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.transfer_pix_path(conn, :create), transfer_pix: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.transfer_pix_path(conn, :show, id)

      conn = get(conn, Routes.transfer_pix_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Transfer pix"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.transfer_pix_path(conn, :create), transfer_pix: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Transfer pix"
    end
  end

  describe "edit transfer_pix" do
    setup [:create_transfer_pix]

    test "renders form for editing chosen transfer_pix", %{conn: conn, transfer_pix: transfer_pix} do
      conn = get(conn, Routes.transfer_pix_path(conn, :edit, transfer_pix))
      assert html_response(conn, 200) =~ "Edit Transfer pix"
    end
  end

  describe "update transfer_pix" do
    setup [:create_transfer_pix]

    test "redirects when data is valid", %{conn: conn, transfer_pix: transfer_pix} do
      conn = put(conn, Routes.transfer_pix_path(conn, :update, transfer_pix), transfer_pix: @update_attrs)
      assert redirected_to(conn) == Routes.transfer_pix_path(conn, :show, transfer_pix)

      conn = get(conn, Routes.transfer_pix_path(conn, :show, transfer_pix))
      assert html_response(conn, 200) =~ "some updated chave"
    end

    test "renders errors when data is invalid", %{conn: conn, transfer_pix: transfer_pix} do
      conn = put(conn, Routes.transfer_pix_path(conn, :update, transfer_pix), transfer_pix: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Transfer pix"
    end
  end

  describe "delete transfer_pix" do
    setup [:create_transfer_pix]

    test "deletes chosen transfer_pix", %{conn: conn, transfer_pix: transfer_pix} do
      conn = delete(conn, Routes.transfer_pix_path(conn, :delete, transfer_pix))
      assert redirected_to(conn) == Routes.transfer_pix_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.transfer_pix_path(conn, :show, transfer_pix))
      end
    end
  end

  defp create_transfer_pix(_) do
    transfer_pix = transfer_pix_fixture()
    %{transfer_pix: transfer_pix}
  end
end
