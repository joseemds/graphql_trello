defmodule GraphqlTrelloWeb.Resolvers.Task do
  alias GraphqlTrello.Modules.Task

  def list_tasks(_parent, _args, _resolution) do
    {:ok, Task.list_tasks()}
  end

  def create_tasks(_parent, args, _resolution) do
    Task.create_task(args)
  end
end
