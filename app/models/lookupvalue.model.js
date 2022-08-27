module.exports= (sequelize, Sequelize) => {
    const LookupValue=sequelize.define("LookupValues", {
        LookupGroupId:{
            type: Sequelize.INTEGER,
            allowNull: false,
            foreignKey: true,
        },
        LookupDataValue:{
            type: Sequelize.STRING,
            allowNull: false,
        }, 
        LookupDisplay:{
            type: Sequelize.STRING,
            allowNull: false,
            primaryKey: true,
        },              
        IsActive:{
            type: Sequelize.INTEGER
        }
       
    });
    return LookupValue;
};