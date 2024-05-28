const express = require('express');
const app = express();
const dotenv = require('dotenv');
const bcrypt = require('bcryptjs');
const session = require('express-session');
const connection = require('./database/db');

// Configuración de middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Configuración de dotenv
dotenv.config({ path: './env/.env' });

// Configuración de directorios estáticos
app.use('/resources', express.static('public'));
app.use('/resources', express.static(__dirname + '/public'));

// Configuración del motor de plantillas
app.set('view engine', 'ejs');

// Configuración de sesiones
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

// Rutas
app.get('/login', (req, res) => {
    res.render('login');
});

app.get('/register', (req, res) => {
    res.render('register');
});



app.post('/guardarreservabbq', async (req, res) => {
    console.log(req.body); // Imprimir req.body en la consola del servidor

    const nombre = req.body.nombre;
    const torre = req.body.torre;
    const apartamento = req.body.apartamento;
    const email = req.body.email;
    const fecha = req.body.fecha;
    const mensaje = req.body.mensaje;

    // Aquí debes insertar los datos en la base de datos
    connection.query('INSERT INTO reservas_bbq SET ?', {nombre: nombre, torre: torre, apartamento: apartamento, email: email, fecha: fecha, mensaje: mensaje}, async (error, results, fields) => {
        if (error) {
            console.log(error); 
            res.status(500).send('Error al guardar la reserva de BBQ en la base de datos');
        } else {
            res.status(200).send('Reserva de BBQ guardada exitosamente');
            // Aquí puedes mostrar un mensaje emergente en el navegador si lo deseas
        }
    });
});

app.post('/guardarreservapiscina', async (req, res) => {
    console.log(req.body); // Imprimir req.body en la consola del servidor

    const nombre = req.body.nombre;
    const torre = req.body.torre;
    const apartamento = req.body.apartamento;
    const email = req.body.email;
    const fecha = req.body.fecha;
    const mensaje = req.body.mensaje;

    // Aquí debes insertar los datos en la base de datos
    connection.query('INSERT INTO reservas_piscina SET ?', {nombre: nombre, torre: torre, apartamento: apartamento, email: email, fecha: fecha, mensaje: mensaje}, async (error, results, fields) => {
        if (error) {
            console.log(error); 
            res.status(500).send('Error al guardar la reserva de PISCINA en la base de datos');
        } else {
            res.status(200).send('Reserva de PISCINA guardada exitosamente');
            // Aquí puedes mostrar un mensaje emergente en el navegador si lo deseas
        }
    });
});

app.post('/guardarreservasalon', async (req, res) => {
    console.log(req.body); // Imprimir req.body en la consola del servidor

    const nombre = req.body.nombre;
    const torre = req.body.torre;
    const apartamento = req.body.apartamento;
    const email = req.body.email;
    const fecha = req.body.fecha;
    const mensaje = req.body.mensaje;

    // Aquí debes insertar los datos en la base de datos
    connection.query('INSERT INTO reservas_salon SET ?', {nombre: nombre, torre: torre, apartamento: apartamento, email: email, fecha: fecha, mensaje: mensaje}, async (error, results, fields) => {
        if (error) {
            console.log(error); 
            res.status(500).send('Error al guardar la reserva de Salon Social en la base de datos');
        } else {
            res.status(200).send('Reserva de Salon Social guardada exitosamente');
            setTimeout(() => {
                res.redirect('/');
            }, 5000);
        }
    });
});

app.post('/certifcadoresidenciapost', async (req, res) => {
    console.log(req.body); // Imprimir req.body en la consola del servidor

    const nombre = req.body.nombres; // Cambiado de 'nombre' a 'nombres'
    const torre = req.body.torre;
    const apartamento = req.body.apartamento;
    const fecha = req.body.fecha;
    const mensaje = req.body.mensaje;

    // Aquí debes insertar los datos en la base de datos
    connection.query('INSERT INTO certificado_de_residencia SET ?', { nombres: nombre, torre, apartamento, fecha, mensaje }, async (error, results, fields) => {
        if (error) {
            console.log(error); 
            res.status(500).send('Error al guardar la solicitud de certificado de residencia en la base de datos');
        } else {
            res.status(200).send('Solicitud de certificado de residencia guardada exitosamente');
            // Redireccionar a la página de inicio después de 5 segundos
            setTimeout(() => {
                res.redirect('/');
            }, 5000);
        }
    });
});




app.post('/register', async (req, res) => {
    const user = req.body.user;
    const name = req.body.name;
    const rol = req.body.rol;
    const pass = req.body.pass;
    let passwordHash = await bcrypt.hash(pass, 8);
    connection.query('INSERT INTO users SET ?', { user: user, name: name, rol: rol, pass: passwordHash }, async (error, results) => {
        if (error) {
            console.log(error);
        } else {
            res.render('register', {
                alert: true,
                alertTitle: "Registration",
                alertMessage: "¡Successful Registration!",
                alertIcon: 'success',
                showConfirmButton: false,
                timer: 1500,
                ruta: ''
            });
        }
    });
});

app.post('/auth', async (req, res) => {
    const user = req.body.user;
    const pass = req.body.pass;
    if (user && pass) {
        connection.query('SELECT * FROM users WHERE user = ?', [user], async (error, results, fields) => {
            if (results.length == 0 || !(await bcrypt.compare(pass, results[0].pass))) {
                res.render('login', {
                    alert: true,
                    alertTitle: "Error",
                    alertMessage: "USUARIO y/o PASSWORD incorrectas",
                    alertIcon: 'error',
                    showConfirmButton: true,
                    timer: false,
                    ruta: 'login'
                });
            } else {
                req.session.loggedin = true;
                req.session.name = results[0].name;
                res.render('login', {
                    alert: true,
                    alertTitle: "Conexión exitosa",
                    alertMessage: "¡LOGIN CORRECTO!",
                    alertIcon: 'success',
                    showConfirmButton: false,
                    timer: 1500,
                    ruta: ''
                });
            }
            res.end();
        });
    } else {
        res.send('Please enter user and Password!');
        res.end();
    }
});



app.get('/', (req, res) => {
    if (req.session.loggedin) {
        res.render('index', {
            login: true,
            name: req.session.name
        });
    } else {
        res.render('index', {
            login: false,
            name: ''
        });
    }
    res.end();
});

// Ruta para Reserva_salon_social
app.get('/reserva', (req, res) => {
    if (req.session.loggedin) {
        res.render('Reserva_salon_social', {
            login: true,
            name: req.session.name
        });
    } else {
        res.render('Reserva_salon_social', {
            login: false,
            name: ''
        });
    }
    res.end();
});

// Ruta para Certificado de Residencia
app.get('/certificado', (req, res) => {
    if (req.session.loggedin) {
        res.render('certificadoresidencia', {
            login: true,
            name: req.session.name
        });
    } else {
        res.render('certificadoresidencia', {
            login: false,
            name: ''
        });
    }
    res.end();
});

// Ruta para Reserva_piscina
app.get('/reserva_pi', (req, res) => {
    if (req.session.loggedin) {
        res.render('Reserva_piscina', {
            login: true,
            name: req.session.name
        });
    } else {
        res.render('Reserva_piscina', {
            login: false,
            name: ''
        });
    }
    res.end();
});

// Ruta para Reserva_bbq
app.get('/reserva_bbq', (req, res) => {
    if (req.session.loggedin) {
        res.render('Reserva_bbq', {
            login: true,
            name: req.session.name
        });
    } else {
        res.render('Reserva_bbq', {
            login: false,
            name: ''
        });
    }
    res.end();
});

// Función para limpiar la caché luego del logout
app.use(function (req, res, next) {
    if (!req.user)
        res.header('Cache-Control', 'private, no-cache, no-store, must-revalidate');
    next();
});

// Logout
app.get('/logout', function (req, res) {
    req.session.destroy(() => {
        res.redirect('/') // siempre se ejecutará después de que se destruya la sesión
    });
});

// Iniciar el servidor
app.listen(3000, (req, res) => {
    console.log('SERVER RUNNING IN http://localhost:3000');
});
