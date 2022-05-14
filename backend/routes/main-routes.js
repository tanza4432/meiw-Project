const express = require('express')
const {
  login,
  addAccount,
  getAllAccount,
  updateAccount,
  forgotpassword
} = require('../controllers/loginController')

const router = express.Router()

router.post('/login', login)
router.post('/login/register', addAccount)
router.get('/login/all', getAllAccount)
router.put('/login/:id', updateAccount)
router.post('/forgotpassword', forgotpassword)

module.exports = {
  routes: router
}
