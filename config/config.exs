# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tanphat,
  ecto_repos: [Tanphat.Repo]

config :tanphat, Tanphat.Scheduler,
  # debug_logging: false,
  jobs: [
    # Every minute
    # {"* * * * *", {Tanphat.ApiService, :glo_and_com_index, []}}
    # {{:cron, "* * * * *"},     {Heartbeat, :send, []}},
  ]

# Configures the endpoint
config :tanphat, TanphatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2CwupNxoY3k5CwsWZPHD/sCm8s/IhhbtmaYIqXLqHVPeTJv1Yx6TkbM5nhy4JdaF",
  render_errors: [view: TanphatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tanphat.PubSub,
  live_view: [signing_salt: "z7fSqFqm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
