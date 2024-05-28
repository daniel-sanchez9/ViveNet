const mysql = require('mysql');

const connection = mysql.createConnection({
    host     : 'sql.freedb.tech',
    user     : 'freedb_roote',
    password : 'CmxwKJ35y@#R@B*',
    database : 'freedb_login_node_curso'
});

connection.connect((error) => {
    if (error) {
        console.error('El error de conexión es: ' + error);
        return;
    }
    console.log('¡Conectado a la Base de Datos!');
});

module.exports = connection;
