defmodule Tienda.Sistema.Busqueda do

  @moduledoc """
  Implementacion de funciones para la busqueda de productos
  """

  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.Comercio
  alias Tienda.Producto

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

end
