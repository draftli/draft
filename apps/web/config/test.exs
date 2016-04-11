use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :web, Draft.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :web, Draft.Web.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "draft",
  password: "draft",
  database: "draft_web_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
