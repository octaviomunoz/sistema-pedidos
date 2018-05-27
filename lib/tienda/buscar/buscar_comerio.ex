defmodule Tienda.Buscar.BuscarComercio do

  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.Continente
  alias Tienda.Pais
  alias Tienda.Ciudad
  alias Tienda.Comercio



  def nombre_continente() do
    continentes = from cont in Continente,
      select: cont.nombre

    Repo.all(continentes)
  end

  def get_continente!(nombre) do
    if nombre != nil do
      Repo.get_by!(Continente, nombre: nombre)
    end
  end

  def nombre_pais(continente_id) do
    nombres = from pais in Pais,
      where: pais.continente_id == ^continente_id,
      select: pais.nombre

      Repo.all(nombres)
  end

  def get_pais!(nombre) do
    if nombre != nil do
      Repo.get_by!(Pais, nombre: nombre)
    end
  end

  def nombre_ciudad(pais_id) do
    nombres = from ciu in Ciudad,
      where: ciu.pais_id == ^pais_id,
      select: ciu.nombre

    Repo.all(nombres)
  end

  def get_ciudad!(nombre) do
    if nombre != nil do
      Repo.get_by!(Ciudad, nombre: nombre)
    end
  end

  def nombreComercioCiudad(ciudad_id) do
    nombres = from com in Comercio,
      where: com.ciudad_id == ^ciudad_id,
      select: {com.id, com.nombre, com.calleDireccion, com.numeroDireccion}

    Repo.all(nombres)
  end

  def get_comercio(id) do
    Repo.get(Comercio, id)
  end


  def change_continente(%Continente{} = continente) do
    Continente.changeset(continente, %{})
  end

  def change_pais(%Pais{} = pais) do
    Pais.changeset(pais, %{})
  end

  def change_ciudad(%Ciudad{} = ciudad) do
    Ciudad.changeset(ciudad, %{})
  end

  def change_comercio(%Comercio{} = comercio) do
    Comercio.changeset(comercio, %{})
  end
end
