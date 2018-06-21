defmodule TiendaWeb.PageController do
  use TiendaWeb, :controller



    def index(conn, _params) do
      solicitud = get_session(conn, :solicitud_id)

      usuario = get_session(conn, :usuario_actual)

      if usuario == nil do
        redirect(conn, to: "/login")
      else
        redirect(conn, to: "/busqueda")
      end
    end
end
