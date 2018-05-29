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

    get "/login", LoginController, :loginusuario
    post "/validacion", LoginController, :validacion

    get "/search/continente", SearchController, :elegircontinente
    post "/search/pais", SearchController, :elegirpais
    post "/search/ciudad", SearchController, :elegirciudad
    post "/search/comercio", SearchController, :elegircomercio

    post "/productos", PedidoController, :mostrar_producto

  end

  # Other scopes may use custom stacks.
  # scope "/api", TiendaWeb do
  #   pipe_through :api
  # end
end
