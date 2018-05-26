defmodule TiendaWeb.PedidoController do
  use TiendaWeb, :controller

  alias Tienda.Tablas.Comercio

  def mostrar_producto(conn, comercio) do
    render conn, "producto.html"
  end
end
