import express, {Request, Response} from 'express';
const app = express()
let mysql: any = require('mysql');



app.get('/test',(req: Request, res: Response) =>{
    res.send('welcome');
})


 app.get('/hello2', (req, res) => {
     //get 메서드는 헤더가 필요함
     const {name} = req.query;
     res.send(`Hello ${name}`);
   })

app.listen('8080', () => {
    console.log('test is success');
});