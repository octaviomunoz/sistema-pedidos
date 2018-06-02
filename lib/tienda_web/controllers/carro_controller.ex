defmodule TiendaWeb.CarroController do
  use TiendaWeb, :controller

  alias Tienda.Pedidos.Pedidos
  alias Tienda.Buscar.BuscarProducto
  alias Tienda.{
    Comercio,
    Solicitud,
    Detalle
  }

  def carro_compra(conn, _params) do
    solicitud = get_session(conn, :solicitud_id)
    existe_solicitud(conn, solicitud)

    render conn, "carro.html"
  end

  defp existe_solicitud(conn, solicitud) do
    if solicitud != nil do
      conn
      |> put_flash(:info, "No se hecho niguna solicitud")
      |> redirect to: "/"
    end
  end


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
    IO.inspect(label: detalle)
    id_solicitud = get_session(conn, :solicitud_id)
    IO.inspect(label: "ID DE LA SOLICITUD")
    IO.inspect(label: id_solicitud)
    IO.inspect(label: "*****END*****")


    if id_solicitud == nil do
      solicitud = Pedidos.nueva_solicitud(id_solicitud)
      IO.inspect(label: elem(solicitud, 1).id)
      conn = put_session(conn, :solicitud_id, elem(solicitud, 1).id)
    end


    conn
    |> put_flash(:ok, "Pedido realizado con exito")
    |> redirect(to: "/")


  end

end
