defmodule TanphatWeb.UrlHelpers do
  alias TanphatWeb.Router.Helpers, as: Routes

  def to(socket, %Topic{} = topic) do
    Routes.page_path(socket, :blog_show, topic.id)
  end
end
