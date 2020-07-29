defmodule GraphqlTrelloWeb.Schema do
  use Absinthe.Schema
  import_types(GraphqlTrelloWeb.Schema.ContentTypes)

  query do
    field :cards, list_of(:card) do
      resolve(&GraphqlTrelloWeb.Resolvers.Card.list_cards/3)
    end

    field :tasks, list_of(:task) do
      resolve(&GraphqlTrelloWeb.Resolvers.Task.list_tasks/3)
    end

    field :boards, list_of(:board) do
      resolve(&GraphqlTrelloWeb.Resolvers.Board.list_boards/3)
    end
  end

  mutation do
    field :create_task, type: :task do
      arg(:description, non_null(:string))
      arg(:done, non_null(:boolean))

      resolve(&GraphqlTrelloWeb.Resolvers.Task.create_tasks/3)
    end
  end
end
