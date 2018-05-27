defmodule Tienda.CalificacionComercio do
  use Ecto.Schema
  import Ecto.Changeset


  schema "calificacioncomercio" do
    field :sumaNotaCliente, :integer
    field :totalComentario, :integer

    has_one :comercio, Tienda.Comercio
    timestamps()
  end

  @doc false
  def changeset(calificacion_comercio, attrs) do
    calificacion_comercio
    |> cast(attrs, [:totalComentario, :sumaNotaCliente])
    |> validate_required([:totalComentario, :sumaNotaCliente])
  end
end
