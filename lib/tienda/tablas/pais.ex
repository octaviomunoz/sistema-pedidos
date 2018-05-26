defmodule Tienda.Tablas.Pais do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pais" do
    field :nombre, :string

    belongs_to :continente, Tienda.Tablas.Continente
    has_many :ciudad, Tienda.Tablas.Ciudad
    has_many :comercio, Tienda.Tablas.Comercio


    timestamps()
  end

  @doc false
  def changeset(pais, attrs) do
    pais
    |> cast(attrs, [:nombre, :continente_id])
    |> validate_required([:nombre, :continente_id])
  end
end
