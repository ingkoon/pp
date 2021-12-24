import * as dotenv from "dotenv";
import express,{Request, Response, NextFunction}from 'express';
import cors from "cors";
import { sequelize } from './app/mysql/model';

dotenv.config();

const PORT: number = parseInt(process.env.PORT as string, 10) || 8080;
const HOST: string = process.env.HOST || 'localhost';
const app = express();


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