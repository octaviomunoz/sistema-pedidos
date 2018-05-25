defmodule Tienda.Tablas.Solicitud do
  use Ecto.Schema
  import Ecto.Changeset


  schema "solicitud" do
    field :comentarioCliente, :string
    field :fechaSolicitud, :date
    field :horaEntrega, :time
    field :horaSolicitud, :time
    field :precioEnvio, :integer
    field :notaPromedioSolicitud, :integer
    field :tipoTokenVerificacion, :integer
    field :tokenVerificacion, :string
    field :precioTotal, :integer


    belongs_to :comercio, Tienda.Tablas.Comercio
    belongs_to :usuario, Tienda.Tablas.Usuario

    has_many :detalle, Tienda.Tablas.Detalle

    timestamps()
  end

  @doc false
  def changeset(solicitud, attrs) do
    solicitud
    |> cast(attrs, [:fechaSolicitud, :horaSolicitud, :precioEnvio, :precioTotal, :horaEntrega, :tipoTokenVerificacion, :tokenVerificacion, :comentarioCliente, :notaPromedioSolicitud])
    |> validate_required([:fechaSolicitud, :horaSolicitud, :precioEnvio, :precioTotal, :horaEntrega, :tipoTokenVerificacion, :tokenVerificacion, :notaPromedioSolicitud])
  end
end
