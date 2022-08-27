module.exports = (sequelize, Sequelize) => {
    const Role = sequelize.define("Roles", {
      RoleId: {
        type: Sequelize.INTEGER,
        primaryKey: true
      },
      RoleName: {
        type: Sequelize.STRING
      },
      CreatedDate: {
        type: Sequelize.DATE,
        allowNull:true
      },
      UpdatedDate: {
        type: Sequelize.DATE,
        allowNull:true
      }
    },{
      // don't add the timestamp attributes (updatedAt, createdAt)
      timestamps: false,
    });
  
    return Role;
  };