defmodule TanphatWeb.PageRouter do
  def routes do
    [
      [
        component: TanphatWeb.HomeLive.HomeIndex,
        id: "home-page",
        title: "Phát - Web developer",
        live_action: :home_index
      ],
      [
        component: TanphatWeb.ProgramingLanguages.ProgramingLanguage,
        id: "code-page",
        title: "Programing Languages",
        live_action: :programing_language
      ],
      [
        component: TanphatWeb.ProgramingLanguages.Show,
        id: "blog-code-page",
        title: "Programing Languages Blogs",
        live_action: :programing_language_blog_show
      ],
      [
        component: TanphatWeb.Cryptocurrency.CryptoIndex,
        id: "crypto-page",
        title: "Cryptocurrencies",
        live_action: :cryptocurrency
      ],
      [
        component: TanphatWeb.Cryptocurrency.Show,
        id: "blog-crypto-page",
        title: "Crypto Blogs",
        live_action: :cryto_blog_show
      ],
      [
        component: TanphatWeb.Cryptocurrency.EthBurned,
        id: "eth-burned",
        title: "ETH Burned",
        live_action: :eth_burned
      ],
      [
        component: TanphatWeb.Cryptocurrency.Coin360,
        id: "coin360",
        title: "Coin360 View",
        live_action: :coin360
      ],
      [
        component: TanphatWeb.StockExchange.StockExchangeIndex,
        id: "stock-exchange",
        title: "Stock Exchange",
        live_action: :stock_exchange
      ],
      [
        component: TanphatWeb.StockExchange.Show,
        id: "blog-stock-page",
        title: "Stock Blogs",
        live_action: :stock_blog_show
      ],
      [
        component: TanphatWeb.APICollection.APIPage,
        id: "api-collection",
        title: "API Collections",
        live_action: :api
      ],
      [
        component: TanphatWeb.APICollection.Show,
        id: "blog-api-page",
        title: "API Blogs",
        live_action: :api_blog_show
      ],
      [
        component: TanphatWeb.Artical.ArticalPage,
        id: "artical",
        title: "Scientific Artical",
        live_action: :artical
      ],
      [
        component: TanphatWeb.Artical.DistributedSystem,
        id: "distributed-system",
        title: "Distributed System",
        live_action: :distributed_system
      ],
      [
        component: TanphatWeb.Artical.ArtOfCp,
        id: "the-art-of-cp",
        title: "The Art Of ComputerPrograming",
        live_action: :art_of_cp
      ],
      [
        component: TanphatWeb.Artical.BtcWhitepaperEn,
        id: "btc-whipaper-en",
        title: "Bitcoin Whitepaper",
        live_action: :btc_whitepaper_en
      ],
      [
        component: TanphatWeb.Artical.BtcWhitepaperVn,
        id: "btc-whipaper-vn",
        title: "Bitcoin Whitepaper",
        live_action: :btc_whitepaper_vn
      ],
      [
        component: TanphatWeb.Artical.MapReduce,
        id: "map-reduce",
        title: "MapReduce by Google",
        live_action: :map_reduce
      ],
      [
        component: TanphatWeb.Artical.Show,
        id: "blog-artical-page",
        title: "Scientific Artical Blogs",
        live_action: :artical_blog_show
      ],
      [
        component: TanphatWeb.Ultilities.UltilityPage,
        id: "ultility",
        title: "Ultilities",
        live_action: :ultility
      ],
      [
        component: TanphatWeb.Ultilities.Show,
        id: "blog-ultility-page",
        title: "Ultility",
        live_action: :ultility_blog_show
      ],
      [
        component: TanphatWeb.Books.BookPage,
        id: "books",
        title: "Books",
        live_action: :book
      ],
      [
        component: TanphatWeb.AboutMe.MySite,
        id: "my-site",
        title: "About Me",
        live_action: :my_site
      ]
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
