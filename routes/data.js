var express = require("express");
var router = express.Router();
var jwt = require('jsonwebtoken');
let pool = require('../db');
const { v4: uuidv4 } = require('uuid');
var randomstring = require('randomstring');
var bcrypt = require('bcryptjs');
const mailer = require('../misc/mailer');

router.get('/data/distritos', (req, res, next) => {
    (async function (){

    console.log("entrou");
    let serverResponse = { status: "", response: {} }

    try{
        //verificar se existe algum utilizador com a chave inserida
        var distrito;
        let distritoQuerie = await pool.query('SELECT * FROM "DB".Distrito');
        console.log(distritoQuerie);
        distrito = distritoQuerie.rows;
        console.log(distrito);
        serverResponse = { status: "OK", response: distrito }
        return res.send(serverResponse);

    }catch(err){
        console.log(err);
        return res.status(500).send({ auth: false, message: 'Ocorreu um erro. Por favor tente novamente mais tarde' });
    }
})()
  });

  router.post('/data/concelhos', (req, res, next) => {
    (async function (){

    let serverResponse = { status: "", response: {} }

    try{
        //verificar se existe algum utilizador com a chave inserida
        var concelho;
        let concelhoQuerie = await pool.query('SELECT * FROM "DB".Concelho where DISTRITO_RAUT = $1', [req.body.distrito]);
        concelho = concelhoQuerie.rows;
        serverResponse = { status: "OK", response: concelho }
        return res.send(serverResponse);

    }catch(err){
        console.log(err);
        return res.status(500).send({ auth: false, message: 'Ocorreu um erro. Por favor tente novamente mais tarde' });
    }
})()
  });





module.exports = router;