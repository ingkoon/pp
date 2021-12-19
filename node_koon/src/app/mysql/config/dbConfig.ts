const mysql = require("mysql");


const dbConfig = {
    host: "management.czchaiykemru.ap-northeast-2.rds.amazonaws.com",
  user:"admin",
  password: "cucumber52",
  database: "koon",
  port: 3306,
}

module.exports = mysql.createPool(dbConfig)