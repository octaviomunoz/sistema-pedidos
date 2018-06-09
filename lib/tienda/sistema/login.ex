defmodule Tienda.Sistema.Login do

  import Ecto.Query, warn: false
  alias Tienda.Repo

  alias Tienda.Usuario


  def login_usuario(datoslogeo) do
    user = Repo.get_by(Usuario, email: datoslogeo["email"])

    if user == nil do
      {:error, mensaje: "email ingresado incorrecto"}
    else
      case verificar_password(datoslogeo["password"], user.password) do
        {:ok} ->
          {:ok, user: user}
        {:error} ->
          {:error, mensaje: "Contraseña Incorrecta"}
      end
    end
  end

  def verificar_password(password_solicitud, password) do
    if password_solicitud == password do
      {:ok}
    else
      {:error}
    end
  end

end
