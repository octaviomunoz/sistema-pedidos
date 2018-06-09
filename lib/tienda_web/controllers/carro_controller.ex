defmodule TiendaWeb.CarroController do
  use TiendaWeb, :controller

  alias Tienda.Sistema.{
    Pedidos,
    Busqueda
  }
  alias Tienda.{
    Comercio,
    Solicitud,
    Detalle
  }

  def carro_compra(conn, _params) do
    solicitud = get_session(conn, :solicitud_id)
    existe_solicitud(conn, solicitud)

    comercio = Pedidos.get_comercio_id(solicitud)
    IO.inspect(label: "ID COMERCIO")
    IO.inspect(label: comercio)
    precio_total = Pedidos.precioTotal(solicitud)
    detalle = Pedidos.get_detalle(solicitud)

    render conn, "carro.html", detalle: detalle, precio_total: precio_total, solicitud: solicitud, comercio: comercio
  end


  defp existe_solicitud(conn, solicitud) do
    if solicitud == nil do
      conn
      |> put_flash(:info, "No se hecho niguna solicitud")
      |> redirect(to: "/")
    end
  end


  def mostrar_producto(conn, %{"comercio" => id_comercio}) do
    productos = Busqueda.buscar_producto(id_comercio)
    comercio =
    render conn, "producto.html", productos: productos
  end


  def agregar_producto(conn, %{"producto" => id_producto}) do
    producto = Busqueda.get_producto(id_producto)
    detalle = Detalle.detalle_change(%Detalle{})
    render conn, "seleccion.html", producto: producto, detalle: detalle
  end


  def agregar_carro(conn, %{"detalle" => detalle, "comercio" => id_comercio, "producto" => id_producto}) do
    id_solicitud = get_session(conn, :solicitud_id)
    id_usuario = get_session(conn, :usuario_actual)

    #Verifica que exita un usuario
    if id_usuario == nil do
      conn
      |> put_flash(:info, "Necesita iniciar sesion")
      |> redirect(to: "/login")

    else
      #Verifica que exista una solicitud
      if id_solicitud == nil do
        solicitud = Pedidos.nueva_solicitud(id_usuario, String.to_integer(id_comercio))
        conn = put_session(conn, :solicitud_id, elem(solicitud, 1).id)
        id_solicitud = elem(solicitud, 1).id
      end

      #Guarda el detalle
      deta = Pedidos.nuevo_detalle(id_solicitud, detalle, String.to_integer(id_producto))

      conn
      |> put_flash(:info, "Pedido realizado con exito")
      |> redirect(to: "/carro")
    end
  end


  def eliminar_detalle(conn, %{"detalle" => id}) do
    Pedidos.borrar_detalle(id)
    conn
    |> put_flash(:info, "Producto Eliminado")
    |> redirect(to: "/carro")
  end


  def solicitud_completa(conn, _params) do
    id_solicitud = get_session(conn, :solicitud_id)
    Pedidos.completar_solicitud(id_solicitud)
    conn
    |> delete_session(:solicitud_id)
    |> redirect(to: "/")
  end

  def cancelar_solicitud(conn, _params) do
    id_solicitud = get_session(conn, :solicitud_id)
    Pedidos.eliminar_solicitud(id_solicitud)

    conn
    |> delete_session(:solicitud_id)
    |> put_flash(:info, "Pedido Cancelado")
    |> redirect(to: "/")
  end
end
