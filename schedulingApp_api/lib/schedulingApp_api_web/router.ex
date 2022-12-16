defmodule SchedulingAppApiWeb.Router do
  use SchedulingAppApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SchedulingAppApiWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug(SchedulingAppApiWeb.Plug.Context)
  end

  scope "/", SchedulingAppApiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  pipeline :graphql do
    # Will be used later
  end

  scope "/api" do
    pipe_through :graphql

    forward "/", Absinthe.Plug, schema: SchedulingAppApiWeb.Schema
  end

  if Mix.env == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: SchedulingAppApiWeb.Schema
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SchedulingAppApiWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
