defmodule TanphatWeb.PageRouter do

    def routes do
        [
          [
            component: TanphatWeb.HomeLive.HomeIndex,
            id: "home-page",
            title: "Phát - Web developer",
            live_action: :home_index
          ],
        ]
    end

    def find_route(live_action, default \\ home_route(), args \\ []) when is_atom(live_action) do
      stack = Keyword.get(args, :route_stack, routes())
      Enum.find(stack, default, fn route -> route[:live_action] === live_action end)
    end

    @spec find_parent(atom | keyword, any) :: any
    def find_parent(route, default \\ nil)
    def find_parent(route, default) when is_nil(route), do: default
  
    def find_parent(live_action, default) when is_atom(live_action) do
      find_parent(find_route(live_action), default)
    end
  
    def find_parent(route, default) do
      parent_action = Keyword.get(route, :parent)
  
      case parent_action do
        nil ->
          default
  
        _ ->
          find_route(parent_action)
      end
    end

    def find_root(route, default \\ home_route())
    def find_root(route, default) when is_nil(route), do: default
  
    def find_root(route, default) do
      cond do
        root_route?(route) ->
          route
  
        Keyword.get(route, :parent) === nil ->
          default
  
        true ->
          find_root(find_route(Keyword.get(route, :parent), default))
      end
    end

    def home_route(), do: List.first(routes())

    @type route :: Keyword
    def root_route?(route) do
      Keyword.get(route, :as, :page) === :page
    end
end