defmodule Tanphat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Tanphat.Repo,
      # Start the Telemetry supervisor
      TanphatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tanphat.PubSub},
      # Start the Endpoint (http/https)
      TanphatWeb.Endpoint,
      # cron jobs
      Tanphat.Scheduler
      # Start a worker by calling: Tanphat.Worker.start_link(arg)
      # {Tanphat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tanphat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TanphatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
