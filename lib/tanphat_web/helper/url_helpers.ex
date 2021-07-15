defmodule TanphatWeb.UrlHelpers do
  alias TanphatWeb.Router.Helpers, as: Routes

  def to(socket, %Topic{} = topic) do
    Routes.page_path(socket, :cryto_blog_show, topic.id)
  end
end
