defmodule TiendaWeb.Router do
  use TiendaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end



  scope "/", TiendaWeb do
    pipe_through :browser # Use the default browser stack


    get "/", PageController, :index

    get "/login", LoginController, :login_usuario
    post "/login", LoginController, :login_usuario
    post "/validacion", LoginController, :validacion
    get "/finalizar-sesion", LoginController, :cerrar_sesion
    post "/finalizar-sesion", LoginController, :cerrar_sesion

    post "/productos", CarroController, :mostrar_producto
    post "/eleccion", CarroController, :agregar_producto
    post "/eleccion/agregar_carro", CarroController, :agregar_carro

    get "/carro", CarroController, :carro_compra
    post "/carro/eliminar", CarroController, :eliminar_detalle
    get "/carro/solicitud-completa", CarroController, :solicitud_completa
    get "/carro/cancelar-pedido", CarroController, :cancelar_solicitud

    resources "/usuario", UsuarioController, only: [:edit, :update, :new, :create]

    get "usuario/info", UsuarioController, :show




    get "/busqueda", ComercioController, :busqueda_producto
    post "/busqueda/comercios", ComercioController, :obteniendo_producto

    resources "/comercio", ComercioController, only: [:edit, :update, :new, :create, :show]


  end

  scope "/registro", TiendaWeb do
    pipe_through :browser
    get "/representante", ComercioController, :new_representante
    post "/representante/create", ComercioController, :create_representante
    post "/representante", ComercioController, :eliminar_repre
  end

  # Other scopes may use custom stacks.
  # scope "/api", TiendaWeb do
  #   pipe_through :api
  # end
end
