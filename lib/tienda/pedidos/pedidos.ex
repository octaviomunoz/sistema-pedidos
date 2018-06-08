defmodule Tienda.Pedidos.Pedidos do

  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.{
    Producto,
    Solicitud,
    Detalle
  }

  #Calcula el precio parcial de un detalle
  def get_precio_parcial(id_producto, cantidad) do
    producto = Repo.get(Producto, id_producto)
    cantidad_producto = String.to_integer(cantidad)

    precio_parcial = cantidad_producto * producto.precioUnitario * (1 - (producto.porcentajeDescuento/100))
    trunc(precio_parcial)
  end

  def nueva_solicitud(id_usuario, id_producto) do
    producto = Repo.get(Producto, id_producto)
    Solicitud.changeset(%Solicitud{usuario_id: id_usuario, comercio_id: producto.comercio_id, precioEnvio: 100, completa: false, precioTotal: 0})
    |> Repo.insert()
  end


  def completar_solicitud(id, solicitud_completa) do
    if Repo.get_by(Solicitud, :completa) == false do
      Solicitud.changeset(%Solicitud{completa: true })
      |> Repo.update()
    end

  end

  def nuevo_detalle(id_solicitud, detalle) do

    precio_parcial = get_precio_parcial(detalle["producto"], detalle["detalle"]["cantidaProducto"])
    cambio_solicitud_precio_total(id_solicitud, precio_parcial)
    Detalle.changeset(%Detalle{
      solicitud_id: id_solicitud,
      producto_id: String.to_integer(detalle["producto"]),
      cantidaProducto: String.to_integer(detalle["detalle"]["cantidaProducto"]),
      comentarioCliente: detalle["comentario"],
      precioParcial: precio_parcial})
    |> Repo.insert()
  end

  def cambio_solicitud_precio_total(id_solicitud, precio_parcial) do
    query = from s in Solicitud,
      where: s.id == ^id_solicitud,
      select: s.precioTotal
    pre = Repo.all(query)
    IO.inspect(label: pre)
    precio_total =  List.first(pre)+ precio_parcial

    #Como se hacen cambios en la base de datos
    solicitud = Repo.get(Solicitud, id_solicitud)
    solicitud = Ecto.Changeset.change solicitud, precioTotal: precio_total
    Repo.update(solicitud)

  end

  def precioTotal(id_solicitud) do
    precio = from d in Solicitud,
      where: d.id == ^id_solicitud,
      select: d.precioTotal

    preciofinal = Repo.all(precio)
    List.first(preciofinal)
  end

  def get_detalle(id_solicitud) do
    detalles = from d in Detalle,
      where: d.solicitud_id == ^id_solicitud,
      join: p in Producto, where: p.id == d.producto_id

    detalles = from [d, p] in detalles,
      select: {p.nombre, p.precioUnitario, p.porcentajeDescuento, d.cantidaProducto, d.precioParcial, d.id}

    Repo.all(detalles)
  end

  def borrar_detalle(id_detalle) do
    cam = from d in Detalle,
      select: {d.solicitud_id, d.precioParcial}
    solicitud = Repo.get(cam, id_detalle)

    detalle = Repo.get(Detalle, id_detalle)

    cambio_solicitud_precio_total(elem(solicitud, 0), -(elem(solicitud, 1)))

    Repo.delete(detalle)
  end

end
