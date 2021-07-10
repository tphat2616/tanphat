defmodule Tanphat.ApiService do
  alias Tanphat.Errors

  def glo_and_com_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("https://tanphat.dev:8080/api/yahoo_finance/index")

    try do
      Poison.decode!(body)
    rescue
      _ ->
        Errors.get_error(:api, 1)
    end
  end
end
