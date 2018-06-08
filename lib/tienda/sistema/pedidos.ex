defmodule Tienda.Sistema.Pedidos do

  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.{
    Comercio,
    Producto,
    Solicitud,
    Detalle
  }

  @doc """
  Devuelve el precio parcial multiplicando el precio del
  producto con el descuento por la cantidad del producto
  """
  def get_precio_parcial(id_producto, cantidad) do
    producto = Repo.get(Producto, id_producto)
    cantidad_producto = String.to_integer(cantidad)

    precio_parcial = cantidad_producto * producto.precioUnitario * (1 - (producto.porcentajeDescuento/100))
    trunc(precio_parcial)
  end

  @doc """
  Genera una nueva solicitud a la cual agregar los detalles
  """
  def nueva_solicitud(id_usuario, id_comercio) do
    Solicitud.changeset(%Solicitud{usuario_id: id_usuario, comercio_id: id_comercio, precioEnvio: 100, completa: false, precioTotal: 0})
    |> Repo.insert()
  end

  @doc """
  Modifica el campo de completado de la solicitud
  lo que genera es que no se pueda modificarse
  """
  def completar_solicitud(id_solicitud) do
    if  !solicitud_completa(id_solicitud) do
      Repo.get(Solicitud, id_solicitud)
      |> Ecto.Changeset.change(completa: true, fechaSolicitud: Ecto.Date.from_erl(:erlang.date()), horaSolicitud: Ecto.Time.from_erl(:erlang.time())
)
      |> Repo.update()
    end
  end


  #Devuelve si la solicitud esta completa

  defp solicitud_completa(id_solicitud) do
    query = from s in Solicitud,
      select: s.completa

    Repo.get(query, id_solicitud)
  end

  @doc """
  Crea un nuevo detalle
  """
  def nuevo_detalle(id_solicitud, detalle, id_producto) do
    IO.inspect(label: "PROBLEMAS 0001")
    IO.inspect(label: id_solicitud)
    IO.inspect(label: detalle)
    IO.inspect(label: id_producto)

    precio_parcial = get_precio_parcial(id_producto, detalle["cantidaProducto"])

    cambio_solicitud_precio_total(precio_parcial, id_solicitud)

    Detalle.changeset(%Detalle{
      solicitud_id: id_solicitud,
      producto_id: id_producto,
      cantidaProducto: String.to_integer(detalle["cantidaProducto"]),
      comentarioCliente: detalle["comentario"],
      precioParcial: precio_parcial})
    |> Repo.insert()
  end

  @doc """
  Modifica el campo de precio total de una Solicitud
  Recibe como parametros la id de la solicitud y el valor a agregar
  """
  def cambio_solicitud_precio_total(precio_parcial, id_solicitud) do
    query = from s in Solicitud,
      where: s.id == ^id_solicitud,
      select: s.precioTotal

    pre = Repo.all(query)
    precio_total =  List.first(pre)+ precio_parcial

    #Como se hacen cambios en la base de datos
    Repo.get(Solicitud, id_solicitud)
    |> Ecto.Changeset.change(precioTotal: precio_total)
    |> Repo.update()
  end

  @doc """
  Devuelve el campo de precio total de una solicitud
  """
  def precioTotal(id_solicitud) do
    precio = from d in Solicitud,
      where: d.id == ^id_solicitud,
      select: d.precioTotal

    preciofinal = Repo.all(precio)
    List.first(preciofinal)
  end

  @doc """
  Retorna los campos perteneciente a un Producto y Detalle con
  respecto a una solicitud
  """
  def get_detalle(id_solicitud) do
    detalles = from d in Detalle,
      where: d.solicitud_id == ^id_solicitud,
      join: p in Producto, where: p.id == d.producto_id

    detalles = from [d, p] in detalles,
      select: {p.nombre, p.precioUnitario, p.porcentajeDescuento, d.cantidaProducto, d.precioParcial, d.id}

    Repo.all(detalles)
  end

  @doc """
  Elimina un detalle
  """
  def borrar_detalle(id_detalle) do
    cam = from d in Detalle,
      select: {d.solicitud_id, d.precioParcial}
    solicitud = Repo.get(cam, id_detalle)

    detalle = Repo.get(Detalle, id_detalle)

    cambio_solicitud_precio_total(-(elem(solicitud, 1)), elem(solicitud, 0))

    Repo.delete(detalle)
  end

  @doc """
  Retorna el id del comercio asociado a la solicitud
  """
  def get_comercio_id(id_solicitud) do
    query = from s in Solicitud,
      join: c in Comercio,
        where: s.id == ^id_solicitud and s.comercio_id == c.id,
        select: c.id

    Repo.get(query, id_solicitud)
  end
end
