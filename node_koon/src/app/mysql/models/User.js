'use strict';

import { Sequelize } from "sequelize/dist";

module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
    userid:{ 
        type: sequelize.STRING(20),
        primaryKey: true,
        allownull: false,
    },
    userpwd: {
        type: sequelize.STRING(20),
        allownull: false,
    }, 
    username:{
        type: sequelize.STRING(10),
        allownull: false,
    },
    email: {
        type: sequelize.STRING(30),
        allownull: false,
    },

    nickname: {
        type: sequelize.STRING(12),
        allownull: false,
    },

    birth: {
        type: sequelize.DATE,
        allwownull: false,
    },
    joindate: {
        type: sequelize.TIMESTAMP,
        defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
        // defaultValue: sequelize.literal('NOW()')
    },

  }, {});
  User.associate = function(models) {
    // associations can be defined here
  };
  return User;
};
