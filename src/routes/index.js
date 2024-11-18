const express = require('express');
const router = express.Router();
const frutaController = require('../controllers/frutaController');

// Rutas de la API
router.get('/get_frutas', frutaController.getFrutas);
router.post('/create_fruta', frutaController.createFruta);
router.put('/update_fruta/:id_fruta', frutaController.updateFruta);
router.put('/delete_fruta/:id_fruta', frutaController.deleteFruta);

module.exports = router;