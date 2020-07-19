defmodule GraphqlTrelloWeb.Schema do
  use Absinthe.Schema
  import_types(GraphqlTrelloWeb.Schema.ContentTypes)

  query do
    field :cards, :string do
      resolve(&GraphqlTrelloWeb.Resolvers.Card.list_cards/3)
    end
  end
end
