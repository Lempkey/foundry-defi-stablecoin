# Decentralised Stablecoin

A minimal DeFi stablecoin system that is overcollateralized and algorithmically stable, designed to maintain a 1:1 USD peg. The stablecoin (DSC) is backed by exogenous collateral assets such as ETH and BTC. This project contains two core smart contracts:

- **DecentralisedStableCoin.sol** – An ERC20-based stablecoin with burn and mint functionality.
- **DSCEngine.sol** – The protocol engine that manages collateral deposits, stablecoin minting/redemption, and liquidations.

## Table of Contents

- [Decentralised Stablecoin](#decentralised-stablecoin)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [Architecture](#architecture)
    - [1. DecentralisedStableCoin.sol](#1-decentralisedstablecoinsol)
    - [2. DSCEngine.sol](#2-dscenginesol)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)

## Overview

The Decentralised Stablecoin project is designed to offer a simplified, algorithmic stablecoin mechanism. Users deposit collateral (e.g., ETH or BTC) to mint DSC tokens, ensuring that the total collateral value always exceeds the minted stablecoin supply. The system uses Chainlink price feeds to determine the USD value of the collateral, and incorporates liquidation logic to incentivize healthy collateralization ratios.

## Features

- **Exogenous Collateral:** Support for assets like ETH and BTC.
- **Overcollateralization:** Ensures that the value of collateral exceeds the stablecoin supply.
- **Algorithmic Stability:** Maintains a 1 DSC ≙ 1 USD peg through protocol rules.
- **Liquidation Mechanism:** Liquidators can cover undercollateralized positions and receive a bonus.
- **Chainlink Integration:** Uses Chainlink Price Feeds to obtain up-to-date USD prices for collateral assets.
- **Security:** Leverages OpenZeppelin’s audited contracts (ERC20, Ownable, ReentrancyGuard) for robust security practices.

## Architecture

The system is composed of two main contracts:

### 1. DecentralisedStableCoin.sol
- **ERC20 Implementation:** Inherits from OpenZeppelin’s `ERC20Burnable` and `Ownable`.
- **Minting and Burning:** Only the protocol engine (DSCEngine) can mint or burn DSC tokens, ensuring that the stablecoin supply remains controlled.
- **Error Handling:** Custom errors provide clear failure messages for invalid operations.

### 2. DSCEngine.sol
- **Collateral Management:** Allows users to deposit supported collateral tokens and tracks deposits per user.
- **Minting & Redemption:** Users can mint DSC against their collateral and redeem collateral by burning DSC.
- **Health Factor:** Calculates a user’s health factor based on collateral value and debt, ensuring the system remains overcollateralized.
- **Liquidation:** Provides a mechanism to liquidate undercollateralized positions, rewarding liquidators with a bonus.
- **Chainlink Price Feeds:** Fetches real-time price data for collateral assets, ensuring accurate valuation.

## Getting Started

### Prerequisites

- **Foundry:** This example assumes Foundry as the development environment.
- **Solidity:** The contracts are written in Solidity 0.8.18/0.8.20.
- **Dependencies:**
  - [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
  - [Chainlink Contracts](https://github.com/smartcontractkit/chainlink)
