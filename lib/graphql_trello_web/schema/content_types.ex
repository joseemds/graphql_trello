defmodule GraphqlTrelloWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :task do
    field :id, :id
    field :description, :string
    field :done, :boolean
  end

  object :card do
    field :id, :id
    field :title, :string
    field :tasks, list_of(:task)
  end

  object :board do
    field :id, :id
    field :title, :string
    field :cards, list_of(:card)
  end
end
