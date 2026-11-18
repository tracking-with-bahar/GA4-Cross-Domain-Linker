# GA4 Cross-Domain Linker

A Google Tag Manager variable template for managing allowed domains in GA4 cross-domain tracking.

## Overview

This template checks the current hostname against a list of configured domains.

If the current hostname matches one of the configured domains, the variable returns the domain list and sets `accept_incoming` to `true`.

If no domain matches, it returns `undefined`.

## Features

- Accepts multiple domains.
- Retrieves the current hostname.
- Performs case-insensitive, exact hostname matching.
- Returns `undefined` when the current hostname is not in the allowed domain list.

## Configuration

Add the domains you want to allow in the Simple Table field.

| Domain |
| --- |
| example.com |
| booking.example.com |
| checkout.example.com |

## Return Value

When a domain matches:

```javascript
{
  domains: [
    "example.com",
    "booking.example.com"
  ],
  accept_incoming: true
}
```

When no domain matches:

```javascript
undefined
```

## License

MIT
