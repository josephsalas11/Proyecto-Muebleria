const express = require('express');
const app = express();
const cors = require('cors');
const mssql = require('mssql');


const SELECT_ALL_FROM_PRODUCT_QUERY = 'EXEC sp_read_product @idProduct = null';
const SELECT_ALL_FROM_CATEGORY_QUERY = 'SELECT idCategory AS value, name AS label, description FROM Category';


const config = {
    user: 'furniture',
    password: 'c45PSL08!$',
    server: 'projectii2020.database.windows.net',
    database: 'Workshop'
};

const connection = mssql.connect(config, error => {
    if (error) {
        return error
    }
});

app.use(cors())

app.get('/', (req, res) => {
    res.send('go to /products to see products')
});

app.get('/products', (req, res) => {
    connection.query(SELECT_ALL_FROM_PRODUCT_QUERY, (err, results) => {
        if (err) {
            console.log(err);
            return res.send(err)
        } else {
            return res.send(results)
        }
    });
});

app.get('/categories', (req, res) => {
    connection.query(SELECT_ALL_FROM_CATEGORY_QUERY, (err, results) => {
        if (err) {
            console.log(err);
            return res.send(err)
        } else {
            return res.send(results)
        }
    });
});

app.get('/products/bycategory', (req, res) => {
    const {idcategory} = req.query;
    const SELECT_PRODUCTS_BY_CATEGORY_QUERY = `SELECT * FROM Product WHERE idCategory = '${idcategory}'`;
    connection.query(SELECT_PRODUCTS_BY_CATEGORY_QUERY, (err, results) => {
        if (err) {
            console.log(err);
            return res.send(err)
        } else {
            return res.send(results)
        }
    });
});


// app.get('/', function (req, res) {
//     // permiso para que localhost:3000 pueda consumir la data
//     res.header('Access-Control-Allow-Origin', "http://localhost:3000")
//
//     var sql = require('mssql');
//
//     // config for your database
//     const config = {
//         user: 'furniture',
//         password: 'c45PSL08!$',
//         server: 'projectii2020.database.windows.net',
//         database: 'Workshop'
//     };
//
//
//     // connect to your database
//     sql.connect(config, function (err) {
//
//         if (err) console.log(err);
//
//         // create Request object
//         var request = new sql.Request();
//
//         // query to the database and get the records
//         request.query('select * from Product', function (err, recordset) {
//
//             if (err) console.log(err)
//
//             // send records as a response
//             res.send(recordset);
//
//         });
//     });
// });

app.listen(5000, function () {
    console.log('Server is running..');
});