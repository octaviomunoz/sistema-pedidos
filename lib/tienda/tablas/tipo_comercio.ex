defmodule Tienda.Tablas.TipoComercio do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tipocomercio" do
    field :nombre, :string

    has_many :comercio, Tienda.Tablas.Comercio

    timestamps()
  end

  @doc false
  def changeset(tipo_comercio, attrs) do
    tipo_comercio
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end
end
