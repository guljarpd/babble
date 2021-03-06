# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :babble,
  ecto_repos: [Babble.Repo]

# Configures the endpoint
config :babble, Babble.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "86NaLSvBvWshiw10c3b+C5P0wg+WS67vx6Z3aMusBNMe7NoVhE9aINMOIRjE1Fwy",
  render_errors: [view: Babble.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Babble.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Babble",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "",
  serializer: Babble.GuardianSerializer

# Provide a list of the providers
# config :ueberauth, Ueberauth,
#   providers: [
#     facebook: { Ueberauth.Strategy.Facebook, [ opt1: "value", opts2: "value" ] },
#     github: { Ueberauth.Strategy.Github, [ opt1: "value", opts2: "value" ] }
#   ]
import_config "#{Mix.env}.exs"
