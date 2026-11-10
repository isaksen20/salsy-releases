# Salsy 0.92.0 – Fakturainnstillinger og bankavstemming

PC og PC-nett har Fakturainnstillinger oppe til høyre med Generelt, EHF,
eFaktura, Fakturaavstemming og Open Banking / API.

- ISO 20022 camt.053/camt.054, Nets OCR giro og dokumentert CSV-import.
- Forhåndsvisning, duplikatkontroll, eksakte referanseforslag, delbetalinger,
  restbeløp, oppheving med historikk og atomisk Betalt-status.
- Valgfritt KID-oppsett (modulus 10/11, lengde og prefiks), etter bekreftet
  bankavtale. Nye fakturaer får KID i PDF og EHF; gamle omskrives ikke.
- Bedriften velger bank/API-leverandør, HTTPS-adresse, autentisering og
  JSON-feltkoblinger. Kun lesing, krypterte nøkler, TLS, blokkering av interne
  adresser og omdirigering. Ingen automatisk betalingsinitiering.
- Samme servermotor i offentlig server og privat Hosting Manager.

Direkte bankbruk krever avtale/samtykke og kompatibelt API. BankID/OAuth-flyt,
mTLS, automatisk tokenfornyelse og leverandørspesifikke integrasjoner er ikke
universelt implementert. Ingen ekte bankintegrasjon er produksjonstestet.
Fakturaavstemmingen bokfører ikke automatisk i hovedboken. eFaktura-sending
forblir klargjøring. Les INVOICE_RECONCILIATION.md for oppsett og begrensninger.
