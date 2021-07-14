defmodule TanphatWeb.StockExchange.StockExchangeIndex do
  use TanphatWeb, :live_component
  alias Tanphat.TopicService
  alias Tanphat.ApiService

  def handle_params(params, _uri, socket) do
    params = params |> Map.put("page_size", 3)

    {:noreply,
     socket |> assign(query: params) |> fetch_blog(params) |> assign_glo_and_com_index()}
  end

  defp fetch_blog(socket, params) do
    assign(socket, paginator: TopicService.list_blog(3, params), category: 3)
  end

  def assign_glo_and_com_index(socket) do
    glo_and_com_index = ApiService.glo_and_com_index()
    dji_index_price = glo_and_com_index["dji_index_price"]
    dji_index_price_24h_change = glo_and_com_index["dji_index_price_24h_change"]
    dji_index_rate_24h_change = glo_and_com_index["dji_index_rate_24h_change"]
    snp500_index_price = glo_and_com_index["snp500_index_price"]
    snp500_index_price_24h_change = glo_and_com_index["snp500_index_price_24h_change"]
    snp500_index_rate_24h_change = glo_and_com_index["snp500_index_rate_24h_change"]
    nasdaq100_index_price = glo_and_com_index["nasdaq100_index_price"]
    nasdaq100_index_price_24h_change = glo_and_com_index["nasdaq100_index_price_24h_change"]
    nasdaq100_index_rate_24h_change = glo_and_com_index["nasdaq100_index_rate_24h_change"]
    ftse100_index_price = glo_and_com_index["ftse100_index_price"]
    ftse100_index_price_24h_change = glo_and_com_index["ftse100_index_price_24h_change"]
    ftse100_index_rate_24h_change = glo_and_com_index["ftse100_index_rate_24h_change"]
    euro50_index_price = glo_and_com_index["euro50_index_price"]
    euro50_index_price_24h_change = glo_and_com_index["euro50_index_price_24h_change"]
    euro50_index_rate_24h_change = glo_and_com_index["euro50_index_rate_24h_change"]
    nikkei255_index_price = glo_and_com_index["nikkei255_index_price"]
    nikkei255_index_price_24h_change = glo_and_com_index["nikkei255_index_price_24h_change"]
    nikkei255_index_rate_24h_change = glo_and_com_index["nikkei255_index_rate_24h_change"]
    snp_gsci_gold_price = glo_and_com_index["snp_gsci_gold_price"]
    snp_gsci_gold_price_24h_change = glo_and_com_index["snp_gsci_gold_price_24h_change"]
    snp_gsci_gold_rate_24h_change = glo_and_com_index["snp_gsci_gold_rate_24h_change"]
    snp_gsci_crude_oil_price = glo_and_com_index["snp_gsci_crude_oil_price"]
    snp_gsci_crude_oil_price_24h_change = glo_and_com_index["snp_gsci_crude_oil_price_24h_change"]
    snp_gsci_crude_oil_rate_24h_change = glo_and_com_index["snp_gsci_crude_oil_rate_24h_change"]

    assign(socket,
      dji_index_price: dji_index_price,
      dji_index_price_24h_change: dji_index_price_24h_change,
      dji_index_rate_24h_change: dji_index_rate_24h_change,
      snp500_index_price: snp500_index_price,
      snp500_index_price_24h_change: snp500_index_price_24h_change,
      snp500_index_rate_24h_change: snp500_index_rate_24h_change,
      nasdaq100_index_price: nasdaq100_index_price,
      nasdaq100_index_price_24h_change: nasdaq100_index_price_24h_change,
      nasdaq100_index_rate_24h_change: nasdaq100_index_rate_24h_change,
      ftse100_index_price: ftse100_index_price,
      ftse100_index_price_24h_change: ftse100_index_price_24h_change,
      ftse100_index_rate_24h_change: ftse100_index_rate_24h_change,
      euro50_index_price: euro50_index_price,
      euro50_index_price_24h_change: euro50_index_price_24h_change,
      euro50_index_rate_24h_change: euro50_index_rate_24h_change,
      nikkei255_index_price: nikkei255_index_price,
      nikkei255_index_price_24h_change: nikkei255_index_price_24h_change,
      nikkei255_index_rate_24h_change: nikkei255_index_rate_24h_change,
      snp_gsci_gold_price: snp_gsci_gold_price,
      snp_gsci_gold_price_24h_change: snp_gsci_gold_price_24h_change,
      snp_gsci_gold_rate_24h_change: snp_gsci_gold_rate_24h_change,
      snp_gsci_crude_oil_price: snp_gsci_crude_oil_price,
      snp_gsci_crude_oil_price_24h_change: snp_gsci_crude_oil_price_24h_change,
      snp_gsci_crude_oil_rate_24h_change: snp_gsci_crude_oil_rate_24h_change
    )
  end
end
