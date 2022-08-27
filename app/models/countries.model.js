module.exports= (sequelize, Sequelize) => {
    const country=sequelize.define("Countries", {
        CountryId:{
            type: Sequelize.STRING,
            allowNull: false,
            primaryKey: true,
        },
        CountryName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        CountryAbbrName:{
            type: Sequelize.STRING
        },
        CurrencyId:{
            type: Sequelize.STRING,
            foreignKey : true,
        }
    });
    return country;
};