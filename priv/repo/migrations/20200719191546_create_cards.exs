defmodule GraphqlTrello.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :title, :string
      add :board_id, references(:boards)

      timestamps()
    end
  end
end
