import React, {Component} from "react";
import Title from "../Title";
import {ProductConsumer} from "../../context";
import Select from "react-select";
import styled from "styled-components";
import DayPicker, {DateUtils} from 'react-day-picker';
import 'react-day-picker/lib/style.css';
import {ButtonContainer} from "../Button";

export default class Store extends Component {
    constructor(props) {
        super(props);
        this.state = {
            selectedOption: {value: null, label: 'Todas las Sucursales'},
            selectedProduct: {value: null, label: 'Todos los Productos'},
            selectedEmployee: {value: null, label: 'Todos los Empleados'},
            from: undefined,
            to: undefined,
            gainReport: [],
            salesReport: []
        }
        this.handleChange = this.handleChange.bind(this);
        this.handleProductChange = this.handleProductChange.bind(this);
        this.handleEmployeeChange = this.handleEmployeeChange.bind(this);
        this.handleDayClick = this.handleDayClick.bind(this);
        this.handleResetClick = this.handleResetClick.bind(this);
    }

    handleChange(e) {
        this.setState({
            selectedOption: e
        });
    };

    handleProductChange(e) {
        this.setState({
            selectedProduct: e
        });
    };

    handleEmployeeChange(e) {
        this.setState({
            selectedEmployee: e
        });
    };

    getDate = () => {
        if (this.state.from !== undefined && this.state.to !== undefined) {
            const temFrom = `${this.state.from.getFullYear()}-${this.state.from.getMonth() + 1}-${this.state.from.getDate()}`;
            const temTo = `${this.state.to.getFullYear()}-${this.state.to.getMonth() + 1}-${this.state.to.getDate()}`;
            return {from: temFrom, to: temTo}
        }
        return {from: null, to: null}
    }

    handleDayClick(day) {
        const range = DateUtils.addDayToRange(day, this.state);
        this.setState({
            from: range.from,
            to: range.to
        });
    }

    handleResetClick() {
        this.setState({
            selectedOption: {value: null, label: 'Todas las Sucursales'},
            selectedProduct: {value: null, label: 'Todos los Productos'},
            selectedEmployee: {value: null, label: 'Todos los Empleados'},
            from: undefined,
            to: undefined
        })
    }

    render() {
        const {from, to} = this.state;
        const modifiers = {start: from, end: to};
        return (
            <section>
                <ProductConsumer>
                    {value => {
                        const {isAdmin, ProductsSelect} = value;
                        if (isAdmin) {
                            return (
                                <React.Fragment>
                                    <div className="py-5">
                                        <div className="container">
                                            <Title title="Reportes"/>
                                            <ProductConsumer>
                                                {value => {
                                                    return <StyledSelect>
                                                        <div className="user-select mt-4">
                                                            <div className="row">
                                                                <div className='col col-sm-auto'>
                                                                    <DayPicker
                                                                        className="Selectable"
                                                                        numberOfMonths={this.props.numberOfMonths}
                                                                        selectedDays={[from, {from, to}]}
                                                                        modifiers={modifiers}
                                                                        onDayClick={this.handleDayClick}
                                                                    />
                                                                </div>

                                                                <div className="col">
                                                                    <div className="row mt-3 text-center">
                                                                        <div className="col">
                                                                            <Select
                                                                                placeholder="Select Option"
                                                                                value={this.state.selectedOption} // set selected value
                                                                                options={[
                                                                                    {
                                                                                        value: null,
                                                                                        label: 'Todas las Sucursales'
                                                                                    }, {
                                                                                        value: 1,
                                                                                        label: 'Sucursal Cartago'
                                                                                    }, {
                                                                                        value: 2,
                                                                                        label: 'Sucursal San José'
                                                                                    }, {
                                                                                        value: 3,
                                                                                        label: 'Sucursal Alajuela'
                                                                                    }]} // set list of the data
                                                                                onChange={this.handleChange} // assign onChange function
                                                                                theme={(theme) => ({
                                                                                    ...theme,
                                                                                    colors: {
                                                                                        ...theme.colors,
                                                                                        text: 'orangered',
                                                                                        primary25: 'silver',
                                                                                        primary: 'var(--mainDark)',
                                                                                    },
                                                                                })}
                                                                            />
                                                                        </div>

                                                                        <div className="col">
                                                                            <Select
                                                                                placeholder="Select Option"
                                                                                value={this.state.selectedProduct} // set selected value
                                                                                options={ProductsSelect} // set list of the data
                                                                                onChange={this.handleProductChange} // assign onChange function
                                                                                theme={(theme) => ({
                                                                                    ...theme,
                                                                                    colors: {
                                                                                        ...theme.colors,
                                                                                        text: 'orangered',
                                                                                        primary25: 'silver',
                                                                                        primary: 'var(--mainDark)',
                                                                                    },
                                                                                })}
                                                                            />
                                                                        </div>
                                                                        <div className="col">
                                                                            <Select
                                                                                placeholder="Select Option"
                                                                                value={this.state.selectedEmployee} // set selected value
                                                                                options={ProductsSelect} // set list of the data
                                                                                onChange={this.handleEmployeeChange} // assign onChange function
                                                                                theme={(theme) => ({
                                                                                    ...theme,
                                                                                    colors: {
                                                                                        ...theme.colors,
                                                                                        text: 'orangered',
                                                                                        primary25: 'silver',
                                                                                        primary: 'var(--mainDark)',
                                                                                    },
                                                                                })}
                                                                            />
                                                                        </div>
                                                                    </div>


                                                                    <div className="row mt-5 text-center">
                                                                        <div className="col">
                                                                            <ButtonContainer
                                                                                onClick={() => {
                                                                                    console.log('mostrar reporte')
                                                                                }
                                                                                }>
                                                                                Reporte Ventas
                                                                            </ButtonContainer>
                                                                        </div>
                                                                        <div className="col">
                                                                            <ButtonContainer
                                                                                onClick={() => {
                                                                                    fetch(`http://localhost:5000/gainReport?idsubsidiary=${this.state.selectedOption.value}&idproduct=${this.state.selectedProduct.value}&from=${this.getDate().from}&to=${this.getDate().to}`)
                                                                                        .then(res => res.json())
                                                                                        .then((data) => {
                                                                                            console.log(data.recordsets[0])

                                                                                        })
                                                                                        .catch(console.log);
                                                                                }
                                                                                }>
                                                                                Reporte Ganancias
                                                                            </ButtonContainer>
                                                                        </div>
                                                                        <div className="col">
                                                                            <ButtonContainer
                                                                                onClick={() => {
                                                                                    this.handleResetClick()
                                                                                }
                                                                                }>
                                                                                Reiniciar valores
                                                                            </ButtonContainer>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div className="row">

                                                            </div>
                                                        </div>
                                                    </StyledSelect>
                                                }}
                                            </ProductConsumer>
                                        </div>
                                    </div>
                                </React.Fragment>
                            );
                        } else {
                            return (
                                <React.Fragment>
                                    <Title title="Su usuario no tiene permisos para esta ventana"/>
                                </React.Fragment>
                            );
                        }
                    }}
                </ProductConsumer>
            </section>
        );
    }
}

const StyledSelect = styled.div`
    .user-select {
        padding: 0.2rem 0.4rem;
        border: none;
        color: var(--mainWhiteWrapper);
        font-size: 1.2rem;
    }
    `;