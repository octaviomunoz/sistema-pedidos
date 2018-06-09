defmodule TiendaWeb.LoginController do
  use TiendaWeb, :controller

  alias Tienda.Usuario
  alias Tienda.Sistema.Login

  def login_usuario(conn, _params) do
    datos = Usuario.usuario_change(%Usuario{})
    render conn, "login.html", datos: datos
  end

  def  validacion(conn, datos) do
    case Login.login_usuario(datos["usuario"]) do
      {:ok, user: user} ->
        ok_login(conn, user)
      {:error, mensaje: mensaje} ->
        conn
        |> put_flash(:error, mensaje)
        |> redirect(to: "/login")
    end
  end

  defp ok_login(conn, user) do
    conn
    |> put_flash(:info, "Inicio de Sesion Correcto")
    |> put_session(:usuario_actual, user.id)
    |> redirect(to: "/")
  end

  def cerrar_sesion(conn, _params) do
    conn
    |> delete_session(:usuario_actual)
    |> redirect(to: "/")
  end


end
