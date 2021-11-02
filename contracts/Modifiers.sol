// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

abstract contract Modifiers {
    modifier onlyAdmin(address admin) {
        require(msg.sender == admin, "Solo el admin puede llamar la funcion");
        _;
    }

    modifier isUsersTurn(address userInTurn) {
        //Verifies if it is the users round to widraw
        require(
            msg.sender == userInTurn,
            "Debes esperar tu turno para retirar"
        );
        _;
    }

    modifier isNotUsersTurn(address userInTurn) {
        //Verifies if it is not the users round to widraw
        require(msg.sender != userInTurn, "En este turno no depositas");
        _;
    }

    modifier isRegisteredUser(bool user) {
        //Verifies if it is the users round to widraw
        require(user == true, "Usuario no registrado");
        _;
    }

    modifier isPayAmountCorrect(uint256 userBalance, uint256 cashIn, uint256 feeCost) {
        //Verifies if it is the users round to widraw
        uint256 totalAmount = cashIn + feeCost;
        require(userBalance == totalAmount, "Monto incorrecto");
        _;
    }
}