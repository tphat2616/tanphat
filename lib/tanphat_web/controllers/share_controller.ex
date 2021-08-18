defmodule TanphatWeb.ShareController do
    use TanphatWeb, :controller
  
    def cryto_market(conn, _opts) do
      render(conn, "cryto_market.html", page_title: "Crypto Market")
    end

    def chart(conn, _opts) do
      render(conn, "trading_view.html", page_title: "Trading View Chart")
    end

    def market(conn, _opts) do
      render(conn, "market_data.html", page_title: "Market Data")
    end

    def forex_cross_rate(conn, _opts) do
      render(conn, "forex_cross_rate.html", page_title: "Forex Cross Rates")
    end

    def forex_heat(conn, _opts) do
      render(conn, "forex_heatmap.html", page_title: "Forex Heatmap")
    end
  end
  