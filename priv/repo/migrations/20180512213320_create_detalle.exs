defmodule Tienda.Repo.Migrations.CreateDetalle do
  use Ecto.Migration

  def change do
    create table(:detalle) do
      add :cantidaProducto, :integer
      add :comentarioCliente, :string
      add :precioParcial, :integer
      add :calificacion, :integer
      add :solicitud_id, references(:solicitud, on_delete: :nothing)
      add :producto_id, references(:producto, on_delete: :nothing)

      timestamps()
    end

    create index(:detalle, [:solicitud_id])
    create index(:detalle, [:producto_id])
  end
end
