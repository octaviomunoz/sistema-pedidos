defmodule Tienda.Repo.Migrations.CreateTipocomercio do
  use Ecto.Migration

  def change do
    create table(:tipocomercio) do
      add :nombre, :string

      timestamps()
    end

  end
end
