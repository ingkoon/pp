import express from 'express';
 
const app = express();

const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "management.czchaiykemru.ap-northeast-2.rds.amazonaws.com",
  user:"admin",
  password: "cucumber52",
  database: "koon",
  port: 3306,
})
connection.connect(function(err) {
  if (err) {
    console.log('error appeared!');
    throw err;
     // 접속에 실패하면 에러를 throw 합니다.
  } else {
    // 접속시 쿼리를 보냅니다.
    connection.query("SELECT * FROM USER", function(err, rows, fields) {
      console.log(err)
      console.log(rows);
      //connection.end(); // 결과를 출력합니다!
    });
  }
});
// connection.end();

// body-parser는 내장되어있음.  json 파싱하기 위해서 설정만 추가
app.use(express.json());
 

// express에는 json 데이터를 파싱하는 모듈이 내장되어있다.
// 하지만 json만 되고 x-www-form-urlencoded를 파싱하기 위해서 아래를 확장해야 한다.
app.use(express.urlencoded({
  extended: true
}))

app.get('/1', (req, res) => {
  connection.query("SELECT * FROM USER", function(err, rows, fields) {
    //res.end(err)
    res.end(rows);
    // connection.end(); // 결과를 출력합니다!
  });
})

app.get('/hello2', (req, res) => {
  //get 메서드는 헤더가 필요함
  const {name} = req.query;
  res.send(`Hello ${name}`);
})


app.get('/hello3/:name', (req, res) => {
  //get + uri 파라미터
  const {name} = req.params;
  res.send(`Hello ${name}`);
})

app.post('/hellopost1', (req, res)=> {
  const name = req.body;
  res.send(`Hello ${name}`);
})
 
app.post('/hellopost1', (req, res)=> {
  const name = req.body;
  res.send(`Hello ${name}`);
})
 
app.post('/hellopost1', (req, res)=> {
  const name = req.body;
  res.send(`Hello ${name}`);
})
 
// response - json 데이터 보내기
app.post('/hellopost2', (req, res) => {
  const result = {
    code: 0,
    message: 'success'
  };
  res.send(result);
  console.log(result)
})
 

// request - json 데이터 받기
app.post('/hellopost3', (req, res) => {
  console.log(req.body);
  const result = req.body;
  res.send(result);  
})

app.listen(8080, () => {
  console.log('server is listening 8080');
});