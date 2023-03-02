defmodule StaticToDynamic.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StaticToDynamicWeb.Telemetry,
      # Start the Ecto repository
      StaticToDynamic.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StaticToDynamic.PubSub},
      # Start Finch
      {Finch, name: StaticToDynamic.Finch},
      # Start the Endpoint (http/https)
      StaticToDynamicWeb.Endpoint
      # Start a worker by calling: StaticToDynamic.Worker.start_link(arg)
      # {StaticToDynamic.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StaticToDynamic.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StaticToDynamicWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
