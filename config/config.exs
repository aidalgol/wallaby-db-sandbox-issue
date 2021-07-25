# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello,
  ecto_repos: [Hello.Repo]

# Configures the endpoint
config :hello, HelloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eaXnJ0enjPrS8FAoHpK6Hcp2E68cJWYedYICcdloN4Hz7oItW7G+ojmCZrpW9vc8",
  render_errors: [view: HelloWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hello.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "pyOd/QpK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
