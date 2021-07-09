defmodule Tanphat.ApiService do
  def glo_and_com_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://tanphat.gigalixirapp.com/api/yahoo_finance/glo_and_com_index", [],
        timeout: 20_000,
        recv_timeout: 20_000
      )
  end
end
