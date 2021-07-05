defmodule TanphatWeb.Router do
  use TanphatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TanphatWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TanphatWeb do
    pipe_through :browser

    live "/", PageLive, :home_index
    live "/programing-languages", PageLive, :programing_language
    live "/crytocurrencies", PageLive, :crytocurrency
    live "/stock-exchange", PageLive, :stock_exchange
    live "/api-collections", PageLive, :api
    live "/tutorials", PageLive, :tutorial
    live "/ultilities", PageLive, :ultility
    live "/books", PageLive, :book
    live "/about-me", PageLive, :my_site
  end

  scope "/", TanphatWeb do
    pipe_through :browser

    get "/coming-soon", PageLive, :coming_soon
  end

  # Other scopes may use custom stacks.
  # scope "/api", TanphatWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: TanphatWeb.Telemetry
    end
  end
end
