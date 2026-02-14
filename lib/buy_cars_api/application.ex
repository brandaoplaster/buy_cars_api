defmodule BuyCarsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BuyCarsApiWeb.Telemetry,
      BuyCarsApi.Repo,
      {DNSCluster, query: Application.get_env(:buy_cars_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BuyCarsApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BuyCarsApi.Finch},
      # Start a worker by calling: BuyCarsApi.Worker.start_link(arg)
      # {BuyCarsApi.Worker, arg},
      # Start to serve requests, typically the last entry
      BuyCarsApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BuyCarsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BuyCarsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
