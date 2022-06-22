defmodule TransferService.TranfersTest do
  use TransferService.DataCase

  alias TransferService.Tranfers

  describe "transfers" do
    alias TransferService.Tranfers.Transfer

    import TransferService.TranfersFixtures

    @invalid_attrs %{bancoDestino: nil, bancoOrigem: nil, dataHora: nil, docClienteDestino: nil, docClienteOrigem: nil, nomeClienteDestino: nil, nomeClienteOrigem: nil, valorTransf: nil}

    test "list_transfers/0 returns all transfers" do
      transfer = transfer_fixture()
      assert Tranfers.list_transfers() == [transfer]
    end

    test "get_transfer!/1 returns the transfer with given id" do
      transfer = transfer_fixture()
      assert Tranfers.get_transfer!(transfer.id) == transfer
    end

    test "create_transfer/1 with valid data creates a transfer" do
      valid_attrs = %{bancoDestino: "some bancoDestino", bancoOrigem: "some bancoOrigem", dataHora: ~N[2022-06-21 12:48:00], docClienteDestino: "some docClienteDestino", docClienteOrigem: "some docClienteOrigem", nomeClienteDestino: "some nomeClienteDestino", nomeClienteOrigem: "some nomeClienteOrigem", valorTransf: 120.5}

      assert {:ok, %Transfer{} = transfer} = Tranfers.create_transfer(valid_attrs)
      assert transfer.bancoDestino == "some bancoDestino"
      assert transfer.bancoOrigem == "some bancoOrigem"
      assert transfer.dataHora == ~N[2022-06-21 12:48:00]
      assert transfer.docClienteDestino == "some docClienteDestino"
      assert transfer.docClienteOrigem == "some docClienteOrigem"
      assert transfer.nomeClienteDestino == "some nomeClienteDestino"
      assert transfer.nomeClienteOrigem == "some nomeClienteOrigem"
      assert transfer.valorTransf == 120.5
    end

    test "create_transfer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tranfers.create_transfer(@invalid_attrs)
    end

    test "update_transfer/2 with valid data updates the transfer" do
      transfer = transfer_fixture()
      update_attrs = %{bancoDestino: "some updated bancoDestino", bancoOrigem: "some updated bancoOrigem", dataHora: ~N[2022-06-22 12:48:00], docClienteDestino: "some updated docClienteDestino", docClienteOrigem: "some updated docClienteOrigem", nomeClienteDestino: "some updated nomeClienteDestino", nomeClienteOrigem: "some updated nomeClienteOrigem", valorTransf: 456.7}

      assert {:ok, %Transfer{} = transfer} = Tranfers.update_transfer(transfer, update_attrs)
      assert transfer.bancoDestino == "some updated bancoDestino"
      assert transfer.bancoOrigem == "some updated bancoOrigem"
      assert transfer.dataHora == ~N[2022-06-22 12:48:00]
      assert transfer.docClienteDestino == "some updated docClienteDestino"
      assert transfer.docClienteOrigem == "some updated docClienteOrigem"
      assert transfer.nomeClienteDestino == "some updated nomeClienteDestino"
      assert transfer.nomeClienteOrigem == "some updated nomeClienteOrigem"
      assert transfer.valorTransf == 456.7
    end

    test "update_transfer/2 with invalid data returns error changeset" do
      transfer = transfer_fixture()
      assert {:error, %Ecto.Changeset{}} = Tranfers.update_transfer(transfer, @invalid_attrs)
      assert transfer == Tranfers.get_transfer!(transfer.id)
    end

    test "delete_transfer/1 deletes the transfer" do
      transfer = transfer_fixture()
      assert {:ok, %Transfer{}} = Tranfers.delete_transfer(transfer)
      assert_raise Ecto.NoResultsError, fn -> Tranfers.get_transfer!(transfer.id) end
    end

    test "change_transfer/1 returns a transfer changeset" do
      transfer = transfer_fixture()
      assert %Ecto.Changeset{} = Tranfers.change_transfer(transfer)
    end
  end
end
