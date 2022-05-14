'use strict'

const firebase = require('../db')
const Account = require('../models/login')
const firestore = firebase.firestore()
const nodemailer = require('nodemailer')
const dotenv = require('dotenv')
var md5 = require('md5')

dotenv.config()

const { EMAIL, PASSWORD } = process.env

const login = async (req, res, next) => {
  try {
    const email = req.body.email
    const password = md5(req.body.password)

    const account = firestore.collection('account')

    const db = await account.get()

    db.forEach(doc => {
      if (email === doc.data().email && password === doc.data().password) {
        const account = new Account(
          doc.id,
          doc.data().fullname,
          doc.data().email,
          doc.data().password
        )
        return res.status(200).send(account)
      }
    })
    if (!res.headersSent) {
      const temp = {
        token: '',
        fullname: '',
        email: '',
        password: ''
      }
      return res.status(404).send(temp)
    }
  } catch (error) {
    return res.status(400).send(error.message)
  }
}

const addAccount = async (req, res, next) => {
  try {
    const data = req.body
    const hashPassword = md5(data.password)
    const newdata = {
      fullname: data.fullname,
      email: data.email,
      password: hashPassword
    }

    await firestore
      .collection('account')
      .doc()
      .set(newdata)
    return res.status(200).send('เพิ่มบัญชีสำเร็จ')
  } catch (error) {
    res.status(400).send(error.message)
  }
}

const getAllAccount = async (req, res, next) => {
  try {
    const account = await firestore.collection('account')
    const data = await account.get()
    const AccountArray = []
    if (data.empty) {
      res.status(404).send('ไม่พบข้อมูลใด')
    } else {
      data.forEach(doc => {
        const account = new Account(
          doc.id,
          doc.data().fullname,
          doc.data().email,
          doc.data().password
        )
        AccountArray.push(account)
      })
      res.send(AccountArray)
    }
  } catch (error) {
    res.status(400).send(error.message)
  }
}

const updateAccount = async (req, res, next) => {
  try {
    const id = req.params.id
    const data = req.body
    const Account = await firestore.collection('account').doc(id)
    await Account.update(data)
    res.send('แก้ไขข้อมูลแล้ว')
  } catch (error) {
    res.status(400).send(error.message)
  }
}

const forgotpassword = async (req, res, next) => {
  try {
    var val = Math.floor(1000 + Math.random() * 9000)
    const data = req.body
    const date_ob = new Date()
    const date = ('0' + date_ob.getDate()).slice(-2)
    const month = ('0' + (date_ob.getMonth() + 1)).slice(-2)
    const year = date_ob.getFullYear()
    const hours = date_ob.getHours()
    const minutes = date_ob.getMinutes()
    const seconds = date_ob.getSeconds()

    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: EMAIL,
        pass: PASSWORD
      },
      tls: {
        rejectUnauthorized: false
      }
    })

    var FROM_ADDRESS = EMAIL

    function PageSendEmail (data) {
      const page_email =
        '<p><b>บัญชีของคุณได้มีการร้องขอรีเซ็ตรหัสผ่านโปรดตรวจสอบข้อมูลให้ถูกต้อง:</b></p>' +
        '<p>OTP : ' +
        data +
        '</b></p>'
      return page_email
    }

    let mailOptions = {
      from: 'Hospital <' + FROM_ADDRESS + '>',
      to: data.email,
      subject: 'ForgotPassword',
      html: PageSendEmail(val)
    }

    const verify = Buffer.from(
      year +
        '-' +
        month +
        '-' +
        date +
        ' ' +
        hours +
        ':' +
        minutes +
        ':' +
        seconds +
        ' ' +
        data.email +
        '/' +
        val
    ).toString('base64')

    if (!res.headersSent) {
      transporter.sendMail(mailOptions, function (err, success) {
        if (err) {
          console.log(err)
        } else {
          console.log('Emaill send Successfully')
        }
      })
      await firestore
        .collection('forgotpassword')
        .doc()
        .set({ verify })
      return res.status(200).send(val.toString())
    }
  } catch (error) {
    res.status(400).send(error.message)
  }
}

module.exports = {
  login,
  addAccount,
  getAllAccount,
  updateAccount,
  forgotpassword
}
