const { getSecurityScopedBookmark } = require('./index.js')

const filePath = '/Users/username/Documents/test.txt'

getSecurityScopedBookmark(filePath)
  .then((bookmark) => {
    console.log('Security Scoped Bookmark:', bookmark)
  })
  .catch((error) => {
    console.error('Error:', error)
  })
