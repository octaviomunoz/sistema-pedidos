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

    precio_total = Pedidos.precioTotal(solicitud)

    detalle = Pedidos.get_detalle(solicitud)

    render conn, "carro.html", detalle: detalle, precio_total: precio_total
  end

  defp existe_solicitud(conn, solicitud) do
    if solicitud == nil do
      conn
      |> put_flash(:info, "No se hecho niguna solicitud")
      |> redirect(to: "/")
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
    id_usuario = get_session(conn, :usuario_actual)

    #Verifica que exita un usuario
    if id_usuario == nil do
      redirect(conn, to: "/login")
    end

    #Verifica que exista una solicitud
    if id_solicitud == nil do
      solicitud = Pedidos.nueva_solicitud(id_usuario, detalle["comercio"])
      conn = put_session(conn, :solicitud_id, elem(solicitud, 1).id)
      id_solicitud = elem(solicitud, 1).id
    end

    #Guarda el detalle
    IO.inspect(label: detalle["producto"])

    deta = Pedidos.nuevo_detalle(id_solicitud, detalle)

    conn
    |> put_flash(:info, "Pedido realizado con exito")
    |> redirect(to: "/")
  end

  def eliminar_detalle(conn, id_detalle) do
    IO.inspect(label: id_detalle["id"])
    detalle_id = String.to_integer(id_detalle["id"])

    Pedidos.borrar_detalle(detalle_id)

    conn
    |> put_flash(:info, "Producto Eliminado")
    |> redirect(to: "/carro")
  end


end
