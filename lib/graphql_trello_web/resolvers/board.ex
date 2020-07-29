defmodule GraphqlTrelloWeb.Resolvers.Board do
  alias GraphqlTrello.Modules.Board

  def list_boards(_parent, _args, _resolution) do
    {:ok, Board.list_boards()}
  end
end
