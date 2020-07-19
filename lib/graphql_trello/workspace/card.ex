defmodule GraphqlTrello.Workspace.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :title, :string
    has_many :tasks, GraphqlTrello.Workspace.Task

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
