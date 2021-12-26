// app.get('/hello2', (req, res) => {
//     //get 메서드는 헤더가 필요함
//     const {name} = req.query;
//     res.send(`Hello ${name}`);
//   })
  
  
//   app.get('/hello3/:name', (req, res) => {
//     //get + uri 파라미터
//     const {name} = req.params;
//     res.send(`Hello ${name}`);
//   })
  
//   app.post('/hellopost1', (req, res)=> {
//     const name = req.body;
//     res.send(`Hello ${name}`);
//   })
   
//   app.post('/hellopost1', (req, res)=> {
//     const name = req.body;
//     res.send(`Hello ${name}`);
//   })
   
//   app.post('/hellopost1', (req, res)=> {
//     const name = req.body;
//     res.send(`Hello ${name}`);
//   })
   
//   // response - json 데이터 보내기
//   app.post('/hellopost2', (req, res) => {
//     const result = {
//       code: 0,
//       message: 'success'
//     };
//     res.send(result);
//     console.log(result)
//   })
   
  
//   // request - json 데이터 받기
//   app.post('/hellopost3', (req, res) => {
//     console.log(req.body);
//     const result = req.body;
//     res.send(result);  
//   })