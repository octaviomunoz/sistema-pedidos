defmodule TiendaWeb.UsuarioController do
  use TiendaWeb, :controller

  alias Tienda.Sistema.{
    Registro,
    Busqueda
  }

  alias Tienda.{
    Usuario
  }

  def new(conn, _params) do
    changeset = Usuario.usuario_change(%Usuario{})
    render(conn, "form.html", changeset: changeset)
  end


  def create(conn, %{"usuario" => usuario_params}) do
    case Registro.crear_usuario(usuario_params) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Usuario Creado")
        |> redirect(to: "/")
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Error al ingresar los datos")
        |> render("form.html", changeset: changeset)
    end
  end

  def show(conn, _params) do
    id_usuario = get_session(conn, :usuario_actual)
    usuario = Busqueda.get_usuario(id_usuario)
    solicitudes = Busqueda.get_solicitud_usuario(id_usuario)

    render conn, "info.html", usuario: usuario, solicitudes: solicitudes
  end
end
