# Grupo14

## Integrantes

| Nombre | Github | Email |
| :----- | :----- | :------- |
| SEBASTIÁN ANDRÉS CÁRDENAS | SebaCardenas | sacardenas@uc.cl |
| FELIPE IGNACIO MATUS | matusfelipe | fgmatus@uc.cl |
| LUKAS SVICAROVIC | lukassr | lsvicarovic@uc.cl |

## Product Owner
| Nombre | Github | Email |
| :----- | :----- | :------- |
| ISIDORA PALMA | @isipalma | impalma@uc.cl |

________________________

# Read me

Documento de especificaciones del alumno.

# Sprint N°1

El siguiente sprint, involucra la creación de una plataforma web
cuyo objetivo es desarrollar un servicio web de características 
similares a las de Netflix, pero orientado solamente a Series.

En esta primera etapa se definieron alcanzar los siguientes requerimientos para lograr un MVP "Minimum Variable Product":

-Registro-Login
-CRUD de Usuario
-CRUD de Series
-Vista de las Series mediante la interfaz
-Diferenciación de Roles de Usuarios

Para una mejor organización del equipo, se utilizaron 4 Branch en la plataforma Git (Master, Development, Login y MoviesCRUD) donde lás tres últimas se usaron para el desarrollo de las distintas actividades y La rama Master para tener el release de la aplicación. Además se utilizo la aplicación Trello (⁠⁠⁠⁠⁠https://trello.com/b/bBHzKzTx) para tener en tiempo real el desarrollo de las distintas tareas (Backlog, Priority, Development, Testing & Release). 

Para un mejor desarrollo de nuestra plataforma web, se utilizaron distintas Gemas además de las predeterminadas en rails:

*Simple_form
*Bootstrap-sass
*Country_select
*Devise
*CanCan
*MySQL
*Heroku

Los logros alcanzados fueron todos los propuestos al inicio del sprint incluyendo los tres bonus mencionado por nuestro product-owner. Se puede iniciar sesion y como usuario se puede hacer CRUD de la cuenta, además de tener la diferenciación entre guest, child & common. Se puede agregar series con distintos campos y hacer CRUD de estas. Existen algunas restricciones según tipo de usuario. Si es del tipo guest, no puede agregar series. También existe una vista principal en la interfaz, donde aparecen las series ya creadas.


