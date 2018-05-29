defmodule TiendaWeb.SearchController do
  use TiendaWeb, :controller

  alias Tienda.Buscar.BuscarComercio

  alias Tienda.{
    Continente,
    Pais,
    Ciudad,
    Comercio
  }


  def elegircontinente(conn, _params) do
    continentes = BuscarComercio.nombre_continente()
    nombre = Continente.continente_change(%Continente{})

    render conn, "bucontinente.html", continentes: continentes, nombre: nombre
  end



  def elegirpais(conn, con) do
    continente = BuscarComercio.get_continente!(con["continente"]["nombre"])
    paises = BuscarComercio.nombre_pais(continente.id)
    nombre = Pais.pais_change(%Pais{})
    render conn, "bupais.html", paises: paises, nombre: nombre
  end

  def elegirciudad(conn, pai) do

    pais = BuscarComercio.get_pais!(pai["pais"]["nombre"])
    ciudades = BuscarComercio.nombre_ciudad(pais.id)
    nombre = Ciudad.ciudad_change(%Ciudad{})
    render conn, "buciudad.html", ciudades: ciudades, nombre: nombre
  end

  def elegircomercio(conn, ciu) do
    ciudad = BuscarComercio.get_ciudad!(ciu["ciudad"]["nombre"])
    comercios = BuscarComercio.nombreComercioCiudad(ciudad.id)
    render conn, "bucomercio.html", comercios: comercios
  end
end
