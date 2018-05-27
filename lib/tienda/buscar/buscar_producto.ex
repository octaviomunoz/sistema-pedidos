defmodule Tienda.Buscar.BuscarProducto do

  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.Producto

  def buscar_producto(comercio_id) do
    produc = from p in Producto,
      where: p.comercio_id == ^comercio_id and p.activo == :true,
      select: {p.id, p.nombre, p.precioUnitario, p.porcentajeDescuento}

    Repo.all(produc)
  end
end
