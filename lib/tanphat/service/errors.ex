defmodule Tanphat.Errors do
  def get_error(:api, resp_code) when is_integer(resp_code) and resp_code == 1 do
    %{message: "Not get data from Yahoo Finance", resp_code: "01"}
  end
end
