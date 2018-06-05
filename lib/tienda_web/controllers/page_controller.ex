defmodule TiendaWeb.PageController do
  use TiendaWeb, :controller



    def index(conn, _params) do
      solicitud = get_session(conn, :solicitud_id)

      render conn, "index.html", solicitud: solicitud
    end
end
