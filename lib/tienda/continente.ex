defmodule Tienda.Continente do
  use Ecto.Schema
  import Ecto.Changeset


  schema "continente" do
    field :nombre, :string

    has_many :pais, Tienda.Pais

    timestamps()
  end

  @doc false
  def changeset(continente, attrs) do
    continente
    |> cast(attrs, [:nombre])
    |> validate_required([:nombre])
  end


  def continente_change(%__MODULE__{} = continente, attrs \\ %{}) do
    continente
    |> changeset(attrs)
  end
end
