defmodule Tanphat.ApiService do
  alias Tanphat.Errors
  require Logger

  def glo_and_com_index do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("localhost:8081/api/yahoo_finance/index")

    try do
      Logger.debug("Data from Yahoo Finance: #{body}")
      Poison.decode!(body)
    rescue
      _ ->
        Errors.get_error(:api, 1)
    end
  end

  def eth_burned do
    {:ok, %HTTPoison.Response{body: body}} =
      HTTPoison.get("localhost:8081/api/eth/burn")

    try do
      Poison.decode!(body)
    rescue
      _ ->
        Errors.get_error(:api, 2)
    end
  end
end
