import express from 'express';
 
const app = express();
 
// body-parser는 내장되어있음.  json 파싱하기 위해서 설정만 추가
app.use(express.json());
 
// express에는 json 데이터를 파싱하는 모듈이 내장되어있다.
// 하지만 json만 되고 x-www-form-urlencoded를 파싱하기 위해서 아래를 확장해야 한다.
app.use(express.urlencoded({
  extended: true
}))

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