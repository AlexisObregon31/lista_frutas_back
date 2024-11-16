const express = require('express');
const app = express();
const cors = require('cors');
const routes = require('./routes');

var port = process.env.PORT || 3000;


app.use(cors());
app.use(express.json());

app.use('/api', routes);

app.get('/', function (req, res) {
    res.status(200).send({
        message: '/Servicios de la API en ejecución !'
    });
});



app.listen(port, function () {
    console.log(`Servidor corriendo en http://localhost:${port}`);

});