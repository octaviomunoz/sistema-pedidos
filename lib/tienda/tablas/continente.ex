defmodule Tienda.Tablas.Continente do
  use Ecto.Schema
  import Ecto.Changeset


  schema "continente" do
    field :nombre, :string

    has_many :pais, Tienda.Tablas.Pais

    timestamps()
  end

  @doc false
  def changeset(continente, attrs) do
    continente
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end
end
