module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('User', {
        userID: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true
        },
        email: {
            type: DataTypes.STRING,
            allownull: false
        },
        username: {
            type: DataTypes.STRING,
            allownull: false
        },
        hashPassword: {
            type: DataTypes.STRING,
            allownull: false
        },
        nome: {
            type: DataTypes.STRING,
            allownull: false
        },
        isAdmin: {
            type: DataTypes.BOOLEAN,
            allownull: false
        },
        dataNascimento:{
            type:DataTypes.STRING,
            allownull:false
        },
        localidade:{
            type:DataTypes.STRING,
            allownull:false
        },
        secretKey:{
            type:DataTypes.STRING,
        },
        active:{
            type:DataTypes.BOOLEAN
        }
    });

    // User.associate = (models) => {
    //     User.hasMany(models.Music, {
    //         foreignKey: 'userFK',
    //     });
    //     // User.hasMany(models.ListaRepro, {
    //     //     foreignKey: 'userFK',
    //     // });
    // };



    return User;
};