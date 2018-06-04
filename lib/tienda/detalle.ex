defmodule Tienda.Detalle do
  use Ecto.Schema
  import Ecto.Changeset


  schema "detalle" do
    field :calificacion, :integer
    field :cantidaProducto, :integer
    field :comentarioCliente, :string
    field :precioParcial, :integer

    belongs_to :solicitud, Tienda.Solicitud
    belongs_to :producto, Tienda.Producto

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = detalle, attrs \\ %{}) do
    detalle
    |> cast(attrs, [:cantidaProducto, :comentarioCliente, :precioParcial, :calificacion])
    |> validate_required([:cantidaProducto, :precioParcial])
  end


  def detalle_change(%__MODULE__{} = detalle, attrs \\ %{}) do
    detalle
    |> changeset(attrs)
  end
end
