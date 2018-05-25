defmodule Tienda.Tablas.Detalle do
  use Ecto.Schema
  import Ecto.Changeset


  schema "detalle" do
    field :calificacion, :integer
    field :cantidaProducto, :integer
    field :comentarioCliente, :string
    field :precioParcial, :integer

    belongs_to :solicitud, Tienda.Tablas.Solicitud
    belongs_to :producto, Tienda.Tablas.Producto

    timestamps()
  end

  @doc false
  def changeset(detalle, attrs) do
    detalle
    |> cast(attrs, [:cantidaProducto, :comentarioCliente, :precioParcial, :calificacion])
    |> validate_required([:cantidaProducto, :precioParcial, :calificacion])
  end
end
