defmodule TanphatWeb.Cryptocurrency.EthBurned do
  use TanphatWeb, :live_component
  alias Tanphat.ApiService

  def handle_params(_params, _uri, socket) do
    eth_burned = ApiService.eth_burned()
    total_burned = eth_burned["Total burned"]
    {:noreply, assign(socket, total_burned: total_burned)}
  end
end
