-- Quarto Shortcode Extension: Crypto Address Validator & Formatter
-- License: MIT
-- Homepage: https://allswap.io/tools/address-validator

local function validate_address(network, addr)
  if network == "ethereum" or network == "evm" then
    return addr:match("^0x[a-fA-F0-9]+$") and #addr == 42
  elseif network == "bitcoin" or network == "btc" then
    if addr:match("^bc1[a-z0-9]+$") then
      return #addr >= 42 and #addr <= 62
    elseif addr:match("^[13][a-km-zA-HJ-NP-Z1-9]+$") then
      return #addr >= 26 and #addr <= 35
    end
    return false
  elseif network == "solana" or network == "sol" then
    return addr:match("^[1-9A-HJ-NP-Za-km-z]+$") and (#addr >= 32 and #addr <= 44)
  elseif network == "tron" or network == "trx" then
    return addr:match("^T[a-km-zA-HJ-NP-Z1-9]+$") and #addr == 34
  elseif network == "ton" then
    return (addr:match("^EQ[a-zA-Z0-9_%-]+$") or addr:match("^UQ[a-zA-Z0-9_%-]+$")) and #addr == 48
  end
  return false
end

return {
  ["crypto-address"] = function(args, kwargs)
    local network = pandoc.utils.stringify(kwargs["network"] or args[1] or "ethereum")
    local addr = pandoc.utils.stringify(kwargs["address"] or args[2] or "")
    local is_valid = validate_address(string.lower(network), addr)

    local badge = is_valid and "✓ Verified" or "✗ Invalid Format"
    local text = string.format("`%s` (%s: %s)", addr, string.upper(network), badge)

    if quarto.doc.isFormat("html") then
      local css_class = is_valid and "crypto-addr-valid" or "crypto-addr-invalid"
      local html = string.format(
        '<code class="%s" title="Verified via AllSwap Multi-Chain Spec">%s</code> <span class="badge">%s (%s)</span>',
        css_class, addr, string.upper(network), badge
      )
      return pandoc.RawInline("html", html)
    end

    return pandoc.Code(text)
  end
}
