module.exports = (sequelize, Sequelize) => {
  const UserSession=sequelize.define("UserSessions", {
    UserId: {
      type: Sequelize.INTEGER,
      allowNull:false,    
      primaryKey:true,
     // forienKey:true,
    },
    SessionId:{
        type: Sequelize.STRING,
        //defaultValue: DataTypes.UUIDV4,
        allowNull:false,    
        primaryKey:true,
    },
    LoginDateTime:{
        type: Sequelize.DATEONLY,
        allowNull: false,
        defaultValue:  sequelize.fn('GETDATE')
    },
    LastActiveDateTime:{
        type: Sequelize.DATEONLY,
        allowNull: false,
        defaultValue:  sequelize.fn('GETDATE')
    },
    LogoutDateTime:{
        type: Sequelize.DATEONLY
        //allowNull:true, 
    },
    SessionStatus:{
        type: Sequelize.INTEGER
    },
    IPAddress:{
        type: Sequelize.STRING,
        allowNull:false,
    },
    Browser:{
        type: Sequelize.STRING,
        allowNull:false,
    },
    OS:{
        type: Sequelize.STRING,
        allowNull:false,
    }

  });
  return UserSession;
};