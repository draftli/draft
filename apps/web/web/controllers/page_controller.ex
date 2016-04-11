defmodule Draft.Web.PageController do
  use Draft.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
