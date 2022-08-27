module.exports = (sequelize, Sequelize) => {
    const MerchantUserGroup=sequelize.define("MerchantUserGroups", {
        MerchantId: {
            type: Sequelize.INTEGER,
            allowNull:false, 
            forienKey:true,
        },
        UserGroupId: {
            type: Sequelize.INTEGER,
            allowNull:false,    
            primaryKey:true,
            autoIncrement: true
        },
        UserGroupName: {
            type: Sequelize.STRING,
            allowNull:false
        },
        IsActive:{
            type:Sequelize.INTEGER,
            allowNull:false,
            defaultValue:1
        }
    });
    return MerchantUserGroup;
};