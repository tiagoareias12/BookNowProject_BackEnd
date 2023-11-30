var Sequelize = require('sequelize')
  var sequelize = new Sequelize('database_localTI','root','root', {
      host: '127.0.0.1',
      dialect: 'mysql',
     timezone:"+01:00",
      //port:4000,
      define: {
          charset: 'utf8',
          collate: 'utf8_general_ci', 
        }
 })

const models = {
  User: sequelize.import('./user'),
  
};


Object.keys(models).forEach((modelName) => {
  if ('associate' in models[modelName]) {
    models[modelName].associate(models);
  }
});

models.sequelize = sequelize;
models.Sequelize = Sequelize;

module.exports = models;