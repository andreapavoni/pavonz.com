defmodule Pavonz.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PavonzWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pavonz.PubSub},
      {ConCache, [name: :app_cache, ttl_check_interval: false]},
      # Start the Endpoint (http/https)
      PavonzWeb.Endpoint
      # Start a worker by calling: Pavonz.Worker.start_link(arg)
      # {Pavonz.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pavonz.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PavonzWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
