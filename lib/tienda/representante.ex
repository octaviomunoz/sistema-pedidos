defmodule Tienda.Representante do
  use Ecto.Schema
  import Ecto.Changeset


  schema "representante" do
    field :email, :string
    field :nombre, :string
    field :telefono, :string
    field :password, :string

    has_one :comercio, Tienda.Comercio

    timestamps()
  end

  @doc false
  def changeset(representante, attrs) do
    representante
    |> cast(attrs, [:email, :nombre, :telefono, :password])
    |> validate_required([:email, :nombre, :telefono, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end


  def representante_change(%__MODULE__{} = representante, attrs \\ %{}) do
    representante
    |> changeset(attrs)
  end
end
