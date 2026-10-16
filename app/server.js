// Simple web app for the DevOps lab
const http = require('http');

const student = {
  name: process.env.STUDENT_NAME || 'Unknown',
  surname: process.env.STUDENT_SURNAME || 'Unknown',
  group: process.env.STUDENT_GROUP || 'Unknown',
  id: process.env.STUDENT_ID || 'Unknown',
};
const port = process.env.PORT || 3000;

function info() {
  return [
    '================================',
    'DevOps Student Application',
    '================================',
    '',
    `Name: ${student.name}`,
    `Surname: ${student.surname}`,
    `Group: ${student.group}`,
    `Student ID: ${student.id}`,
    '',
    'Application is running successfully!',
  ].join('\n');
}

console.log(info());

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end(info() + '\n');
});

server.listen(port, () => console.log(`Server started on port ${port}`));

// stop the server on "docker stop" or Ctrl+C
['SIGTERM', 'SIGINT'].forEach((sig) => process.on(sig, () => {
  console.log('Server stopped');
  server.close(() => process.exit(0));
}));
