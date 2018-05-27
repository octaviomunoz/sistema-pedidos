defmodule Tienda.Usuario do
  use Ecto.Schema
  import Ecto.Changeset


  schema "usuario" do
    field :apellido, :string
    field :password, :string
    field :email, :string
    field :foto_perfil, :binary
    field :nombres, :string
    field :telefono, :string

    has_many :solicitud, Tienda.Solicitud

    timestamps()
  end

  @doc false
  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:email, :nombres, :apellido, :password, :telefono, :foto_perfil])
    |> validate_required([:email, :nombres, :apellido, :password, :telefono])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end


end
