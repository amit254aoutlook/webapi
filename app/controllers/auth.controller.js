const randomstring = require("randomstring");
const db = require("../models");
const config = require("../config/auth.config");
const commonfunc=require("../common/common.js");
const User = db.User;
const Role = db.Role;
const UserSession=db.UserSession;
const MerchantUserGroup=db.MerchantUserGroup;

const Op = db.Sequelize.Op;

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");
const { sequelize } = require("../models");
//const { Roles } = require("../models");

exports.signup = (req, res) => {
  // Save User to Database
  User.create({
    //UserId:0,
    LoginId: req.body.LoginId,
    Password: bcrypt.hashSync(req.body.Password, 8),
    EmailAddress: req.body.EmailAddress,
    FirstName:req.body.FirstName,
    MiddleName:req.body.MiddleName,
    LastName: req.body.LastName,
    DisplayName:req.body.FirstName +" "+req.body.LastName,
    Address1:req.body.Address1,
    Address2:req.body.Address2,
    City:req.body.City,
    PostalCode:req.body.PostalCode,
    StateId:req.body.StateId,
    CountryId:req.body.CountryId,
    IsActive:req.body.IsActive
  })
    .then(user => {
      if(req.body.usergroup)
      {
         MerchantUserGroup.findAll({
           where:{
            UserGroupName: {
              [Op.or]: req.body.usergroup
            }
           }
         }).then(usergroupnames=>{
            UsersMerchantUserGroups.create({
                UserId:user.UserId,
                MerchantId:usergroupnames.MerchantId,
                UserGroupId:usergroupnames.UserGroupId,
                IsActive:1
            })
            .then(usermerchantusergroup => {
                       
            });
         });   
      };
      if (req.body.roles) {  
        //console.log(JSON.stringify(req.body.roles))      
        Role.findAll({
          where: {
           RoleName: {
              [Op.or]: req.body.roles
            }
          }
        }).then(roles => {
          user.setRoles(roles).then(() => {
            res.send({ message: "User was registered successfully!" });
          });
        });
      } else {
        // user role = 1
        user.setRoles([1]).then(() => {
          res.send({ message: "User was registered successfully!" });
        });
      };

     
    })
    .catch(err => {
      res.status(500).send({ message: err.message });
    });
};

exports.signin = (req, res) => {
  //res.setHeader('Access-Control-Allow-Origin', 'http://localhost:4200');
  //console.log(req.cookies.user_sid)
  User.findOne({
    where: {
      LoginId: req.body.LoginId
    }
  })
    .then(user => {
      
      if (!user) {
        return res.status(404).send({ message: "User Not found." });
      }

      var passwordIsValid = bcrypt.compareSync(
        req.body.Password,
        user.Password
      );

      if (!passwordIsValid) {
        return res.status(401).send({
          accessToken: null,
          message: "Invalid Password!"
        });
      }

      var token = jwt.sign({ id: user.UserId }, config.secret, {
        expiresIn: 86400 // 24 hours
      });
      req.session.user_sid = randomstring.generate({ charset: 'alphanumeric'});
      //console.log(req.session.user);
      UserSession.create({
        UserId: user.UserId,
        SessionId: req.session.user_sid,
        //LoginDateTime: sequelize.fn('GETDATE'),
       // LastActiveDateTime: sequelize.fn('GETDATE'),
       // LogoutDateTime: "",
        SessionStatus: 1,
        IPAddress: "127.0.0.1",
        Browser: "Postman",
        OS: "Windows"
      }).then(usersession=>{
        if (!usersession) {
          return res.status(404).send({ message: "User session Not created." });
        }
      }).catch(err => {
        res.status(500).send({ sessionmessage: err.message });
      });

      var authorities = [];
      user.getRoles().then(roles => {
        for (let i = 0; i < roles.length; i++) {
          authorities.push("ROLE_" + roles[i].RoleName.toUpperCase());
        }  
        res.status(200).send({          
          id: user.UserId,
          loginId: user.LoginId,
          firstname: user.FirstName,
          lastname : user.LastName,
          email: user.EmailAddress,
          roles: authorities,
          accessToken: token
        });
      });
    })
    .catch(err => {
      res.status(500).send({ message: err.message });
    });
};

exports.GetUser=(req,res)=>{
  const firstname=req.query.firstname ? req.query.firstname : '';
  const lastname= req.query.lastname?req.query.lastname:'';
  const loginid=req.query.loginid?req.query.loginid:'';
  //alert(parseInt(req.query.page))
  const page = parseInt(req.query.page) || 0;

   // get pager object for specified page
  const size = parseInt(req.query.size) || 5;
  const { limit, offset } = commonfunc.getPagination(page, size);
  User.findAndCountAll({ 
    include:[
        {
          model:Role          
        },
        {
          model:MerchantUserGroup
        }
    ],  
    limit,
    offset,    
    where:{
        
        LoginId:{ [Op.like]: `%${loginid}%` },
        FirstName: { [Op.like]: `%${firstname}%` } , 
        LastName:{[Op.like]: `%${lastname}%`}           
        //IsActive:true
    }
  })
  .then(user=>{ 
    
    const response = commonfunc.getPagingData(user, page, limit);              
    res.status(200).send(response);        
  })
  .catch(err => {
      res.status(500).send({ message: err.message });
  });
};

exports.userbyuserId = async (req, res) => {
  await User.findOne({
    include:[{
      model:Role
    },{
      model:MerchantUserGroup
    }     
    ],
    where: {
      UserId: req.params.userid
    }
  }).then(user => {
     res.status(200).send(user);
  })
  .catch(err => {
    res.status(500).send({ message: err.message });
  });
}

function getMerchantUserGroupConditions(req) {
  MerchantUserGroupConditions = {};
  console.log(req.query.MerchantId)
  if (req.query.MerchantId!=0) {
    MerchantUserGroupConditions.MerchantId = {
      [Op.eq]: req.query.MerchantId
    }
  }
  MerchantUserGroupConditions.IsActive={[Op.eq]:true}
  return MerchantUserGroupConditions;
}

exports.GetMerchantUserGroup=(req,res)=>{
  MerchantUserGroup.findAll({
    where:getMerchantUserGroupConditions(req)
  })
  .then(merchantusergroup=>{ 
              
    res.status(200).send(merchantusergroup);        
  })
  .catch(err => {
      res.status(500).send({ message: err.message });
  });
};

exports.GetRole=(req,res)=>{
  Role.findAll({
    where:{      
      IsActive:true
    }
  })
  .then(role=>{               
    res.status(200).send(role);        
  })
  .catch(err => {
      res.status(500).send({ message: err.message });
  });
};

exports.GetUserLoginId=(req,res)=>{
  User.findOne({
    where:{
      LoginId:req.params.LoginId
    }
  })
  .then(user=>{             
    res.status(200).send(user);        
  })
  .catch(err => {
      res.status(500).send({ message: err.message });
  });
}