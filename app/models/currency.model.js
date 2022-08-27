module.exports= (sequelize, Sequelize) => {
    const currency=sequelize.define("Currencies", {
        CurrencyId:{
            type: Sequelize.STRING,
            allowNull: false,
            primaryKey: true, 
        },
        CurrencyName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        CurrencySymbol:{
            type: Sequelize.STRING
        },
        CurrencyFont:{
            type: Sequelize.STRING
        }
    });
    return currency;
};