defmodule Tienda.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuario) do
      add :email, :string
      add :nombres, :string
      add :apellido, :string
      add :password, :string
      add :telefono, :string
      add :foto_perfil, :binary

      timestamps()
    end

    create unique_index(:usuario, [:email])
  end
end
