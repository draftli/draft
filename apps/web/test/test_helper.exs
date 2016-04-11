ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Draft.Web.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Draft.Web.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Draft.Web.Repo)

