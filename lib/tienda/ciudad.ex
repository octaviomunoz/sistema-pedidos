defmodule Tienda.Ciudad do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ciudad" do
    field :codigoTelefono, :string
    field :nombre, :string

    belongs_to :pais, Tienda.Pais
    has_many :comercio, Tienda.Comercio

    timestamps()
  end

  @doc false
  def changeset(ciudad, attrs) do
    ciudad
    |> cast(attrs, [:nombre, :codigoTelefono, :pais_id])
    |> validate_required([:nombre, :codigoTelefono, :pais_id])
  end
end
