defmodule Tienda.Tablas.Ciudad do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ciudad" do
    field :codigoTelefono, :string
    field :nombre, :string

    belongs_to :pais, Tienda.Tablas.Pais
    has_many :comercio, Tienda.Tablas.Comercio

    timestamps()
  end

  @doc false
  def changeset(ciudad, attrs) do
    ciudad
    |> cast(attrs, [:nombre, :codigoTelefono])
    |> validate_required([:nombre, :codigoTelefono])
  end
end
