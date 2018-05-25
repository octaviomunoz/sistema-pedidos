defmodule TiendaWeb.PageController do
  use TiendaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
