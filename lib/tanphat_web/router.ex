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
    live "/cryptocurrencies", PageLive, :cryptocurrency
    live "/stock-exchange", PageLive, :stock_exchange
    live "/api-collections", PageLive, :api
    live "/scientific-artical", PageLive, :artical
    live "/ultilities", PageLive, :ultility
    live "/books", PageLive, :book
    live "/about-me", PageLive, :my_site
    live("/cryptocurrencies/:id", PageLive, :cryto_blog_show)
    live("/stock-exchange/:id", PageLive, :stock_blog_show)
    live("/api-collections/:id", PageLive, :api_blog_show)
    live("/scientific-artical/:id", PageLive, :artical_blog_show)
    live("/ultilities/:id", PageLive, :ultility_blog_show)
    live("/programing-languages/:id", PageLive, :programing_language_blog_show)
    live("/eth/burn", PageLive, :eth_burned)
    live("/coin360", PageLive, :coin360)
    live("/distributed-system", PageLive, :distributed_system)
    live("/the-art-of-computer-programing/vol-1", PageLive, :art_of_cp)
    live("/bitcoin-whipaper/en", PageLive, :btc_whitepaper_en)
    live("/bitcoin-whipaper/vn", PageLive, :btc_whitepaper_vn)
    live("/map-reduce", PageLive, :map_reduce)
  end

  scope "/", TanphatWeb do
    pipe_through :browser

    get "/coming-soon", ErrorController, :coming_soon
    get "/market/crypto", ShareController, :cryto_market
    get "/chart", ShareController, :chart
    get "/market", ShareController, :market
    get "/forex/rate", ShareController, :forex_cross_rate
    get "/forex/heat", ShareController, :forex_heat
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
