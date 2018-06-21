# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tienda.Repo.insert!(%Tienda.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Tienda.Continente
Tienda.Repo.insert!(%Continente{
  nombre: "America"
})

alias Tienda.Pais
Tienda.Repo.insert!(%Pais{
  nombre: "Chile",
  continente_id: 1
  })

alias Tienda.Ciudad
Tienda.Repo.insert!(%Ciudad{
  nombre: "Curico",
  codigoTelefono: "75",
  pais_id: 1
})

Tienda.Repo.insert!(%Ciudad{
  nombre: "Talca",
  codigoTelefono: "71",
  pais_id: 1
})


alias Tienda.Usuario
Tienda.Repo.insert!(%Usuario{
  nombres: "Primero",
  apellido: "pri",
  email: "primero@ejemplo.com",
  password: "123456789",
  telefono: "987654321"
})

Tienda.Repo.insert!(%Usuario{
  nombres: "Segundo",
  apellido: "segu",
  email: "segundo@ejemplo.com",
  password: "123456789",
  telefono: "987654321"
})

Tienda.Repo.insert!(%Usuario{
  nombres: "Tercero",
  apellido: "ter",
  email: "tercero@ejemplo.com",
  password: "123456789",
  telefono: "987654321"
})


alias Tienda.Representante
Tienda.Repo.insert!(%Representante{
  email: "roberto@ejemplo.com",
  nombre: "Roberto",
  telefono: "87654321",
  calleDireccion: "1 Sur",
  numeroDireccion: 675
  })


alias Tienda.TipoComercio
Tienda.Repo.insert!(%TipoComercio{
  nombre: "restaurante"
})

Tienda.Repo.insert!(%TipoComercio{
  nombre: "pizzeria"
})


alias Tienda.CalificacionComercio
Tienda.Repo.insert!(%CalificacionComercio{
  sumaNotaCliente: 0,
  totalComentario: 0,
  })


alias Tienda.Comercio
Tienda.Repo.insert!(%Comercio{
  nombre: "Comercio1",
  email: "donjuan@ejemplo.Comercio",
  telefono: 7654321,
  calleDireccion: "1 sur",
  numeroDireccion: "675",
  fax: "7654321",
  urlSitio: "www.donjuan.cl",
  valorMinEntregaComida: 2,
  porcentajeDescuentoGeneral: 5,
  mensajeGeneral: "Bienvenido a Don Juan",
  mensajeDescuento: "Ahorro",
  visibleComercio: true,
  mensajeUsuarioSolicitud: "Solicitud Realizada",
  mensajeUsuarioCancelacionSolicitud: "Solicitud Cancelada",
  comercioActivo: true,
  condiciones: "Solo compras dentro de Talca",
  tipoPagoSolicitud: 1,
  representante_id: 1,
  pais_id: 1,
  ciudad_id: 2,
  tipocomercio_id: 1,
  calificacioncomercio_id: 1
  })

  Tienda.Repo.insert!(%Comercio{
    nombre: "Comercio2",
    email: "donjuan@ejemplo.Comercio",
    telefono: 7654321,
    calleDireccion: "1 sur",
    numeroDireccion: "676",
    fax: "7654321",
    urlSitio: "www.donjuan.cl",
    valorMinEntregaComida: 2,
    porcentajeDescuentoGeneral: 5,
    mensajeGeneral: "Bienvenido a Don Juan",
    mensajeDescuento: "Ahorro",
    visibleComercio: true,
    mensajeUsuarioSolicitud: "Solicitud Realizada",
    mensajeUsuarioCancelacionSolicitud: "Solicitud Cancelada",
    comercioActivo: true,
    condiciones: "Solo compras dentro de Talca",
    tipoPagoSolicitud: 1,
    representante_id: 1,
    pais_id: 1,
    ciudad_id: 2,
    tipocomercio_id: 1,
    calificacioncomercio_id: 1
    })

    Tienda.Repo.insert!(%Comercio{
      nombre: "Comercio3",
      email: "donjuan@ejemplo.Comercio",
      telefono: 7654321,
      calleDireccion: "1 sur",
      numeroDireccion: "677",
      fax: "7654321",
      urlSitio: "www.donjuan.cl",
      valorMinEntregaComida: 2,
      porcentajeDescuentoGeneral: 5,
      mensajeGeneral: "Bienvenido a Don Juan",
      mensajeDescuento: "Ahorro",
      visibleComercio: true,
      mensajeUsuarioSolicitud: "Solicitud Realizada",
      mensajeUsuarioCancelacionSolicitud: "Solicitud Cancelada",
      comercioActivo: true,
      condiciones: "Solo compras dentro de Talca",
      tipoPagoSolicitud: 1,
      representante_id: 1,
      pais_id: 1,
      ciudad_id: 1,
      tipocomercio_id: 1,
      calificacioncomercio_id: 1
      })



alias Tienda.Producto
Tienda.Repo.insert!(%Producto{
  nombre: "producto1",
  ingrediente: "ingredientes1",
  precioUnitario: 3000,
  activo: true,
  porcentajeDescuento: 0,
  mensajeDescuento: "mensaje1",
  comercio_id: 1
  })


Tienda.Repo.insert!(%Producto{
  nombre: "producto2",
  ingrediente: "ingredientes2",
  precioUnitario: 2300,
  activo: true,
  porcentajeDescuento: 0,
  mensajeDescuento: "mensaje2",
  comercio_id: 1
  })

Tienda.Repo.insert!(%Producto{
  nombre: "producto3",
  ingrediente: "ingredientes3",
  precioUnitario: 4500,
  activo: true,
  porcentajeDescuento: 0,
  mensajeDescuento: "mensaje3",
  comercio_id: 1
  })

Tienda.Repo.insert!(%Producto{
  nombre: "producto4",
  ingrediente: "ingredientes4",
  precioUnitario: 1700,
  #activo: true,
  porcentajeDescuento: 15,
  mensajeDescuento: "mensaje4",
  comercio_id: 1
  })

  Tienda.Repo.insert!(%Producto{
    nombre: "producto1",
    ingrediente: "ingredientes1",
    precioUnitario: 3000,
    activo: true,
    porcentajeDescuento: 0,
    mensajeDescuento: "mensaje1",
    comercio_id: 2
    })


  Tienda.Repo.insert!(%Producto{
    nombre: "producto2",
    ingrediente: "ingredientes2",
    precioUnitario: 2300,
    activo: true,
    porcentajeDescuento: 0,
    mensajeDescuento: "mensaje2",
    comercio_id: 2
    })

  Tienda.Repo.insert!(%Producto{
    nombre: "producto3",
    ingrediente: "ingredientes3",
    precioUnitario: 4500,
    activo: true,
    porcentajeDescuento: 0,
    mensajeDescuento: "mensaje3",
    comercio_id: 3
    })

  Tienda.Repo.insert!(%Producto{
    nombre: "producto4",
    ingrediente: "ingredientes4",
    precioUnitario: 1700,
    activo: true,
    porcentajeDescuento: 15,
    mensajeDescuento: "mensaje4",
    comercio_id: 2
    })
