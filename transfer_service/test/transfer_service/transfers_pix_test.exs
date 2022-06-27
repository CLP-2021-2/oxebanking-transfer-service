defmodule TransferService.TransfersPixTest do
  use TransferService.DataCase

  alias TransferService.TransfersPix

  describe "transferspix" do
    alias TransferService.TransfersPix.TransferPix

    import TransferService.TransfersPixFixtures

    @invalid_attrs %{chave: nil, tipo: nil}

    test "list_transferspix/0 returns all transferspix" do
      transfer_pix = transfer_pix_fixture()
      assert TransfersPix.list_transferspix() == [transfer_pix]
    end

    test "get_transfer_pix!/1 returns the transfer_pix with given id" do
      transfer_pix = transfer_pix_fixture()
      assert TransfersPix.get_transfer_pix!(transfer_pix.id) == transfer_pix
    end

    test "create_transfer_pix/1 with valid data creates a transfer_pix" do
      valid_attrs = %{chave: "some chave", tipo: "some tipo"}

      assert {:ok, %TransferPix{} = transfer_pix} = TransfersPix.create_transfer_pix(valid_attrs)
      assert transfer_pix.chave == "some chave"
      assert transfer_pix.tipo == "some tipo"
    end

    test "create_transfer_pix/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TransfersPix.create_transfer_pix(@invalid_attrs)
    end

    test "update_transfer_pix/2 with valid data updates the transfer_pix" do
      transfer_pix = transfer_pix_fixture()
      update_attrs = %{chave: "some updated chave", tipo: "some updated tipo"}

      assert {:ok, %TransferPix{} = transfer_pix} = TransfersPix.update_transfer_pix(transfer_pix, update_attrs)
      assert transfer_pix.chave == "some updated chave"
      assert transfer_pix.tipo == "some updated tipo"
    end

    test "update_transfer_pix/2 with invalid data returns error changeset" do
      transfer_pix = transfer_pix_fixture()
      assert {:error, %Ecto.Changeset{}} = TransfersPix.update_transfer_pix(transfer_pix, @invalid_attrs)
      assert transfer_pix == TransfersPix.get_transfer_pix!(transfer_pix.id)
    end

    test "delete_transfer_pix/1 deletes the transfer_pix" do
      transfer_pix = transfer_pix_fixture()
      assert {:ok, %TransferPix{}} = TransfersPix.delete_transfer_pix(transfer_pix)
      assert_raise Ecto.NoResultsError, fn -> TransfersPix.get_transfer_pix!(transfer_pix.id) end
    end

    test "change_transfer_pix/1 returns a transfer_pix changeset" do
      transfer_pix = transfer_pix_fixture()
      assert %Ecto.Changeset{} = TransfersPix.change_transfer_pix(transfer_pix)
    end
  end
end
