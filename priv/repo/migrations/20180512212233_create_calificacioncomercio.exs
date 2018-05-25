defmodule Tienda.Repo.Migrations.CreateCalificacioncomercio do
  use Ecto.Migration

  def change do
    create table(:calificacioncomercio) do
      add :totalComentario, :integer
      add :sumaNotaCliente, :integer

      timestamps()
    end

  end
end
