const express = require('express');
const app = express();
const cors = require('cors');
const mssql = require('mssql');

const SELECT_ALL_FROM_PRODUCT_QUERY = 'EXEC sp_read_product @idProduct = null';
const SELECT_ALL_FROM_CATEGORY_QUERY = 'EXEC getCategories';


const config = {
    user: 'sa',
    password: 'sa_Password',
    server: '127.0.0.1',
    port: 1433,
    database: 'Workshop',
    "options": {
        "encrypt": true,
        "enableArithAbort": true
    }
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

app.get('/cities', (req, res) => {
    const SP_GetCities = 'EXEC get_cities'
    connection.query(SP_GetCities, (err, results) => {
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

app.get('/login', (req, res) => {
    const {username} = req.query;
    const {password} = req.query;

    const SP_LOGIN = `EXEC LogIn @username = '${username}', @password = '${password}'`;
    connection.query(SP_LOGIN, (err, results) => {
        if (err) {
            console.log(err);
            return res.send(err)
        } else {
            return res.send(results)
        }
    });
});

app.get('/register', (req, res) => {
    const {p_name} = req.query;
    const {p_lastname} = req.query;
    const {p_birthdate} = req.query;
    const {p_address} = req.query;
    const {p_email} = req.query;
    const {p_username} = req.query;
    const {p_password} = req.query;
    const SP_CREATEACCOUNT = `EXEC create_account @p_name = '${p_name}', @p_lastname = '${p_lastname}', @p_birthdate = '${p_birthdate}', @p_address= '${p_address}', @p_email='${p_email}', @p_username = '${p_username}', @p_password = '${p_password}'`;
    console.log(SP_CREATEACCOUNT);
    connection.query(SP_CREATEACCOUNT, (err, results) => {
        if (err) {
            console.log(err);
            return res.send(err)
        } else {
            return res.send(results)
        }
    });
});


app.get('/coupon', (req, res) => {
    const {idUser} = req.query;
    const {coupon} = req.query;

    const SP_validate_coupon = `EXEC validate_coupon @idUser = '${idUser}', @coupon = '${coupon}'`;
    connection.query(SP_validate_coupon, (err, results) => {
        if (err) {
            console.log(err);
            return res.send(err)
        } else {
            return res.send(results)
        }
    });
});

// EXEC RegisterPurchase @user = 6, @subsidiary=null, @products = '1:2&2:2&3:3', @coupon= 1.5;
// localhost:5000/purchase?user=6&products=1:2_2:2_3:3&coupon=1.5
app.get('/purchase', (req, res) => {
    const {user} = req.query;
    const {products} = req.query;
    const {coupon} = req.query;

    const SP_RegisterPurchase = `EXEC RegisterPurchase @user = '${user}', @subsidiary = null, @products = '${products}', @coupon = '${coupon}'`;
    connection.query(SP_RegisterPurchase, (err, results) => {
        if (err) {
            console.log(err);
            return res.send(err)
        } else {
            return res.send(results)
        }
    });
});



app.listen(5000, function () {
    console.log('Server is running..');
});