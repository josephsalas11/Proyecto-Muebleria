import React, {Component} from 'react';

const ProductContext = React.createContext();
//Provider
//Context

class ProductProvider extends Component {
    state = {
        productos: [],
        productsInCart: [],
        detailProduct: [],
        categorias: [],
        cities: [],
        modalOpen: false,
        modalProduct: [],
        loginModalOpen: false,
        loginPerson: [], // {idUser: "1", username: "Juan"}
        isLoginPerson: false,
        coupon: 0,
        cartSubTotal: 0,
        cartDiscount: 0,
        cartTax: 0,
        cartTotal: 0
    };

    componentDidMount() {
        this.getProductos();
        this.getCategorias();
        this.getCities();
        // this.getSPLogIn('username', 'password')
        // this.getSPValidateCoupon(1, "coupon123")

    };

    getProductos = () => {
        fetch('http://localhost:5000/products')
            .then(res => res.json())
            .then((data) => {
                this.setState({productos: data.recordsets[0]});
                this.setState({detailProduct: this.state.productos[0], modalProduct: this.state.productos[0]})
            })
            .catch(console.log);
    };

    getProductosbyCategoria = idcategory => {
        fetch(`http://localhost:5000/products/bycategory?idcategory=${idcategory}`)
            .then(res => res.json())
            .then((data) => {
                this.setState({productos: data.recordsets[0]});
            })
            .catch(console.log);
    };

    getSPValidateCoupon = (idUser, coupon) => {
        fetch(`http://localhost:5000/coupon?idUser=${idUser}&coupon=${coupon}`)
            .then(res => res.json())
            .then((data) => {
                this.setState({coupon: Number(data.recordsets[0][0].result)});
                this.addTotals();
            })
            .catch(console.log);
    }

    setLoginPerson = (idUser, username) => {
        this.setState({loginPerson: {idUser: idUser, username: username}, isLoginPerson: true})
    }


    getCategorias = () => {
        fetch('http://localhost:5000/categories')
            .then(res => res.json())
            .then((data) => {
                data.recordsets[0].push({
                    "value": 0,
                    "label": "Todos los productos",
                    "description": ""
                });
                this.setState({categorias: data.recordsets[0]});
            })
            .catch(console.log)
    }

    getCities = () => {
        fetch('http://localhost:5000/cities')
            .then(res => res.json())
            .then((data) => {
                this.setState({cities: data.recordsets[0]});
            })
            .catch(console.log)
    }

    addProductInCart = (idProduct) => {
        let temproductsInCart = [...this.state.productsInCart];
        temproductsInCart.push({idProduct: idProduct, count: 1});
        this.setState(() => {
            return {
                productsInCart: temproductsInCart
            };
        }, this.addTotals);
    };


    isProductInCart = (idProduct) => {
        return this.state.productsInCart.find(item => item.idProduct === idProduct.toString()) !== undefined;

    }

    getItem = (idProduct) => {
        return this.state.productos.find(item => item.idProduct === idProduct);
    };

    handleDetail = (idProduct) => {
        const product = this.getItem(idProduct);
        this.setState(() => {
            return {detailProduct: product};
        });
    };

    openModal = idProduct => {
        const product = this.getItem(idProduct);
        this.setState(() => {
            return {modalProduct: product, modalOpen: true};
        });
    };
    openLoginModal = () => {
        this.setState({loginModalOpen: true})
    };

    closeModal = () => {
        this.setState(() => {
            return {modalOpen: false};
        });
    };

    closeLoginModal = () => {
        this.setState({loginModalOpen: false})
    };

    insertItemArray = (arr, index, newItem) => [
        // part of the array before the specified index
        ...arr.slice(0, index),
        // inserted item
        newItem,
        // part of the array after the specified index
        ...arr.slice(index)
    ]

    increment = idProduct => {
        let temProductsInCart = [...this.state.productsInCart];
        let temProduct = this.state.productsInCart.find(item => item.idProduct === idProduct.toString());
        let count = temProduct.count + 1;

        // delete old item
        const index = temProductsInCart.indexOf(temProduct);
        if (index > -1) {
            temProductsInCart.splice(index, 1);
        }
        // insert new item
        temProductsInCart = this.insertItemArray(temProductsInCart, index, {idProduct: idProduct, count: count});
        // this.setState({productsInCart: temProductsInCart});
        this.setState(() => {
            return {
                productsInCart: temProductsInCart
            };
        }, this.addTotals);
    };

    decrement = idProduct => {
        let temProductsInCart = [...this.state.productsInCart];
        let temProduct = this.state.productsInCart.find(item => item.idProduct === idProduct.toString());
        let count = temProduct.count - 1
        let index = temProductsInCart.indexOf(temProduct);

        if (count === 0) {
            this.removeItem(temProduct.idProduct)
        } else {
            if (index > -1) {
                temProductsInCart.splice(index, 1);
            }
            temProductsInCart = this.insertItemArray(temProductsInCart, index, {idProduct: idProduct, count: count});
            // this.setState({productsInCart: temProductsInCart})
            this.setState(() => {
                return {
                    productsInCart: temProductsInCart
                };
            }, this.addTotals);
        }
    };

    getTotals = () => {
        let subTotal = 0;
        this.state.productsInCart.map(
            item => {
                let temProduct = this.getItem(item.idProduct)
                subTotal += temProduct.finalCost * item.count
                return subTotal
            }
        );

        const temDiscount = subTotal * (this.state.coupon / 100);
        const discount = parseFloat(temDiscount.toFixed(2));
        const tempTax = subTotal * 0.13;
        const tax = parseFloat(tempTax.toFixed(2));
        const temTotal = (subTotal - discount) + tax;
        const total = parseFloat(temTotal.toFixed(2));

        return {
            subTotal,
            discount,
            tax,
            total
        };
    };

    addTotals = () => {
        const totals = this.getTotals();
        this.setState(
            () => {
                return {
                    cartSubTotal: totals.subTotal,
                    cartDiscount: totals.discount,
                    cartTax: totals.tax,
                    cartTotal: totals.total
                };
            },
            () => {
                // console.log(this.state);
            }
        );
    };

    removeItem = idProduct => {
        let temProductsInCart = [...this.state.productsInCart];
        let temProduct = this.state.productsInCart.find(item => item.idProduct === idProduct.toString());

        // romove an item
        const index = temProductsInCart.indexOf(temProduct);
        if (index > -1) {
            temProductsInCart.splice(index, 1);
        }
        this.setState(() => {
            return {
                productsInCart: temProductsInCart
            };
        }, this.addTotals);
    };

    clearCart = () => {
        this.setState(
            () => {
                return {productsInCart: []};
            },
            () => {
                this.addTotals();
            }
        );
    };

    render() {
        return (
            <ProductContext.Provider value={{
                ...this.state,
                handleDetail: this.handleDetail,
                openModal: this.openModal,
                closeModal: this.closeModal,
                openLoginModal: this.openLoginModal,
                closeLoginModal: this.closeLoginModal,
                addProductInCart: this.addProductInCart,
                isProductInCart: this.isProductInCart,
                increment: this.increment,
                decrement: this.decrement,
                removeItem: this.removeItem,
                getItem: this.getItem,
                clearCart: this.clearCart,
                setLoginPerson: this.setLoginPerson,
                getSPValidateCoupon: this.getSPValidateCoupon
                // getSPLogIn: this.getSPLogIn

            }}>
                {this.props.children}
            </ProductContext.Provider>
        );
    }
}

export default ProductProvider;


const
    ProductConsumer = ProductContext.Consumer;

export {
    ProductProvider
    ,
    ProductConsumer
};
