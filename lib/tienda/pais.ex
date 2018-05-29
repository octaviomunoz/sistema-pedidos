defmodule Tienda.Pais do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pais" do
    field :nombre, :string

    belongs_to :continente, Tienda.Continente
    has_many :ciudad, Tienda.Ciudad
    has_many :comercio, Tienda.Comercio


    timestamps()
  end

  @doc false
  def changeset(pais, attrs) do
    pais
    |> cast(attrs, [:nombre, :continente_id])
    |> validate_required([:nombre, :continente_id])
  end

  def pais_change(%__MODULE__{} = pais, attrs \\ %{}) do
    pais
    |> changeset(attrs)
  end
end
