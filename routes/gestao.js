var express = require("express");
var router = express.Router();
var jwt = require('jsonwebtoken');
let pool = require('../db');
const { v4: uuidv4 } = require('uuid');
var randomstring = require('randomstring');
var bcrypt = require('bcryptjs');
const mailer = require('../misc/mailer');

  router.post('/gestao/novoSistema', (req, res, next) => {
    (async function (){

    let serverResponse = { status: "", response: {} }
    let createSistema = 0;
    try{
        let createSistemaInsert = await pool.query('INSERT INTO "DB".sistemareserva("ID", "Distrito", "Concelho", "NomeSistema", "Preco", "Mesas", "Campos", "TipoSistema") VALUES ($1, $2, $3, $4, $5, $6, $7, $8)',[uuidv4(),req.body.distrito, req.body.concelho, req.body.nome, req.body.preco, req.body.mesas,req.body.numeroCampos,req.body.tipoReserva])
        .then(createNovoSistema =>{
          console.log("Novo Sistema Criado");
          createSistema = 1;
          serverResponse = { status: "OK", response: createNovoSistema }
          return res.send(serverResponse);
          })
        .catch(err => {
          console.log("Erro na Criação de um novo sistema", err);
        })


    }catch(err){
        console.log(err);
        return res.status(500).send({ auth: false, message: 'Ocorreu um erro. Por favor tente novamente mais tarde' });
    }
})()
  });

  router.post('/gestao/getSistema', (req, res, next) => {
    (async function (){
        console.log("entrou");
        console.log(req.body);
    let serverResponse = { status: "", response: {} }
    let getSistema;
    let sistemaRows;
    try{
        let createSistemaInsert = await pool.query('SELECT * FROM "DB".sistemaReserva where "Distrito" = $1 and "Concelho" = $2',[req.body.distrito, req.body.concelho]);
        getSistema = createSistemaInsert.rowCount;
        if(getSistema == 0){
            serverResponse = { status: "No data", response: {} }
            return res.send(serverResponse);
        }
        else{
            sistemaRows = createSistemaInsert.rows;
            serverResponse = { status: "OK", response: {sistemaRows} }
            return res.send(serverResponse);
        }
        


    }catch(err){
        console.log(err);
        return res.status(500).send({ auth: false, message: 'Ocorreu um erro. Por favor tente novamente mais tarde' });
    }
})()
  });



module.exports = router;