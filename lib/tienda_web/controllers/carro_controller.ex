defmodule TiendaWeb.CarroController do
  use TiendaWeb, :controller

  def carro_compra(conn, _params) do
    solicitud = get_session(conn, :solicitud_id)
    existe_solicitud(conn, solicitud)

    render conn, "carro.html"
  end

  defp existe_solicitud(conn, solicitud) do
    if solicitud != nil do
      conn
      |> put_flash(:info, "No se hecho niguna solicitud")
      |> redirect to: "/"
    end
  end

end
