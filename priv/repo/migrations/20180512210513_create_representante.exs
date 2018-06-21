defmodule Tienda.Repo.Migrations.CreateRepresentante do
  use Ecto.Migration

  def change do
    create table(:representante) do
      add :email, :string
      add :nombre, :string
      add :telefono, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:representante, [:email])
  end
end
