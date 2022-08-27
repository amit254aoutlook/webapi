module.exports = (sequelize, Sequelize) => {
    const UsersMerchantUserGroups=sequelize.define("UsersMerchantUserGroups", {
        UserId: {
            type: Sequelize.INTEGER,
            allowNull:false, 
            forienKey:true,
        },
        MerchantId: {
            type: Sequelize.INTEGER,
            allowNull:false, 
            forienKey:true,
        },
        UserGroupId: {
            type: Sequelize.INTEGER,
            allowNull:false,    
            forienKey:true            
        },       
        IsActive:{
            type:Sequelize.INTEGER,
            allowNull:false,
            defaultValue:1
        }
    });
    return UsersMerchantUserGroups;
};