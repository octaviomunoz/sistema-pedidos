defmodule Tienda.Comercio do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comercio" do
    field :mensajeDescuento, :string
    field :calleDireccion, :string
    field :comercioActivo, :boolean, default: true
    field :condiciones, :string
    field :coordenadasLocalizacionGeografica, :binary
    field :email, :string
    field :visibleComercio, :boolean, default: true
    field :fax, :string
    field :fotoPortada, :binary
    field :mapaLocalizacionGeografica, :binary
    field :mensajeUsuarioSolicitud, :string
    field :mensajeGeneral, :string
    field :mensajeUsuarioCancelacionSolicitud, :string
    field :nombre, :string
    field :numeroDireccion, :string
    field :porcentajeDescuentoGeneral, :integer
    field :redSocialFacebook, :string
    field :redSocialInstagram, :string
    field :redSocialLinkedin, :string
    field :redSocialWhatsapp, :string
    field :telefono, :integer
    field :tipoPagoSolicitud, :integer
    field :urlSitio, :string
    field :valorMinEntregaComida, :integer


    belongs_to :representante, Tienda.Representante
    belongs_to :pais, Tienda.Pais
    belongs_to :ciudad, Tienda.Ciudad
    belongs_to :tipocomercio, Tienda.TipoComercio
    belongs_to :calificacioncomercio, Tienda.CalificacionComercio

    has_many :producto, Tienda.Producto
    has_many :solicitud, Tienda.Solicitud
    timestamps()
  end

  @doc false
  def changeset(comercio, attrs) do
    comercio
    |> cast(attrs, [:nombre, :email, :telefono, :calleDireccion, :numeroDireccion, :fax, :urlSitio, :coordenadasLocalizacionGeografica, :mapaLocalizacionGeografica, :valorMinEntregaComida, :porcentajeDescuentoGeneral, :mensajeGeneral, :mensajeDescuento, :visibleComercio, :mensajeUsuarioSolicitud, :mensajeUsuarioCancelacionSolicitud, :fotoPortada, :comercioActivo, :condiciones, :tipoPagoSolicitud, :redSocialFacebook, :redSocialInstagram, :redSocialLinkedin, :redSocialWhatsapp, :representante_id])
    |> validate_required([:nombre, :email, :telefono, :calleDireccion, :numeroDireccion])
  end


  def comercio_change(%__MODULE__{} = comercio, attrs \\ %{}) do
    comercio
    |> changeset(attrs)
  end
end
