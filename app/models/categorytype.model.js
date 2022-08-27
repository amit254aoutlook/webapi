module.exports= (sequelize, Sequelize) => {
    const categorytype=sequelize.define("CategoryType", {
        CategoryTypeId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CategoryType:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        IsActive:{
            type: Sequelize.BOOLEAN
        }
    });
    return categorytype;
};