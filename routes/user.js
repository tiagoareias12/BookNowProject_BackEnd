var express = require("express");
var router = express.Router();
var jwt = require('jsonwebtoken');
let pool = require('../db');
const { v4: uuidv4 } = require('uuid');
var randomstring = require('randomstring');
var bcrypt = require('bcryptjs');
const mailer = require('../misc/mailer');

router.get('/categories', () => {
    console.log("teste");
  });


router.post('/auth/login',(req, res, next) =>{
  (async function (){
    let serverResponse = { status: "Não Autenticado", response: {}, token: {} }
    var existsUserName;
    var username = req.body.username;
    let code = 200;
    //verficar se existe algum utilizador na base de dados com o  username inserido
    let existsUserNameQuery = await pool.query('SELECT * FROM "DB"."Users" where "Username" = $1', [username]);
    existsUserName = existsUserNameQuery.rows[0];
    console.log(typeof existsUserName);
    var hash = bcrypt.hashSync(req.body.password, 8);

    if (typeof existsUserName != "undefined"){
      console.log(existsUserName);
    if(existsUserName.Active == false){
      serverResponse.status = "A conta ainda não foi validada";
      res
      .json(serverResponse);
      return false;
    }

    console.log(hash);
    console.log(existsUserName.Password);

    //se não existir esse utilizador ou a password estiver errada
    if (!bcrypt.compareSync(req.body.password, existsUserName.Password)) {
        serverResponse.status = "Username ou password errados";

    }
    //se existir o utilizador e a password bater certo
    else {
        // create a token
        var token = jwt.sign({
            userID: existsUserName.userID, username: existsUserName.username,
            nome: existsUserName.nome, isAdmin: existsUserName.isAdmin
        }, 'secret', {
                expiresIn: 600 // expires in 10 minutos ***PARA TESTES****

            });
        serverResponse.status = "Autenticado";
        serverResponse.response = existsUserName;
        serverResponse.token = token;
    }
  }
  else{
    serverResponse.status = "Username ou password errados";
  }
    //resposta do servidor
    res
        .json(serverResponse);
  })()

  })

router.post('/user/create', (req, res, next) =>{
  (async function (){
    //resposta por defeito do servidor
    let serverResponse = { status: "Not Created", response: {} }
    //variável que recebe a query da base de dados sobre o email
    var existsEmail;
    //variável que recebe a query da base de dados sobre o username
    var existsUserName;
    
    try {
    
        //***Validação do Email***/
        //verificar se o campo email está vazio e se é realmente um email
        // req.checkBody('email', 'Email is required or is not valid').notEmpty().isEmail();

        // //***Validação do Username***/
        // req.checkBody('username', 'Username is required').notEmpty();

        // //***Validação do Nome***/
        // req.checkBody('nome', 'Nome is required').notEmpty();
        
        try{
          //verificar se o email inserido existe na base de dados
          let existsEmailQuery = await pool.query('SELECT * FROM "DB"."Users" where "Email" = $1', [req.body.email]);
          existsEmail = existsEmailQuery.rows[0];
          console.log('existsEmail');

          console.log(existsEmail);
          //verificar se o username inserido existe na base de dados
          let existsUserNameQuery = await pool.query('SELECT * FROM "DB"."Users" where "Username" = $1', [req.body.username]);
          existsUserName = existsUserNameQuery.rows[0];
          console.log(existsUserName);

        }
        catch(err){
          console.log(err);
        }
        //se o email existe
        if (existsEmail != null || existsUserName != null) {

            serverResponse = { status: "Email e/ou username já existe(m) na base de dados", response: {} }
            return res.send(serverResponse);
        }

        //verificar erros 
        var errors = req.validationErrors();
        //se existir erros de validação
        if (errors) {
            serverResponse = { status: "Erros na validação", response: errors }
            return res.send(serverResponse)
        }
        //caso contrário, cria o utilizador
        else {

                //gera um token
            const secret = randomstring.generate();

            var hash = bcrypt.hashSync(req.body.hashPassword, 8);
            var newUser = {
                userID: uuidv4(),
                email: req.body.email,
                username: req.body.username,
                nome: req.body.nome,
                hashPassword: hash,
                isAdmin: req.body.isAdmin,
                dataNascimento:req.body.dataNascimento,
                localidade:req.body.localidade,
                secretKey:secret,
                active:false
            }

            var createUser = 0;
            //criação de um novo user de acordo com os parâmetros recebidos

            let createUserInsert = await pool.query('INSERT INTO "DB"."Users" ("UserID", "Email", "Username", "Password", "Nome", "IsAdmin", "DataNascimento", "Localidade", "SecretKey", "Active") VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)', [uuidv4(), req.body.email,req.body.username, hash, req.body.nome,req.body.isAdmin, req.body.dataNascimento, req.body.localidade, secret, false])
            .then(novoUser =>{
              console.log("Novo User Criado");
              createUser = 1;
              return novoUser;
            })
            .catch(err => {
              console.log("Erro na Criação de um novo user", err);
            })

            // await usersService.createUser(newUser).then(user => createUser = user).catch(err => console.log(err));
            if (createUser != 0) {
              console.log("Enviado email de confirmação");
                //enviar email
                //conteúdo do email
                const html = `
                <html>
                <title>Confirmação de Conta</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                
                <style>
                .inicioContainer{
                    background-color:#e1e3e1;
                    background-repeat: no-repeat;
                    background-position: center center;
                    background-size: cover;
                    padding: 200px 50px;
                }
                .container{
                    background-color: white;
                    width: 60%;
                    height: 450px; 
                }
                .chave{
                font-weight:bold
                }
                </style>
                <body>
                
                <div class="inicioContainer">
                <center>
                <h1>Olá, seja muito bem vindo!!</h1>
                  <div class="container">
                  <p>
                    Muito obrigado por se inscrever no nosso site.
                  </p>
                  <hr/>
                  <span>Chave secreta:  </span><p class="chave">${secret}</p>
                  <br/>
                  <p>Por favor confirme a sua conta através do seguinte link. </p>
                  <div class="form-group" style={{width:"35%"}}>
                <a href="http://localhost:3000/register/confirm" class="w3-btn w3-black">Confirmar conta</a>   
                </div>
                  
                  </div>
                  </center>
                </div>
                
                </body>
                </html>
                `
                await mailer.sendEmail('Unknow@unknow.com',req.body.email,'Por favor verifique o seu email',html);
                serverResponse = { status: "Utilizador Criado com Sucesso. Por favor verifique o email", response: newUser };

            }
            return res.send(serverResponse);
        }
    }
    catch (err) {
        serverResponse = { status: "Criação de conta falhou. Email poderá não ter sido enviado", response: {} }
        console.log(err)
        return res.send(serverResponse);
    }
  })()

})

router.post('/user/create/verify', (req,res,next) => {
  (async function (){
    console.log("entrou");
    let serverResponse = { status: "Conta Não Verificada", response: {} }
    var userKey;
    
    try {
       
        //verificar se existe algum utilizador com a chave inserida
        let userKeyQuerie = await pool.query('SELECT * FROM "DB"."Users" where "SecretKey" = $1', [req.body.secretKey]);
        userKey = userKeyQuerie.rows[0];
        console.log(userKey);
        //se não existir
        if (userKey ==null) {
            serverResponse = { status: "Conta não existe, utilizador não existe", response: userKey }
        }
        //se existir
        else{
            //editar estes dados particulares dos users
            let userKeyUpdate = await pool.query('UPDATE "DB"."Users" SET "Active" = $1, "SecretKey" = $2 where "SecretKey" = $3', ['TRUE', '', req.body.secretKey]);
            serverResponse = { status: "Conta vericada com sucesso", response: userKey }

        }
        return res.send(serverResponse);
    } catch (err) {
      console.log(err);
        return res.status(500).send({ auth: false, message: 'Ocorreu um erro. Por favor tente novamente mais tarde' });
    }

  })()

})
module.exports = router;