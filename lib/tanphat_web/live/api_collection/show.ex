defmodule TanphatWeb.APICollection.Show do
  use TanphatWeb, :live_component
  alias Tanphat.TopicService

  def handle_params(%{"id" => id}, _uri, socket) do
    {:noreply, fetch_blog(socket, id)}
  end

  defp fetch_blog(socket, id) do
    blog = TopicService.get_blog(String.to_integer(id))
    assign(socket, blog: blog)
  end
end
