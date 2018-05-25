defmodule Tienda.Repo.Migrations.CreateContinente do
  use Ecto.Migration

  def change do
    create table(:continente) do
      add :nombre, :string

      timestamps()
    end

  end
end
