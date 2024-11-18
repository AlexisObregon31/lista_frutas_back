const poolConnection = require("../config/connection/postgres/db_frutas.js");

//Listar Frutas

exports.getFrutas = async (req, res) => {
  console.log(`Listando Frutas`);
  let datos, statusCode, message;
  try {
    let connection = await poolConnection.poolDb();

    await connection
      .query(`select * from frutas where deleted_date is null`, {
        type: connection.QueryTypes.SELECT
      })
      .then((frutas) => {
        datos = frutas;
        statusCode = 200;
      });
  } catch (error) {
    console.log("Error al obtener el listado de frutas: \n" + error);
    statusCode = 500;
    message = error;
  }

  if (datos) res.status(statusCode).json(datos);
  else res.status(statusCode).json(message);
};

//Crear Fruta

exports.createFruta = async (req, res) => {
  let statusCode, message, frutaInsertada;

  try {
    console.log(`Creando nueva fruta`);
    let nombre = req.body.nombre;

    let frutaInsertada;
    let connection = await poolConnection.poolDb();

    await connection
      .query(
        `insert into frutas (nombre) values ('${nombre}') RETURNING id_fruta`,
        { type: connection.QueryTypes.INSERT }
      )
      .then(async (retorno) => {
        await connection
          .query(
            `select * from frutas where id_fruta=${retorno[0][0].id_fruta}`,
            { type: connection.QueryTypes.SELECT }
          )
          .then((fruta) => {
            frutaInsertada = fruta;
          });
        statusCode = 201;
      });
    res.status(statusCode).json(frutaInsertada);
  } catch (error) {
    console.log("Error al insertar la fruta: \n " + error);
    statusCode = 500;
    message = error;
  }

  try {
    if (message) res.status(statusCode).json(message);
  } catch (error) {
    console.log("Error interno \n", error);
  }
};

//Modificar Fruta

exports.updateFruta = async (req, res) => {
  let statusCode, message;
  const id_fruta = req.params.id_fruta;
  let nombre = req.body.nombre;

  try {
    console.log(`Actualizando fruta con id: ${id_fruta}`);

    let connection = await poolConnection.poolDb();

    await connection
      .query(
        `update frutas set nombre = '${nombre}', updated_date=current_timestamp where id_fruta = ${id_fruta}`,
        { type: connection.QueryTypes.UPDATE }
      )
      .then((retorno) => {
        statusCode = 202;
        message = "Fruta actualizada con éxito";
      });
  } catch (error) {
    console.log(`Error al actualizar la fruta con id: ${id_fruta} : ${error}`);
    statusCode = 500;
    message = error;
  }

  res.status(statusCode).json(message);
};

//Inactivar Fruta

exports.deleteFruta = async (req, res) => {
  let statusCode, message;
  const id_fruta = req.params.id_fruta;
  let nombre = req.body.nombre;

  try {
    console.log(`Eliminando fruta con id: ${id_fruta}`);

    let connection = await poolConnection.poolDb();

    await connection
      .query(
        `update frutas set deleted_date = current_timestamp  where id_fruta = ${id_fruta}`,
        { type: connection.QueryTypes.UPDATE }
      )
      .then((retorno) => {
        statusCode = 202;
        message = "Fruta eliminada con éxito";
      });
  } catch (error) {
    console.log(`Error al eliminar la fruta con id: ${id_fruta} : ${error}`);
    statusCode = 500;
    message = error;
  }

  res.status(statusCode).json(message);
};
