defmodule TiendaWeb.ComercioController do
  use TiendaWeb, :controller

  alias Tienda.Sistema.Busqueda

  alias Tienda.Producto

  def busqueda_producto(conn, _params) do
    producto = Producto.producto_change(%Producto{})
    render conn, "busproducto.html", producto: producto
  end


  def obteniendo_producto(conn, %{"producto" => %{"nombre" => producto}}) do
    IO.inspect(label: producto)
    comercios = Busqueda.buscar_producto_nombre(producto)
    render conn, "vista_comercios.html", producto: producto, comercios: comercios
  end
end
