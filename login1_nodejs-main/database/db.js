const mysql = require('mysql');

const connection = mysql.createConnection({
    host     : 'sql104.infinityfree.com',
    user     : 'if0_36633976',
    password : 'sSrWeqhvc8sDo',
    database : 'if0_36633976_login_node_curso'
});

connection.connect((error) => {
    if (error) {
        console.error('El error de conexión es: ' + error);
        return;
    }
    console.log('¡Conectado a la Base de Datos!');
});

module.exports = connection;
