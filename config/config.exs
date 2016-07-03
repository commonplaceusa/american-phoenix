# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :american_phoenix,
  ecto_repos: [AmericanPhoenix.Repo]

# Configures the endpoint
config :american_phoenix, AmericanPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "N+CKDLf5kPn24TmClHZskfNBADYQe93SSPXVRhD7jQDQd0B7EYoRmDilT7L6eItV",
  render_errors: [view: AmericanPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AmericanPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ex_admin,
  repo: AmericanPhoenix.Repo,
  module: AmericanPhoenix,
  theme_selector: [
    {"AdminLte",  ExAdmin.Theme.AdminLte2},
    {"ActiveAdmin", ExAdmin.Theme.ActiveAdmin}
  ],
  modules: [
    AmericanPhoenix.ExAdmin.Dashboard,
    AmericanPhoenix.ExAdmin.User
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}

