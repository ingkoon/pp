import * as dotenv from 'dotenv';
dotenv.config();

export const config = {
    development : {
        username : process.env.DB_USERNAME || 'admin',
        password : process.env.DB_PASSWORD || 'cucumber52',
        database : process.env.DB_DBNAME || 'koon',
        host : process.env.DB_HOST || 'management.czchaiykemru.ap-northeast-2.rds.amazonaws.com',
        port : process.env.DB_PORT || 3306,
        dialect : "mysql"
    }
}