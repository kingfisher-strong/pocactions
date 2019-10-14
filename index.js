const http = require('http');
const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.end('Hello this is an update to master\n');
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});
