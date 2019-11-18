const http = require('http');
const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.end('Hello , finally ci/cd is working github actions ==> GCR ==> GKE , Image pull policy to always\n');
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});
