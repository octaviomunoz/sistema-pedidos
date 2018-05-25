defmodule Tienda.Repo.Migrations.CreateProducto do
  use Ecto.Migration

  def change do
    create table(:producto) do
      add :nombre, :string
      add :foto, :binary
      add :urlVideo, :string
      add :ingrediente, :string
      add :precioUnitario, :integer
      add :informacion, :string
      add :activo, :boolean, default: false, null: false
      add :porcentajeDescuento, :integer
      add :mensajeDescuento, :string
      add :comercio_id, references(:comercio, on_delete: :nothing)

      timestamps()
    end

    create index(:producto, [:comercio_id])
  end
end
