defmodule Tienda.Repo.Migrations.CreateCiudad do
  use Ecto.Migration

  def change do
    create table(:ciudad) do
      add :nombre, :string
      add :codigoTelefono, :string
      add :pais_id, references(:pais, on_delete: :nothing)

      timestamps()
    end

    create index(:ciudad, [:pais_id])
  end
end
