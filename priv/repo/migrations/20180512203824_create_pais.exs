defmodule Tienda.Repo.Migrations.CreatePais do
  use Ecto.Migration

  def change do
    create table(:pais) do
      add :nombre, :string
      add :continente_id, references(:continente, on_delete: :nothing)

      timestamps()
    end

    create index(:pais, [:continente_id])
  end
end
