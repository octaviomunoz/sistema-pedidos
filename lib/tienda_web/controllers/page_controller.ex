defmodule TiendaWeb.PageController do
  use TiendaWeb, :controller



    def index(conn, _params) do
      solicitud = get_session(conn, :solicitud_id)
      usuario = get_session(conn, :usuario_actual)

      render conn, "index.html", solicitud: solicitud, usuario: usuario
    end
end
