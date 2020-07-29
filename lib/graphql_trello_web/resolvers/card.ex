defmodule GraphqlTrelloWeb.Resolvers.Card do
  alias GraphqlTrello.Modules.Card

  def list_cards(_parent, _args, _resolution) do
    {:ok, Card.list_cards()}
  end
end
