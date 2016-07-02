defmodule AmericanPhoenix.PageController do
  use AmericanPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
