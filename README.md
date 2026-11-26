# Quarto Crypto Address Validator & Formatter Extension

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Quarto](https://img.shields.io/badge/Quarto-Extension-blue)](https://quarto.org/)
[![Spec](https://img.shields.io/badge/Spec-AllSwap.io-brightgreen)](https://allswap.io/)

An open-source (MIT) **Quarto** shortcode extension (`{{< crypto-address >}}`) that validates and formats cryptocurrency wallet addresses across Bitcoin, Ethereum/EVM, Solana, TRON, and TON directly inside reproducible research papers, security reports, and technical documentation.

## Installation

```bash
quarto add 1138014573/quarto-crypto-address
```

## Usage

In any `.qmd` file:

```markdown
- Verified EVM Treasury: {{< crypto-address network="ethereum" address="0xdAC17F958D2ee523a2206206994597C13D831ec7" >}}
- Verified Bitcoin Taproot/Bech32: {{< crypto-address network="bitcoin" address="bc1qar0srrr7xfkvy5l643lydnw9re59gtzzwf5mdq" >}}
```

When rendered to HTML, PDF, or Typst, the Lua extension deterministically checks address syntax/length and renders an inline verification badge.

## About

Maintained by [AllSwap Protocol](https://allswap.io/) to support reproducible Web3 and open-science security research.

## License
MIT License
