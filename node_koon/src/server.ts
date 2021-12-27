import * as dotenv from "dotenv";
import express,{Request, Response, NextFunction}from 'express';
import cors from "cors";
import { sequelize } from './app/mysql/model';
import {config} from '../src/app/mysql/config/config'

dotenv.config();

const PORT: number = parseInt(process.env.PORT as string, 10) || 8080;
const HOST: string = process.env.HOST || 'localhost';
const app = express();

const router = express.Router();
router.use('', require('func'));

let mysql: any = require("mysql");

let connection : any = mysql.createConnection({
  host: config.development.host,
  user: config.development.username,
  password: config.development.password,
  database: config.development.database,
  port: 3306,
})




//cors(Cross-Origin Resource Sharing) 사용 - 다른 포트의 리소스 사용요청 용도로 사용
app.use(cors());
// body-parser는 내장되어있음.  json 파싱하기 위해서 설정만 추가
app.use(express.json());
 
app.use((req:Request,res:Response,next:NextFunction) => {
  console.log(`Request Occur! ${req.method}, ${req.url}`);
  next();
})


// express에는 json 데이터를 파싱하는 모듈이 내장되어있다.
// 하지만 json만 되고 x-www-form-urlencoded를 파싱하기 위해서 아래를 확장해야 한다.
app.use(express.urlencoded({
  extended: true
}))


app.listen(PORT, HOST, async() => {
  console.log('Server is listening 8080');

   // //sequelize-db 연결 테스트
   await sequelize.authenticate()
   .then(async () => {
       console.log("connection success");
       
   })
   .catch((e) => {
       console.log('TT : ', e);
   })
});

connection.connect(function(err) {
  if (err) {
    throw err; // 접속에 실패하면 에러를 throw 합니다.
  } else {
    // 접속시 쿼리를 보냅니다.
    connection.query("SHOW tables", function(err, rows, fields) {
      console.log(err)
      console.log(rows); // 결과를 출력합니다!
    });
  }
});

