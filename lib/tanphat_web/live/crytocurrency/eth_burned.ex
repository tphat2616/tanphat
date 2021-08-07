defmodule TanphatWeb.Cryptocurrency.EthBurned do
  use TanphatWeb, :live_component
  alias Tanphat.ApiService

  def handle_params(_params, _uri, socket) do
    eth_burned = ApiService.eth_burned()
    total_burned = eth_burned["Total burned"]
    eth_price = ApiService.eth_price()
    price = eth_price["price"]
    total = String.to_float(total_burned) * price
    money = total |> trunc()
    total_money = Number.Currency.number_to_currency(money)
    {:noreply, assign(socket, total_burned: total_burned, total_money: total_money)}
  end
end
