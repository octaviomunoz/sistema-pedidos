defmodule Tienda.Solicitud do
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
    field :completa, :boolean


    belongs_to :comercio, Tienda.Comercio
    belongs_to :usuario, Tienda.Usuario

    has_many :detalle, Tienda.Detalle

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = solicitud, attrs \\ %{}) do
    solicitud
    |> cast(attrs, [:fechaSolicitud, :horaSolicitud, :precioEnvio, :precioTotal, :horaEntrega, :tipoTokenVerificacion, :tokenVerificacion, :comentarioCliente, :notaPromedioSolicitud, :completa])
    |> validate_required([:precioEnvio])
  end

  def solicitud_change(%__MODULE__{} = solicitud, attrs \\ %{}) do
    solicitud
    |> changeset(attrs)
  end


end
