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
    Solicitud.changeset(%Solicitud{usuario_id: id_usuario, comercio_id: producto.comercio_id, precioEnvio: 100, completa: false})
    |> Repo.insert()
  end


  def completar_solicitud(id, solicitud_completa) do
    if Repo.get_by(Solicitud, :completa) == false do
      Solicitud.changeset(%Solicitud{completa: true })
      |> Repo.update()
    end

  end

  def nuevo_detalle(id_solicitud, detalle) do
    #IO.inspect(label: detalle)

    precio_parcial = get_precio_parcial(detalle["producto"], detalle["detalle"]["cantidaProducto"])
    IO.inspect(label: "precio_parcial")
    IO.inspect(label: precio_parcial)
    Detalle.changeset(%Detalle{
      solicitud_id: id_solicitud,
      producto_id: String.to_integer(detalle["producto"]),
      cantidaProducto: String.to_integer(detalle["detalle"]["cantidaProducto"]),
      comentarioCliente: detalle["comentario"],
      precioParcial: precio_parcial})
    |> Repo.insert()
  end

  def cantidad_pedido(id_solicitud) do
    precio = from pr in Detalle,
      select: pr.precioParcial
    list_precio = Repo.all(precio)
    IO.inspect(label: list_precio)
    precio_total = 0
    for pre <- list_precio do
      IO.inspect(label: pre)
      precio_total = precio_total + pre
    end
    IO.inspect(label: precio_total)
    precio_total
  end



end
