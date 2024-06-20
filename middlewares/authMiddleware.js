const admin = require('firebase-admin')
require('dotenv').config()

const serviceAccount = JSON.parse(
  Buffer.from(process.env.FIREBASE_SERVICE_ACCOUNT, 'base64').toString('ascii')
)

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
})

const authMiddleware = async (req, res, next) => {
  console.log('middleware')
  const token = req.headers.authorization?.split('Bearer ')[1]

  if (!token) return res.status(401).send('No token provided')

  try {
    const decodedToken = await admin.auth().verifyIdToken(token)
    console.log('decoded', decodedToken)
    req.user = decodedToken
    console.log('success')
    next()
  } catch (error) {
    res.status(403).json({ message: 'Invalid Token' })
  }
}

module.exports = authMiddleware
