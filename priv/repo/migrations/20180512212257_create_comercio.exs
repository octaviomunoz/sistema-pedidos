defmodule Tienda.Repo.Migrations.CreateComercio do
  use Ecto.Migration

  def change do
    create table(:comercio) do
      add :nombre, :string
      add :email, :string
      add :telefono, :integer
      add :calleDireccion, :string
      add :numeroDireccion, :string
      add :fax, :string
      add :urlSitio, :string
      add :coordenadasLocalizacionGeografica, :binary
      add :mapaLocalizacionGeografica, :binary
      add :valorMinEntregaComida, :integer
      add :porcentajeDescuentoGeneral, :integer
      add :mensajeGeneral, :string
      add :mensajeDescuento, :string
      add :visibleComercio, :boolean, default: false, null: false
      add :mensajeUsuarioSolicitud, :string
      add :mensajeUsuarioCancelacionSolicitud, :string
      add :fotoPortada, :binary
      add :comercioActivo, :boolean, default: false, null: false
      add :condiciones, :string
      add :tipoPagoSolicitud, :integer
      add :redSocialFacebook, :string
      add :redSocialInstagram, :string
      add :redSocialLinkedin, :string
      add :redSocialWhatsapp, :string
      add :representante_id, references(:representante, on_delete: :nothing)
      add :pais_id, references(:pais, on_delete: :nothing)
      add :ciudad_id, references(:ciudad, on_delete: :nothing)
      add :tipocomercio_id, references(:tipocomercio, on_delete: :nothing)
      add :calificacioncomercio_id, references(:calificacioncomercio, on_delete: :nothing)

      timestamps()
    end

    create index(:comercio, [:representante_id])
    create index(:comercio, [:pais_id])
    create index(:comercio, [:ciudad_id])
    create index(:comercio, [:tipocomercio_id])
    create index(:comercio, [:calificacioncomercio_id])
  end
end
