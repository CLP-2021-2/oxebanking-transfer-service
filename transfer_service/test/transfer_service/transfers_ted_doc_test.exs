defmodule TransferService.Transfers_ted_docTest do
  use TransferService.DataCase

  alias TransferService.Transfers_ted_doc

  describe "transfers_ted_doc" do
    alias TransferService.Transfers_ted_doc.Transfer_ted_doc

    import TransferService.Transfers_ted_docFixtures

    @invalid_attrs %{agencia: nil, conta: nil}

    test "list_transfers_ted_doc/0 returns all transfers_ted_doc" do
      transfer_ted_doc = transfer_ted_doc_fixture()
      assert Transfers_ted_doc.list_transfers_ted_doc() == [transfer_ted_doc]
    end

    test "get_transfer_ted_doc!/1 returns the transfer_ted_doc with given id" do
      transfer_ted_doc = transfer_ted_doc_fixture()
      assert Transfers_ted_doc.get_transfer_ted_doc!(transfer_ted_doc.id) == transfer_ted_doc
    end

    test "create_transfer_ted_doc/1 with valid data creates a transfer_ted_doc" do
      valid_attrs = %{agencia: "some agencia", conta: "some conta"}

      assert {:ok, %Transfer_ted_doc{} = transfer_ted_doc} = Transfers_ted_doc.create_transfer_ted_doc(valid_attrs)
      assert transfer_ted_doc.agencia == "some agencia"
      assert transfer_ted_doc.conta == "some conta"
    end

    test "create_transfer_ted_doc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transfers_ted_doc.create_transfer_ted_doc(@invalid_attrs)
    end

    test "update_transfer_ted_doc/2 with valid data updates the transfer_ted_doc" do
      transfer_ted_doc = transfer_ted_doc_fixture()
      update_attrs = %{agencia: "some updated agencia", conta: "some updated conta"}

      assert {:ok, %Transfer_ted_doc{} = transfer_ted_doc} = Transfers_ted_doc.update_transfer_ted_doc(transfer_ted_doc, update_attrs)
      assert transfer_ted_doc.agencia == "some updated agencia"
      assert transfer_ted_doc.conta == "some updated conta"
    end

    test "update_transfer_ted_doc/2 with invalid data returns error changeset" do
      transfer_ted_doc = transfer_ted_doc_fixture()
      assert {:error, %Ecto.Changeset{}} = Transfers_ted_doc.update_transfer_ted_doc(transfer_ted_doc, @invalid_attrs)
      assert transfer_ted_doc == Transfers_ted_doc.get_transfer_ted_doc!(transfer_ted_doc.id)
    end

    test "delete_transfer_ted_doc/1 deletes the transfer_ted_doc" do
      transfer_ted_doc = transfer_ted_doc_fixture()
      assert {:ok, %Transfer_ted_doc{}} = Transfers_ted_doc.delete_transfer_ted_doc(transfer_ted_doc)
      assert_raise Ecto.NoResultsError, fn -> Transfers_ted_doc.get_transfer_ted_doc!(transfer_ted_doc.id) end
    end

    test "change_transfer_ted_doc/1 returns a transfer_ted_doc changeset" do
      transfer_ted_doc = transfer_ted_doc_fixture()
      assert %Ecto.Changeset{} = Transfers_ted_doc.change_transfer_ted_doc(transfer_ted_doc)
    end
  end
end
