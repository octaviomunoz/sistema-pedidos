defmodule Tienda.Producto do
  use Ecto.Schema
  import Ecto.Changeset


  schema "producto" do
    field :activo, :boolean, default: true
    field :foto, :binary
    field :informacion, :string
    field :ingrediente, :string
    field :mensajeDescuento, :string
    field :nombre, :string
    field :porcentajeDescuento, :integer
    field :precioUnitario, :integer
    field :urlVideo, :string


    belongs_to :comercio, Tienda.Comercio
    has_many :detalle, Tienda.Detalle


    timestamps()
  end

  @doc false
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:nombre, :foto, :urlVideo, :ingrediente, :precioUnitario, :informacion, :activo, :porcentajeDescuento, :mensajeDescuento, :comercio_id])
    |> validate_required([:nombre, :ingrediente, :precioUnitario, :porcentajeDescuento, :mensajeDescuento, :comercio_id])
  end

  def producto_change(%__MODULE__{} = producto, attrs \\ %{}) do
    producto
    |> changeset(attrs)
  end

end
