module.exports= (sequelize, Sequelize) => {
    const company=sequelize.define("Companies", {
        CompanyId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        CompanyName:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        IsActive:{
            type: Sequelize.INTEGER
        }
    });
    return company;
};