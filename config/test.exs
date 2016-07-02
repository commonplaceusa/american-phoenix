use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :american_phoenix, AmericanPhoenix.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :american_phoenix, AmericanPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "american_phoenix_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Reduce the number of bcrypt passes in testing environments
config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
