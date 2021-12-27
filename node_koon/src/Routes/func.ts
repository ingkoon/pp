const express = require('express');
const router = express.Router({mergeParams: true})
/**
const au = require('../app/mysql/modules/utils/authUtils');
const rm = require('../app/mysql/modules/utils/responseMessage');
const sc = require('../app/mysql/modules/utils/statusCode');
const pool = require('../app/mysql/modules/db/pool');
 */

const Users = require('../app/mysql/model/Users');

router.post('/', async (req, res) => {
    const {userId} = req.body;

    // TODO 1: userId 값 확인하기
    if (!userId) res.status(sc.BAD_REQUEST).send(au.successFalse(rm.NULL_VALUE));

    // TODO 2: 작성하기
    try {
        const {code, json} = await Users.insert(userId);
        res.status(code).send(json);
    } catch (err) {
        console.log(err);
        res.status(sc.INTERNAL_SERVER_ERROR).send(au.successFalse(rm.BOARD_CREATE_FAIL));
    }
});

// READ_ALL
router.get('/', async (req, res) => {
    // TODO 1: 읽어오기
    try {
        const {code, json} = await Users.selectAll();
        res.status(code).send(json);
        
    } catch (err) {
        console.log(err);
        res.status(sc.INTERNAL_SERVER_ERROR).send(au.successFalse(rm.BOARD_READ_ALL_FAIL));
    }
});

// READ_ONE
router.get('/:userId', async (req, res) => {
    const userId = req.params.userId;

    // TODO 1: blogIdx 값 확인하기
    if (!userId) res.status(sc.BAD_REQUEST).send(au.successFalse(rm.NULL_VALUE));

    // TODO 2: 읽어오기
    try {
        const {code, json} = await Users.selectOne(userId);
        res.status(code).send(json);
    } catch (err) {
        console.log(err);
        res.status(sc.INTERNAL_SERVER_ERROR).send(au.successFalse(rm.BOARD_READ_ALL_FAIL));
    }
});

// UPDATE
router.put('/:userId', async (req, res) => {
    const {userId} = req.params;
    const {userName} = req.body;

    // TODO 1: blogIdx, blogName 값 확인하기
    if (!userName || !userId) res.status(sc.BAD_REQUEST).send(au.successFalse(rm.NULL_VALUE));
    
    // TODO 2: 수정하기
    try {
        const {code, json} = await Users.update(userId, userName);
        res.status(code).send(json);
    } catch (err) {
        console.log(err);
        res.status(sc.INTERNAL_SERVER_ERROR).send(au.successFalse(rm.BOARD_UPDATE_FAIL));
    }
});

// DELETE
router.delete('/:userId', async (req, res) => {
    const {userId} = req.params;

    // TODO 1: blogIdx 값 확인하기
    if (!userId) res.status(sc.BAD_REQUEST).send(au.successFalse(rm.NULL_VALUE));

    // TODO 2: 삭제하기
    try {
        const {code, json} = await Users.delete(userId);
        res.status(code).send(json);
    } catch (err) {
        console.log(err);
        res.status(sc.INTERNAL_SERVER_ERROR).send(au.successFalse(rm.BOARD_DELETE_FAIL));
    }
});

module.exports = router;