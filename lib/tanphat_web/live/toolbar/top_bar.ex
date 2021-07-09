defmodule TanphatWeb.Toolbar.TopBar do
  use TanphatWeb, :live_component

  def handle_event("switch_language", %{"locale" => locale}, socket) do
    uri =
      socket.assigns.route[:uri]
      |> URI.parse()

    uri =
      uri
      |> Map.put(
        :query,
        (uri.query || "")
        |> URI.decode_query()
        |> Map.drop(["locale", :locale])
        |> Map.put(:locale, locale)
        |> URI.encode_query()
      )
      |> URI.to_string()

    {:noreply, redirect(socket, external: uri)}
  end
end
