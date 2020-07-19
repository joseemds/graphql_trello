defmodule GraphqlTrello.WorkspaceTest do
  use GraphqlTrello.DataCase

  alias GraphqlTrello.Workspace

  describe "boards" do
    alias GraphqlTrello.Workspace.Board

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Workspace.create_board()

      board
    end

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Workspace.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Workspace.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      assert {:ok, %Board{} = board} = Workspace.create_board(@valid_attrs)
      assert board.title == "some title"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspace.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      assert {:ok, %Board{} = board} = Workspace.update_board(board, @update_attrs)
      assert board.title == "some updated title"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspace.update_board(board, @invalid_attrs)
      assert board == Workspace.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Workspace.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Workspace.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Workspace.change_board(board)
    end
  end

  describe "cards" do
    alias GraphqlTrello.Workspace.Card

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Workspace.create_card()

      card
    end

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Workspace.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Workspace.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Workspace.create_card(@valid_attrs)
      assert card.title == "some title"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspace.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, %Card{} = card} = Workspace.update_card(card, @update_attrs)
      assert card.title == "some updated title"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspace.update_card(card, @invalid_attrs)
      assert card == Workspace.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Workspace.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Workspace.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Workspace.change_card(card)
    end
  end

  describe "tasks" do
    alias GraphqlTrello.Workspace.Task

    @valid_attrs %{description: "some description", done: true}
    @update_attrs %{description: "some updated description", done: false}
    @invalid_attrs %{description: nil, done: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Workspace.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Workspace.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Workspace.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Workspace.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.done == true
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspace.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Workspace.update_task(task, @update_attrs)
      assert task.description == "some updated description"
      assert task.done == false
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspace.update_task(task, @invalid_attrs)
      assert task == Workspace.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Workspace.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Workspace.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Workspace.change_task(task)
    end
  end
end
