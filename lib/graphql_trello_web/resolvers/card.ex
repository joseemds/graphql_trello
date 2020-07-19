defmodule GraphqlTrelloWeb.Resolvers.Card do
  def list_cards(_parent, _args, _resolution) do
    {:ok, "Hello World"}
  end
end
