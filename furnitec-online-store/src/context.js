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
        modalOpen: false,
        modalProduct: [],
    };

    componentDidMount() {
        this.getProductos();
        this.getCategorias();
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


    getCategorias = () => {
        fetch('http://localhost:5000/categories')
            .then(res => res.json())
            .then((data) => {
                const temData = data.recordsets[0].push({
                    "value": 0,
                    "label": "Todos los productos",
                    "description": "Todos"
                })
                this.setState({categorias: data.recordsets[0]});
            })
            .catch(console.log)
    }

    addProductInCart = (idProduct) => {
        let temproductsInCart = [...this.state.productsInCart];
        temproductsInCart.push({idProduct: idProduct, count: 1});

        this.setState({productsInCart: temproductsInCart});
        console.log(this.state.productsInCart)
    };


    // removeProductInCart = (idProduct) => {
    //     let temproductsInCart = [...this.state.productsInCart];
    //     temproductsInCart.remove([idProduct]);
    //     this.setState({productsInCart: temproductsInCart});
    // };

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

    addToCart = (idProduct) => {
        console.log(`hello from addToCart id:${idProduct}`);
    };

    openModal = idProduct => {
        const product = this.getItem(idProduct);
        this.setState(() => {
            return {modalProduct: product, modalOpen: true};
        });
    };
    closeModal = () => {
        this.setState(() => {
            return {modalOpen: false};
        });
    };

    increment = idProduct => {
        let temProductsInCart = [...this.state.productsInCart];
        let temProduct = this.state.productsInCart.find(item => item.idProduct === idProduct.toString());
        let count = temProduct.count + 1

        temProductsInCart.remove(temProduct);
        temProductsInCart.push({idProduct: idProduct, count: count})
        this.setState({productsInCart: temProductsInCart})


        //
        // let tempCart = [...this.state.cart];
        // const selectedProduct = tempCart.find(item => {
        //     return item.id === id;
        // });
        // const index = tempCart.indexOf(selectedProduct);
        // const product = tempCart[index];
        // product.count = product.count + 1;
        // product.total = product.count * product.price;
        // this.setState(() => {
        //     return {
        //         cart: [...tempCart]
        //     };
        // }, this.addTotals);
    };
    decrement = idProduct => {
        let temProductsInCart = [...this.state.productsInCart];
        let temProduct = this.state.productsInCart.find(item => item.idProduct === idProduct.toString());
        let count = temProduct.count - 1
        if (count === 0) {
            temProductsInCart.remove(temProduct);
        } else {
            temProductsInCart.remove(temProduct);
            temProductsInCart.push({idProduct: idProduct, count: count})
            this.setState({productsInCart: temProductsInCart})
        }

        // let tempCart = [...this.state.cart];
        // const selectedProduct = tempCart.find(item => {
        //     return item.id === id;
        // });
        // const index = tempCart.indexOf(selectedProduct);
        // const product = tempCart[index];
        // product.count = product.count - 1;
        // if (product.count === 0) {
        //     this.removeItem(id);
        // } else {
        //     product.total = product.count * product.price;
        //     this.setState(() => {
        //         return {cart: [...tempCart]};
        //     }, this.addTotals);
        // }
    };
    // getTotals = () => {
    //     // const subTotal = this.state.cart
    //     //   .map(item => item.total)
    //     //   .reduce((acc, curr) => {
    //     //     acc = acc + curr;
    //     //     return acc;
    //     //   }, 0);
    //     let subTotal = 0;
    //     this.state.cart.map(item => (subTotal += item.total));
    //     const tempTax = subTotal * 0.1;
    //     const tax = parseFloat(tempTax.toFixed(2));
    //     const total = subTotal + tax;
    //     return {
    //         subTotal,
    //         tax,
    //         total
    //     };
    // };
    // addTotals = () => {
    //     const totals = this.getTotals();
    //     this.setState(
    //         () => {
    //             return {
    //                 cartSubTotal: totals.subTotal,
    //                 cartTax: totals.tax,
    //                 cartTotal: totals.total
    //             };
    //         },
    //         () => {
    //             // console.log(this.state);
    //         }
    //     );
    // };
    removeItem = idProduct => {
        let temproductsInCart = [...this.state.productsInCart];
        let temProduct = this.state.productsInCart.find(item => item.idProduct === idProduct.toString());
        temproductsInCart.remove(temProduct);
        this.setState({productsInCart: temproductsInCart});
        // let tempProducts = [...this.state.products];
        // let tempCart = [...this.state.cart];
        //
        // const index = tempProducts.indexOf(this.getItem(id));
        // let removedProduct = tempProducts[index];
        // removedProduct.inCart = false;
        // removedProduct.count = 0;
        // removedProduct.total = 0;
        //
        // tempCart = tempCart.filter(item => {
        //     return item.id !== id;
        // });
        //
        // this.setState(() => {
        //     return {
        //         cart: [...tempCart],
        //         products: [...tempProducts]
        //     };
        // }, this.addTotals);
    };
    clearCart = () => {
        this.setState({productsInCart: []})
        // this.setState(
        //     () => {
        //         return { productsInCart: [] };
        //     },
        //     () => {
        //         this.setProducts();
        //         this.addTotals();
        //     }
        // );
    };

    render() {
        return (
            <ProductContext.Provider value={{
                ...this.state,
                handleDetail: this.handleDetail,
                openModal: this.openModal,
                closeModal: this.closeModal,
                addProductInCart: this.addProductInCart,
                isProductInCart: this.isProductInCart,
                increment: this.increment,
                decrement: this.decrement,
                removeItem: this.removeItem,
                clearCart: this.clearCart

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
