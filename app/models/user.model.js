module.exports = (sequelize, Sequelize) => {
    const User = sequelize.define("Users", {      
      UserId:{
        type:Sequelize.INTEGER,    
        allowNull:false,    
        primaryKey:true,    
        autoIncrement: true         
      },
      LoginId: {
            type: Sequelize.STRING
      },
      Password: {
        type: Sequelize.STRING
      },
      EmailAddress: {
        type: Sequelize.STRING
      },
      FirstName:{
          type:Sequelize.STRING
      },
      MiddleName:{
        type:Sequelize.STRING,
        allowNull:true,
      },
      LastName:{
        type:Sequelize.STRING
      },
      DisplayName:{
        type:Sequelize.STRING
      },
      Address1:{
        type:Sequelize.STRING
      },
      Address2:{
        type:Sequelize.STRING,
        allowNull:true,  
      },
      City:{
        type:Sequelize.STRING
      },
      PostalCode:{
        type:Sequelize.STRING
      },
      StateId:{
        type:Sequelize.INTEGER
      },
      CountryId:{
        type:Sequelize.INTEGER
      },
      IsActive:{
        type:Sequelize.INTEGER
      },
      ActiveFrom: {
        type: Sequelize.DATE,
        allowNull:true
      },
      PasswordChangeDate: {
        type: Sequelize.DATE,
        allowNull:true
      },
      UpdatedDate: {
        type: Sequelize.DATE,
        allowNull:true
      }

    },
    {
      // don't add the timestamp attributes (updatedAt, createdAt)
      timestamps: false,
    });
  
    return User;
  };