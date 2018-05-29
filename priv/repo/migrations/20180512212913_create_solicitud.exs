defmodule Tienda.Repo.Migrations.CreateSolicitud do
  use Ecto.Migration

  def change do
    create table(:solicitud) do
      add :fechaSolicitud, :date
      add :horaSolicitud, :time
      add :precioEnvio, :integer
      add :precioTotal, :integer
      add :horaEntrega, :time
      add :tipoTokenVerificacion, :integer
      add :tokenVerificacion, :string
      add :comentarioCliente, :string
      add :notaPromedioSolicitud, :integer
      add :completa, :boolean, default: false, null: false
      add :comercio_id, references(:comercio, on_delete: :nothing)
      add :usuario_id, references(:usuario, on_delete: :nothing)

      timestamps()
    end

    create index(:solicitud, [:comercio_id])
    create index(:solicitud, [:usuario_id])
  end
end
