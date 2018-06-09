defmodule Tienda.Sistema.Busqueda do

  @moduledoc """
  Implementacion de funciones para la busqueda de productos
  """

  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.{
    Comercio,
    Producto
  }

  @doc """
    Retorna los comercios que tienen el producto que se ingresa
    ordenados de mayor a menor segun el precio
  """
  def buscar_producto_nombre(nom_producto) do
    query = from c in Comercio,
      join: p in Producto,
        where: p.nombre == ^nom_producto and p.comercio_id == c.id,
        select: {c.id, c.nombre, c.calleDireccion, c.numeroDireccion},
        order_by: p.precioUnitario

    Repo.all(query)
  end

  @doc """
  Retorna todos los productos que pertenencien al comercio
  """
  def buscar_producto(comercio_id) do
    produc = from p in Producto,
      where: p.comercio_id == ^comercio_id and p.activo == :true,
      select: {p.id, p.nombre, p.precioUnitario, p.porcentajeDescuento}

    Repo.all(produc)
  end

  def get_producto(id_producto) do
    Repo.get(Producto, id_producto)
  end

  def get_comercio(id_comercio) do
    Repo.get(Comercio, id_comercio)
  end

end
