module.exports= (sequelize, Sequelize) => {
    const categoryproduct=sequelize.define("CategoryProducts", {
        CategoryId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        ProductId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
        },        
        IsActive:{
            type: Sequelize.INTEGER
        }
    });
    return categoryproduct;
};