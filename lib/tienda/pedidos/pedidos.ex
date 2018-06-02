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

    cantidad * (producto.precioUnitario * (1 - (producto.porcentajeDescuento / 100))) 
  end

  def nueva_solicitud(id_solicitud) do
    Solicitud.changeset(%Solicitud{precioEnvio: 100, completa: false})
    |> Repo.insert()
  end


  def completar_solicitud(%Solicitud{} = solicitud) do
    Solicitud.changeset(%Solicitud{}, completa: :true)
    |> Repo.insert()
  end



end
