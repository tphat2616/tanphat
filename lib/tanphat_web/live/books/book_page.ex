defmodule TanphatWeb.Books.BookPage do
  use TanphatWeb, :live_component
  alias Tanphat.TopicService

  def handle_params(params, _uri, socket) do
    params = params |> Map.put("page_size", 8)
    {:noreply, socket |> assign(query: params) |> fetch_blog(params)}
  end

  defp fetch_blog(socket, params) do
    assign(socket, paginator: TopicService.list_blog(7, params))
  end
end
