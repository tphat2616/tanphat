defmodule TanphatWeb.ProgramingLanguages.Show do
  use TanphatWeb, :live_component
  alias Tanphat.TopicService
  alias Tanphat.ApiService

  def handle_params(%{"id" => id}, _uri, socket) do
    {:noreply, fetch_blog(socket, id)}
  end

  defp fetch_blog(socket, id) do
    blog = TopicService.get_blog(String.to_integer(id))
    eth_burned = ApiService.eth_burned()
    total_burned = eth_burned["Total burned"]
    assign(socket, blog: blog, total_burned: total_burned)
  end
end
