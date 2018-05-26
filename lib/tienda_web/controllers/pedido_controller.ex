defmodule TiendaWeb.PedidoController do
  use TiendaWeb, :controller

  alias Tienda.Buscar.BuscarProducto

  alias Tienda.Tablas.Comercio

  def mostrar_producto(conn, comercio) do
    productos = BuscarProducto.buscar_producto(comercio["id"])
    render conn, "producto.html", productos: productos
  end
end
