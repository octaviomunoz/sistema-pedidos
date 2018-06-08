defmodule Tienda.Usuario do


  use Ecto.Schema

  import Ecto.Changeset
  alias Tienda.Solicitud


  schema "usuario" do
    field :apellido, :string
    field :password, :string
    field :email, :string
    field :foto_perfil, :binary
    field :nombres, :string
    field :telefono, :string

    has_many :solicitud, Solicitud

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = usuario, attrs) do
    usuario
    |> cast(attrs, [:email, :nombres, :apellido, :password, :telefono, :foto_perfil])
    |> validate_required([:email, :nombres, :apellido, :password, :telefono])
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
  end


  def usuario_change(%__MODULE__{} = usuario, attrs \\ %{}) do
    usuario
    |> changeset(attrs)
  end


end
