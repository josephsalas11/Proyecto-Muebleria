import React, {Component} from 'react';
import {ProductConsumer} from "../context";
import {ButtonContainer} from "./Button";
import {Link} from "react-router-dom";

class Details extends Component {
    render() {
        return (
            <ProductConsumer>
                {value => {
                    const {idProduct = 1, photo, description, finalCost, name} = value.detailProduct;
                    return (
                        <div className="container py-5">
                            {/* title */}
                            <div className="row">
                                <div className="col-10 mx-auto text-center text-slanted text-blue my-5">
                                    <h1>{name}</h1>
                                </div>
                            </div>
                            {/* end of title */}
                            <div className="row">
                                <div className="col-10 mx-auto col-md-6 my-3">
                                    <img src={photo} className="img-fluid" alt=""/>
                                </div>
                                {/* prdoduct info */}
                                <div className="col-10 mx-auto col-md-6 my-3 text-capitalize">
                                    <h1>Modelo : {name}</h1>
                                    <h4 className="text-blue">
                                        <strong>
                                            Precio : <span>$</span>
                                            {finalCost}
                                        </strong>
                                    </h4>
                                    <p className="text-capitalize font-weight-bold mt-3 mb-0">
                                        Alguna información del producto:
                                    </p>
                                    <p className="text-muted lead">{description}</p>
                                    {/* buttons */}
                                    <div>
                                        <Link to="/">
                                            <ButtonContainer>Regresar</ButtonContainer>
                                        </Link>
                                        <ButtonContainer
                                            cart
                                            disabled={value.isProductInCart(idProduct)}
                                            onClick={() => {
                                                value.addProductInCart(idProduct);
                                                // value.addToCart(idProduct);
                                                value.openModal(idProduct);
                                            }}
                                        >
                                            {value.isProductInCart(idProduct) ? "En el carrito" : "añadir al carrito"}
                                        </ButtonContainer>
                                    </div>
                                </div>
                            </div>
                        </div>
                    );
                }}
            </ProductConsumer>
        );
    }
}

export default Details;