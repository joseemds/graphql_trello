defmodule GraphqlTrello.Repo do
  use Ecto.Repo,
    otp_app: :graphql_trello,
    adapter: Ecto.Adapters.Postgres
end
