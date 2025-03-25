'use strict'

const path = require('path')
const execFile = require('child_process').execFile

exports.getSecurityScopedBookmark = async (filePath) => {
  // const encodedPath = encodeURIComponent(filePath)
  return new Promise((resolve, reject) => {
    execFile(path.join(__dirname, 'main'), [filePath], (error, stdout) => {
      if (error) {
        if (error.code === 1) {
          // The file does not exist
          return reject(new Error('File does not exist'))
        } else if (error.code === 2) {
          return reject(new Error('Failed to get security scoped bookmark'))
        }
      } else {
        resolve(stdout.trim())
      }
    })
  })
}
