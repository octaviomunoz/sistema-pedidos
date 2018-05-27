defmodule TiendaWeb.LoginController do
  use TiendaWeb, :controller

  alias Tienda.Tablas.Usuario
  alias Tienda.Login.Login

  def loginusuario(conn, _params) do
    datos = Login.change_usuario(%Usuario{})
    render conn, "login.html", datos: datos
  end


  def  validacion(conn, datos) do
    IO.inspect(label: datos["usuario"])
    #Login.login_usuario(datos["usuario"])
    case Login.login_usuario(datos["usuario"]) do
      {:ok, mensaje: mensaje} ->
        render conn, "validacion.html", mensaje: mensaje
      {:error, mensaje: mensaje} ->
        render conn, "validacion.html", mensaje: mensaje
    end

  end


end
