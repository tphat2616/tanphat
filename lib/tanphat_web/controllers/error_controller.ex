defmodule TanphatWeb.ErrorController do
    use TanphatWeb, :controller
  
    def coming_soon(conn, _opts) do
      render(conn, "coming_soon.html")
    end
  end