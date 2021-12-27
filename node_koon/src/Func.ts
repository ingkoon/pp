const au = require('../src/app/mysql/modules/utils/authUtils');
const rm = require('../src/app/mysql/modules/utils/responseMessage');
const sc = require('../src/app/mysql/modules/utils/statusCode');
const pool = require('../src/app/mysql/modules/db/pool');

// global variable	
const table = 'Users';

// exports
module.exports = {
    insert: async (userId) => {
        const fields = 'userid';
        const questions = `'${userId}'`;
        const query = `INSERT INTO ${table} (${fields}) VALUES(${questions})`;
        const result = await pool.queryParam_None(query); //=> 이부분 동작이 비동기로 구현되어 있어서 async사용
        
        // running
        if (!result) {
            return {
                code: sc.BAD_REQUEST,
                json: au.successFalse(rm.BOARD_CREATE_FAIL)
            };
        }
        return {
            code: sc.OK,
            json: au.successTrue(rm.BOARD_CREATE_SUCCESS, result)
        };
    },
    selectOne: async (userIdx) => {
        const query = `SELECT * FROM ${table} WHERE id = '${userIdx}'`;
        const result = await pool.queryParam_None(query);

        if (!result) {
            return {
                code: sc.BAD_REQUEST,
                json: au.successFalse(rm.BOARD_READ_FAIL)
            };
        }
        return {
            code: sc.OK,
            json: au.successTrue(rm.BOARD_READ_SUCCESS, result)
        };
    },
    selectAll: async () => {
        const query = `SELECT * FROM ${table}`;
        const result = await pool.queryParam_None(query);

        // running
        if (!result) {
            return {
                code: sc.BAD_REQUEST,
                json: au.successFalse(rm.BOARD_READ_ALL_FAIL)
            };
        }
        return {
            code: sc.OK,
            json: au.successTrue(rm.BOARD_READ_ALL_SUCCESS, result)
        };
    },

    update: async (userIdx, userId) => {
        const query = `UPDATE ${table} SET userid = '${userId}' WHERE id = ${userIdx}`;
        const result = await pool.queryParam_None(query);

        // running
        if (!result) {
            return {
                code: sc.BAD_REQUEST,
                json: au.successFalse(rm.BOARD_UPDATE_FAIL)
            };
        }
        return {
            code: sc.OK,
            json: au.successTrue(rm.BOARD_UPDATE_SUCCESS, result)
        };
    },
    delete: async (userIdx) => {
        const query = `DELETE FROM ${table} WHERE id = ${userIdx}`;
        const result = await pool.queryParam_None(query);

        // running
        if (!result) {
            return {
                code: sc.BAD_REQUEST,
                json: au.successFalse(rm.BOARD_DELETE_FAIL)
            };
        }
        return {
            code: sc.OK,
            json: au.successTrue(rm.BOARD_DELETE_SUCCESS, result)
        };
    }
}

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