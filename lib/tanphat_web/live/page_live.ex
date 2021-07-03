defmodule TanphatWeb.PageLive do
  alias TanphatWeb.Navigator
  use TanphatWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    socket = socket |> fetch_locale(session)
    {:ok, socket}
  end

  @impl true
  def handle_params(params, uri, socket) do
    {:noreply, Navigator.handle_navigation(params, uri, fetch_locale(socket, params))}
  end

  @impl true
  def handle_info({:update_assigns, payload}, socket) do
    {:noreply, assign(socket, payload)}
  end

  def get_assigns_for_mainpage(assigns) do
    assigns
    |> Map.put(:id, assigns[:root_route][:id])
    |> trim_assigns()
  end

  defp trim_assigns(assigns) do
    Map.drop(assigns, [
      :socket,
      :route_stack,
      :root_route
    ])
  end

  defp fetch_locale(socket, session) do
    locale = Map.get(session, "locale", Gettext.get_locale())
    Gettext.put_locale(locale)

    assign(socket, :locale, locale)
  end

end
