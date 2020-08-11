import React, {Component} from "react";
// import PayPalButton from "./PayPalButton";
import {Link} from "react-router-dom";

export default class CartTotals extends Component {
    constructor(props) {
        super(props);
        this.state = {
            discountCoupon: '',
            message: ''
        };
    }

    onCouponChange(e) {
        this.setState({discountCoupon: e.target.value, message: ''});
    }

    render() {
        const {
            coupon,
            cartSubTotal,
            cartDiscount,
            cartTax,
            cartTotal,
            productsInCart,
            clearCart,
            loginPerson,
            isLoginPerson,
            getSPValidateCoupon
        } = this.props.value;
        // const { history } = this.props;
        const emptyCart = productsInCart.length === 0;
        return (
            <React.Fragment>
                {!emptyCart && (
                    <div className="container">
                        <div className="row">
                            <div className="col-10 mt-2 ml-sm-5 ml-md-auto col-sm-8 text-capitalize text-right">
                                <Link to="/">
                                    <button
                                        className="btn btn-outline-danger text-uppercase mb-3 px-5"
                                        type="button"
                                        onClick={() => {
                                            clearCart();
                                        }}
                                    >
                                        limpiar carrito
                                    </button>
                                </Link>

                                <h5>
                                    <input
                                        type="text"
                                        name="Código de descuento"
                                        className="coupon-input"
                                        placeholder="Código de descuento"
                                        onChange={
                                            this
                                                .onCouponChange
                                                .bind(this)
                                        }/>
                                </h5>
                                <h5 className="coupon-applied">
                                    {this.state.message}
                                </h5>

                                <button
                                    type="button"
                                    className="coupon-btn"
                                    onClick={
                                        () => {
                                            console.log(isLoginPerson)
                                            if (isLoginPerson) {
                                                getSPValidateCoupon(loginPerson.idUser, this.state.discountCoupon)
                                                console.log(coupon)
                                                if (cartDiscount > 0) {
                                                    this.setState({message: 'Cupón Aplicado'})
                                                } else {
                                                    this.setState({message: 'Cupón Inválido'})
                                                }
                                            } else {
                                                this.setState({message: 'Debe Iniciar Sesión'})
                                            }
                                        }
                                    }>Aplicar Código
                                </button>

                                <h5>
                                    <span className="text-title"> subtotal :</span>{" "}
                                    <strong>$ {cartSubTotal} </strong>
                                </h5>
                                <h5>
                                    <span className="text-title"> descuento :</span>{" "}
                                    <strong>$ {cartDiscount} </strong>
                                </h5>
                                <h5>
                                    <span className="text-title"> impuesto :</span>{" "}
                                    <strong>$ {cartTax} </strong>
                                </h5>
                                <h5>
                                    <span className="text-title"> total :</span>{" "}
                                    <strong>$ {cartTotal} </strong>
                                </h5>


                                {/*<PayPalButton*/}
                                {/*    totalAmount={cartTotal}*/}
                                {/*    clearCart={clearCart}*/}
                                {/*    // history={history}*/}
                                {/*/>*/}
                            </div>
                        </div>
                    </div>
                )}
            </React.Fragment>
        );
    }
}