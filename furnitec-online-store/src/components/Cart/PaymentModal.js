import React, {Component} from 'react';
import styled from "styled-components";
import {ProductConsumer} from "../../context";
import DayPickerInput from 'react-day-picker/DayPickerInput';
import 'react-day-picker/lib/style.css';
import FadeTransition from "../../transitions/fadeTransition";
import Select from "react-select";

export default class PaymentModal extends Component {

    constructor(props) {
        super(props);
        this.state = {
            isLoginOpen: true,
            isRegisterOpen: false
        };
    }

    showLoginBox() {
        this.setState({isLoginOpen: true, isRegisterOpen: false});
    }

    showRegisterBox() {
        this.setState({isRegisterOpen: true, isLoginOpen: false});
    }


    render() {
        return (
            <ProductConsumer>
                {value => {
                    const {paymentModalOpen, closePaymentModal} = value;
                    if (!paymentModalOpen) {
                        return null;
                    } else {
                        return (
                            <ProductConsumer>
                                {value => {
                                    return (
                                        <ModalContainer>
                                            <div className="container">
                                                <div className="row">
                                                    <div
                                                        className="col-8 mx-auto col-md-6 col-lg-4 p-5 text-center text-capitalize"
                                                        id="modal">


                                                        <div className="root-container">
                                                            {/*<div className="root-container">*/}
                                                            {/*    <div className="box-container">*/}
                                                            {/*        <PaymentBox value={value}/>*/}
                                                            {/*    </div>*/}
                                                            {/*</div>*/}
                                                            <div className="box-controller">
                                                                <div
                                                                    className={"controller " + (this.state.isLoginOpen
                                                                        ? "selected-controller"
                                                                        : "")}
                                                                    onClick={
                                                                        this
                                                                            .showLoginBox
                                                                            .bind(this)
                                                                    }>
                                                                    Pago en linea
                                                                </div>
                                                                <div
                                                                    className={"controller " + (this.state.isRegisterOpen
                                                                        ? "selected-controller"
                                                                        : "")}
                                                                    onClick={this
                                                                        .showRegisterBox
                                                                        .bind(this)}>
                                                                    Pago en efectivo
                                                                </div>
                                                            </div>

                                                            <FadeTransition isOpen={this.state.isLoginOpen}
                                                                            duration={0}>
                                                                <div className="box-container">
                                                                    {/*<OnlinePaymentBox value={value}/>*/}
                                                                </div>
                                                            </FadeTransition>
                                                            <FadeTransition isOpen={this.state.isRegisterOpen}
                                                                            duration={0}>
                                                                <div className="box-container">
                                                                    <CashPaymentBox value={value}/>
                                                                </div>
                                                            </FadeTransition>

                                                            <button
                                                                type="button"
                                                                className="login-btn mr-auto ml-auto"
                                                                onClick={closePaymentModal}>
                                                                Salir
                                                            </button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </ModalContainer>
                                    )
                                }}
                            </ProductConsumer>

                        );
                    }
                }}
            </ProductConsumer>
        );
    }
}

const ModalContainer = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.3);
  display: flex;
  align-items: center;
  justify-content: center;
  #modal {
    background: var(--mainWhite);
  }
`;

class CashPaymentBox extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            confirmed: false,
            message: '',
        };
    }

    render() {
        const {paymentModalOpen, closePaymentModal, registerPurchase} = this.props.value;
        if (!paymentModalOpen) {
            return null;
        } else {
            return (
                <div className="inner-container">
                    <div className="header">
                        Pago en efectivo
                    </div>
                    <div className="box">

                        {/*<div className="input-group">*/}
                        {/*    <label htmlFor="username">Nombre de usuario</label>*/}
                        {/*    <input*/}
                        {/*        type="text"*/}
                        {/*        name="username"*/}
                        {/*        className="login-input"*/}
                        {/*        placeholder="Username"*/}
                        {/*        onChange={this*/}
                        {/*            .onUsernameChange*/}
                        {/*            .bind(this)}/>*/}
                        {/*</div>*/}

                        {/*<div className="input-group">*/}
                        {/*    <label htmlFor="password">Contraseña</label>*/}
                        {/*    <input*/}
                        {/*        type="password"*/}
                        {/*        name="password"*/}
                        {/*        className="login-input"*/}
                        {/*        placeholder="Password"*/}
                        {/*        onChange={this*/}
                        {/*            .onPasswordChange*/}
                        {/*            .bind(this)}/>*/}
                        {/*</div>*/}

                        {/*<small className="danger-error">{this.state.error*/}
                        {/*    ? "Usuario o contraseña incorrecta"*/}
                        {/*    : ""}</small>*/}

                        <button
                            type="button"
                            className="login-btn"
                            onClick={
                                () => {
                                    registerPurchase();
                                    this.setState({message: 'Pedido confirmado. Su pedido se procesó en: '})
                                }
                            }>
                            Confirmar Pedido
                        </button>
                        <small className="coupon-applied">{this.state.confirmed
                            ? this.state.message
                            : ""}</small>
                    </div>
                </div>
            );
        }
    }

}