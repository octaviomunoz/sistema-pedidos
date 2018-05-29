defmodule TiendaWeb.PedidoController do
  use TiendaWeb, :controller

  alias Tienda.Buscar.BuscarProducto

  alias Tienda.{
    Comercio,
    Detalle
  }

  def mostrar_producto(conn, comercio) do
    productos = BuscarProducto.buscar_producto(comercio["id"])
    render conn, "producto.html", productos: productos
  end

  def agregar_producto(conn, producto) do
    producto = BuscarProducto.get_producto(producto["id"])
    detalle = Detalle.detalle_change(%Detalle{})
    render conn, "seleccion.html", producto: producto, detalle: detalle
  end

  def agregar_carro(conn, detalle) do

  end
end
