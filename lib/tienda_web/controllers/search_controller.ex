defmodule TiendaWeb.SearchController do
  use TiendaWeb, :controller

  alias Tienda.Buscar.BuscarComercio

  alias Tienda.Continente
  alias Tienda.Pais
  alias Tienda.Ciudad
  alias Tienda.Comercio

  def elegircontinente(conn, _params) do
    continentes = BuscarComercio.nombre_continente()
    nombre = BuscarComercio.change_continente(%Continente{})

    usuario = get_session(conn, :usuario_actual)

    render conn, "bucontinente.html", continentes: continentes, nombre: nombre, usuario: usuario
  end



  def elegirpais(conn, con) do
    IO.inspect(label: con)
    continente = BuscarComercio.get_continente!(con["continente"]["nombre"])
    paises = BuscarComercio.nombre_pais(continente.id)
    nombre = BuscarComercio.change_pais(%Pais{})
    render conn, "bupais.html", paises: paises, nombre: nombre
  end

  def elegirciudad(conn, pai) do

    pais = BuscarComercio.get_pais!(pai["pais"]["nombre"])
    ciudades = BuscarComercio.nombre_ciudad(pais.id)
    nombre = BuscarComercio.change_ciudad(%Ciudad{})
    render conn, "buciudad.html", ciudades: ciudades, nombre: nombre
  end

  def elegircomercio(conn, ciu) do
    ciudad = BuscarComercio.get_ciudad!(ciu["ciudad"]["nombre"])
    comercios = BuscarComercio.nombreComercioCiudad(ciudad.id)
    render conn, "bucomercio.html", comercios: comercios
  end
end
