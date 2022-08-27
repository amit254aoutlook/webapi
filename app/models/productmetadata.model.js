module.exports= (sequelize, Sequelize) => {
    const ProductMetaData=sequelize.define("ProductMetaData", {
        ProductId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        MetaId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        MetaValue:{
            type: Sequelize.STRING,
            allowNull: false,
        }
        
    })
    return ProductMetaData;
}