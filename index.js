//var models = require('./components/models');

// var swaggerUi = require('swagger-ui-express')
// var swaggerDocument = require('./swagger/swagger.json');
var expressValidator = require('express-validator');

var express = require('express'),
    bodyParser = require('body-parser')

var cors = require('cors');
var user = require("./routes/user");
var data = require("./routes/data");

var app = express()

app.use(cors());
app.use(expressValidator());
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(user);
app.use(data);

// app.get('/user/teste2', function (req, res) {
//     console.log("/user request called");
//     res.send('Welcome to GeeksforGeeks');
// });

//app.use('/api/doc', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// app.use((req, res, next) => {
//     res.header("Access-Control-Allow-Origin", "*")
//     res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization, Accept-Version")
//     res.header("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS")
//     res.header("Access-Control-Allow-Credentials", true)
//     next();
// })
//app.use(expressSession({secret:'max',saveUninitialized:false,resave:false}));
//require('./Components/user/index')(app)



var port = process.env.PORT || 8000;
    app.listen(port, () => {
        console.log('\x1b[32m%s %d\x1b[0m.', 'Server HTTP listening on port', port)
    })

app.get('/', function (req, res) {
    res.sendFile(__dirname + '/public/index.html' )
})

module.exports = app;