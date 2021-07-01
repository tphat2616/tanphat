# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

config :tanphat, Tanphat.Repo,
  username: "postgres",
  password: "09098237720aA@",
  database: "tphat2616",
  hostname: "51.79.165.79",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :tanphat, TanphatWeb.Endpoint,
  server: true,
  # http: [port: 80],
  url: [host: "tanphat.dev", theme: "https"],
  https: [
    port: 443,
    cipher_suite: :strong,
    keyfile: "/etc/letsencrypt/live/tanphat.dev/privkey.pem",
    certfile: "/etc/letsencrypt/live/tanphat.dev/cert.pem",
    cacertfile: "/etc/letsencrypt/live/tanphat.dev/chain.pem"
  ],
  secret_key_base: "VdEaZh0DFVDEeLHSzlKrMx5k/EmXSZPL1SUnUVo54SjfvvVf87FOcMFBS0KELNEF",
  live_view: [signing_salt: "fOLDeUr4X"],
  code_reloader: false

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :tanphat, TanphatWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
