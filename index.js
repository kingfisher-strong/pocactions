const http = require('http');
const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.end('Hello github actions this is off develop branch\n');
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});
