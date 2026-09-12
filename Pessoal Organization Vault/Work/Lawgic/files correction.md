```js

const express = require("express")
const routes = express.Router()
const routesAuth = express.Router()
const FilesController = require("../controllers/files.controller")
const { authMiddlewareNew } = require("../helper")
const multer = require("multer")
const multerS3 = require('multer-s3')
const { S3Client } = require('@aws-sdk/client-s3')
const { NodeHttpHandler } = require('@smithy/node-http-handler')
const https = require('https')

const s3 = new S3Client({
  region: process.env["AWS_REGION"],
  credentials: {
    accessKeyId: process.env['AWS_ACCESS_KEY_ID'],
    secretAccessKey: process.env['AWS_SECRET_ACCESS_KEY']
  },
  requestHandler: new NodeHttpHandler({
    connectionTimeout: 5000,
    requestTimeout: 120000,
    httpsAgent: new https.Agent({ keepAlive: false }),
  }),
});

const uploadV2 = multer({
  storage: multerS3({
    s3: s3,
    bucket: process.env["S3_BUCKET"],
    contentType: (_req, file, cb) => cb(null, file.mimetype || 'application/octet-stream'),
    key: function (req, file, cb) {
      if (file.originalname.endsWith('.exe')) return cb(new Error('Formato .exe não aceito'))

      const secureId = FilesController.generateSecureIdFileName(file)
      const lastDotIndex = file.originalname.lastIndexOf(".");
      const fileName = file.originalname.substring(0, lastDotIndex);
      const fileExtension = file.originalname.substring(lastDotIndex + 1)
      const updatedFileName = `${fileName}-${secureId}.${fileExtension}`
      file.zeRoberto = updatedFileName
      cb(null, `${req.session.groupId}/${req.params.processNumber}/${updatedFileName}`)
    },
  }),
  limits: {
    fileSize: 100 * 1024 * 1024,
    files: 10
  },
})

// ROUTES
routes.get("/init", async (req, res) => {return res.send({ status: 200, message: "Welcome to lexxy-files api" })})


let upload = multer({ limits: { fileSize: 100 * 1024 * 1024 } });

routesAuth.use(authMiddlewareNew);
routesAuth.post('/upload/v2/:processNumber', uploadV2.array('files', 20), FilesController.uploadV2)
routesAuth.post("/upload", upload.array("files"), FilesController.upload);
routesAuth.post("/upload/task/",upload.array("files"), FilesController.uploadTaskAttach);
routesAuth.post("/downloadMultiple", FilesController.zipFiles);
routesAuth.post("/downloadSingle", FilesController.singleDownloadV2);
routesAuth.post("/upload64", FilesController.upload64);
routesAuth.post("/delete", FilesController.delete);
routesAuth.post("/largeFile", FilesController.largeFile)
routesAuth.get("/getAttachmentInfo/:attachmentId", FilesController.getAttachmentInfo)

module.exports = { routes, routesAuth }


```
