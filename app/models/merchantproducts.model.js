module.exports= (sequelize, Sequelize) => {
    const merchantproducts=sequelize.define("MerchantProducts", {
        MerchantId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        ProductId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        CPDHours:{
            type: Sequelize.FLOAT
        },        
        IsActive:{
            type: Sequelize.INTEGER
        },
        ActiveFrom:{
            type: Sequelize.DATE
        },
        ActiveTo:{
            type: Sequelize.DATE,
            allowNull: true,
        }
    });
    return merchantproducts;
};