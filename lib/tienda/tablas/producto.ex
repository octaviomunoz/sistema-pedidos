defmodule Tienda.Tablas.Producto do
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


    belongs_to :comercio, Tienda.Tablas.Comercio
    has_many :detalle, Tienda.Tablas.Detalle


    timestamps()
  end

  @doc false
  def changeset(producto, attrs) do
    producto
    |> cast(attrs, [:nombre, :foto, :urlVideo, :ingrediente, :precioUnitario, :informacion, :activo, :porcentajeDescuento, :mensajeDescuento])
    |> validate_required([:nombre, :ingrediente, :precioUnitario, :porcentajeDescuento, :mensajeDescuento])
  end
end
