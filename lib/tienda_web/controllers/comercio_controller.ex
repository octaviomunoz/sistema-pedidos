defmodule TiendaWeb.ComercioController do
  use TiendaWeb, :controller

  alias Tienda.Sistema.Busqueda

  alias Tienda.Sistema.Registro

  alias Tienda.{
    Producto,
    Comercio,
    Representante
  }

  def busqueda_producto(conn, _params) do
    producto = Producto.producto_change(%Producto{})
    render conn, "busproducto.html", producto: producto
  end


  def obteniendo_producto(conn, %{"producto" => %{"nombre" => producto}}) do
    IO.inspect(label: producto)
    comercios = Busqueda.buscar_producto_nombre(producto)
    render conn, "vista_comercios.html", producto: producto, comercios: comercios
  end

  @doc """
  Abre el formulario para crear un nuevo comercio
  """
  def new(conn, _params) do
    changeset = Comercio.comercio_change(%Comercio{})
    render(conn, "form_comercio.html", changeset: changeset)
  end

  @doc """
  Abre un formulario para crear un nuevo representante
  """
  def new_representante(conn, _params) do
    changeset = Representante.representante_change(%Representante{})
    render(conn, "form_repre.html", changeset: changeset)
  end

  @doc """
  Guarda en la base de datos el comercio y redirige a crear un representante
  """
  def create(conn, %{"comercio" => comercio_params}) do
    case Registro.crear_comercio(comercio_params) do
      {:ok, comercio} ->
        new_representante(conn, comercio.id)
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Error al ingresar los datos")
        |> render("form_comercio.html", changeset: changeset)
    end
  end

  @doc """
  Guarda el representante en la base de datos
  """
  def create_representante(conn, %{"representante" => representante_params}) do
    case Registro.crear_representante(representante_params) do
      {:ok, representante} ->
        conn
        |> put_flash(:info, "Comercio Creado Exitosamente")
        |> redirect(to: "/login")
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Error al ingresar los datos")
        |> render("form_repre.html", changeset: changeset)
    end
  end
end
