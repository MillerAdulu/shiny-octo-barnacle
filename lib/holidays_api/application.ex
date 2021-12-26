defmodule HolidaysApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HolidaysApi.Repo,
      # Start the Telemetry supervisor
      HolidaysApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HolidaysApi.PubSub},
      # Start the Endpoint (http/https)
      HolidaysApiWeb.Endpoint
      # Start a worker by calling: HolidaysApi.Worker.start_link(arg)
      # {HolidaysApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HolidaysApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HolidaysApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
