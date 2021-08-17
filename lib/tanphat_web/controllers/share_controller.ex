defmodule TanphatWeb.ShareController do
    use TanphatWeb, :controller
  
    def cryto_market(conn, _opts) do
      render(conn, "cryto_market.html")
    end

    def chart(conn, _opts) do
      render(conn, "trading_view.html")
    end

    def market(conn, _opts) do
      render(conn, "market_data.html")
    end

    def forex_cross_rate(conn, _opts) do
      render(conn, "forex_cross_rate.html")
    end

    def forex_heat(conn, _opts) do
      render(conn, "forex_heatmap.html")
    end
  end
  