defmodule Tienda.Representante do
  use Ecto.Schema
  import Ecto.Changeset


  schema "representante" do
    field :calleDireccion, :string
    field :email, :string
    field :nombre, :string
    field :numeroDireccion, :integer
    field :telefono, :string

    has_one :comercio, Tienda.Comercio

    timestamps()
  end

  @doc false
  def changeset(representante, attrs) do
    representante
    |> cast(attrs, [:email, :nombre, :telefono, :calleDireccion, :numeroDireccion])
    |> validate_required([:email, :nombre, :telefono, :calleDireccion])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
