defmodule Tanphat.Repo do
  use Ecto.Repo,
    otp_app: :tanphat,
    adapter: Ecto.Adapters.Postgres
end
