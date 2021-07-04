defmodule TanphatWeb.LayoutView do
  use TanphatWeb, :view
  import Plug.Conn

  def metatags do
    Application.get_env(:tanphat, TanphatWeb.Endpoint)[:metatag]
  end

  defp default_tags do
    %{
      title: metatags()[:title],
      description: metatags()[:description],
      image: metatags()[:image],
      canonical: metatags()[:site]
    }
  end

  def get_metadata(conn) do
    metatags = Map.get(conn.private, :metatags, %{})

    Map.merge(default_tags(), metatags)
    # Put default image in case image is nil
    |> Map.put(:image, Map.get(metatags, :image) || default_tags()[:image])
    |> put_twitter_tags()
    |> put_og_tags()
  end

  defp put_twitter_tags(metatags) do
    metatags
    |> Map.merge(%{
      "twitter:title": metatags[:title],
      "twitter:description": metatags[:description],
      "twitter:image": metatags[:image],
      "twitter:site": metatags[:canonical],
      "twitter:card": "summary_large_image"
    })
  end

  defp put_og_tags(metatags) do
    metatags
    |> Map.merge(%{
      "og:title": metatags[:title],
      "og:description": metatags[:description],
      "og:image": metatags[:image],
      "og:url": metatags[:canonical],
      "og:type": "website"
    })
  end

  def put_metadata(conn, data \\ %{}) do
    put_private(conn, :metatags, data)
  end
end
