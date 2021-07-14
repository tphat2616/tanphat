defmodule TanphatWeb.SharedLive.Paginator do
  use TanphatWeb, :live_component

  @displayed_page_num 5
  @page_offset floor(@displayed_page_num / 2)

  def render(assigns) do
    if assigns.paginator.total_pages > 1 do
      ~L"""
      <div class="paginator navbar-static">
        <%= live_patch "<<", 
          id: "page-first",
          to: compute_url(@socket, assigns, 1),
          class: "btn-icon" %>

        <%= cond do %>
          <% @category == 1 -> %>
            <%= for page <- page_list(@paginator) do %>
              <%= live_patch page, 
                id: "page-##{page}",
                to: compute_url(@socket, assigns, page),
                class: "btn-icon #{if page === @paginator.page_number, do: "btn-primary-1 disabled", else: "btn-text-primary"}" %>
                <% end %>
          <% @category == 2 -> %>
            <%= for page <- page_list(@paginator) do %>
              <%= live_patch page, 
                id: "page-##{page}",
                to: compute_url(@socket, assigns, page),
                class: "btn-icon #{if page === @paginator.page_number, do: "btn-primary-2 disabled", else: "btn-text-primary"}" %>
                <% end %>
          <% @category == 3 -> %>
            <%= for page <- page_list(@paginator) do %>
              <%= live_patch page, 
                id: "page-##{page}",
                to: compute_url(@socket, assigns, page),
                class: "btn-icon #{if page === @paginator.page_number, do: "btn-primary-3 disabled", else: "btn-text-primary"}" %>
                <% end %>
          <% @category == 4 -> %>
            <%= for page <- page_list(@paginator) do %>
              <%= live_patch page, 
                id: "page-##{page}",
                to: compute_url(@socket, assigns, page),
                class: "btn-icon #{if page === @paginator.page_number, do: "btn-primary-4 disabled", else: "btn-text-primary"}" %>
                <% end %>
          <% @category == 7 -> %>
            <%= for page <- page_list(@paginator) do %>
              <%= live_patch page, 
                id: "page-##{page}",
                to: compute_url(@socket, assigns, page),
                class: "btn-icon #{if page === @paginator.page_number, do: "btn-primary-7 disabled", else: "btn-text-primary"}" %>
                <% end %>
          <% true -> %>
              <%= for page <- page_list(@paginator) do %>
                <%= live_patch page, 
                  id: "page-##{page}",
                  to: compute_url(@socket, assigns, page),
                  class: "btn-icon #{if page === @paginator.page_number, do: "btn-primary disabled", else: "btn-text-primary"}" %>
                  <% end %>
        <% end %>
            
        <%= live_patch ">>", 
          id: "page-last",
          to: compute_url(@socket, assigns, @paginator.total_pages),
          class: "btn-icon" %>
      </div>
      """
    else
      ~L(<span></span>)
    end
  end

  defp page_list(paginator) do
    cond do
      paginator.page_number <= @page_offset ->
        0..@displayed_page_num

      paginator.page_number > paginator.total_pages - @page_offset ->
        (paginator.total_pages - @displayed_page_num + 1)..paginator.total_pages

      paginator.total_pages > @displayed_page_num ->
        (paginator.page_number - @page_offset)..(paginator.page_number + @page_offset)

      true ->
        0..paginator.total_pages
    end
    |> Enum.filter(&(&1 > 0 && &1 <= paginator.total_pages))
  end

  defp compute_url(socket, assigns, page) do
    compute_url(
      socket,
      assigns[:route_action],
      assigns[:route_params],
      page,
      Map.get(assigns, :query, %{})
    )
  end

  defp compute_url(socket, route_action, route_params, page, query) when is_nil(route_params) do
    apply(
      Routes,
      :page_path,
      [socket, route_action, Map.put(query, "page", page)]
    )
  end

  defp compute_url(socket, route_action, route_params, page, query) do
    apply(
      Routes,
      :page_path,
      [socket, route_action] ++ List.wrap(route_params) ++ [Map.put(query, "page", page)]
    )
  end
end
