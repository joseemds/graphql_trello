defmodule GraphqlTrello.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :description, :string
      add :done, :boolean, default: false, null: false
      add :card_id, references(:cards)

      timestamps()
    end
  end
end
