defmodule TiendaWeb.UsuarioController do
  use TiendaWeb, :controller

  alias Tienda.Sistema.Registro

  alias Tienda.{
    Usuario
  }

  def new(conn, _params) do
    changeset = Usuario.usuario_change(%Usuario{})
    render(conn, "new.html", changeset: changeset)
  end


  def create(conn, %{"usuario" => usuario_params}) do
    IO.inspect(label: usuario_params)
    case Registro.crear_usuario(usuario_params) do
      {:ok, usuario} ->
        conn
        |> put_flash(:info, "Usuario Creado")
        |> redirect(to: "/")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
