defmodule Tienda.Sistema.Registro do
  @moduledoc """
  Implementacion de funciones para el registro de Comercios y Usuarios
  """
  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.{
    Usuario,
    Comercio,
    Representante
  }

  def crear_usuario(attrs \\ %{}) do
    %Usuario{}
    |> Usuario.changeset(attrs)
    |> Repo.insert()
  end

  def crear_representante(attrs \\ %{}) do
    %Representante{}
    |> Representante.changeset(attrs)
    |> Repo.insert()
  end

  def crear_comercio(attrs \\ %{}) do
    %Comercio{}
    |> Comercio.changeset(attrs)
    |> Repo.insert()
  end

  def eliminar_representante(id) do
    Repo.get(Representante, id)
    |> Repo.delete()
  end


end
