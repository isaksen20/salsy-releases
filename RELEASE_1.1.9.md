# Salsy 1.1.9 – retter serverfeil i vaktboken

Oppdater Server og PC til **1.1.9**, start serveren på nytt og last nettappene på nytt. Android 0.41.0 kan brukes videre. Ingen ny Caddyfile kreves.

Vaktboken kunne gi HTTP 500 når en ansatt med fravær ble behandlet før en ansatt med vakt, eller når en senere dato hadde en vakt etter et tidligere fravær. Feilen gjaldt en navnekollisjon i den felles visningsfunksjonen. Dag-, tre-dagers- og ukevisning, native PC og PC-nett bruker nå den rettede funksjonen. Synlig vaktstatus som Kurs beholdes sammen med korrekt fraværsstatus.

Nettklientene viser nå en forståelig melding med HTTP-status når server eller mellomliggende proxy returnerer tekst/HTML eller ugyldig JSON. Rå feilside og tekniske detaljer vises ikke i meldingen. Mislykkede svar hurtiglagres ikke. Utløpt innlogging håndteres fortsatt som utløpt også når HTTP 401 har en tekstrespons. Native PC hadde allerede en tilsvarende forståelig melding for ugyldige svar.

Rettelsen endrer ikke lagrede vakter, fravær eller lønnsberegninger. Den detaljerte lønns-PDF-en fra 1.1.8 beholdes.

## Kontroll og avgrensninger

Feilen er gjenskapt med syntetiske data før retting. Kontrollene dekker fravær fulgt av vakter mellom ansatte og datoer, visningsvarianter, norsk/engelsk, private fraværsopplysninger, stemplingstilgang og avdelingsskille. Native PC, PC-nett og nettklientenes håndtering av HTTP 500/502, ugyldig 200, tomt 204, JSON-validering og utløpt 401 kontrolleres. Pakkede moduler, ARM64 under emulering og privat serveradministrasjon kontrolleres før publisering. Fysisk mobil/Raspberry Pi og faktisk systemd-oppstart er ikke testet.

Tariffavtalenes ufullstendige kontrollstatus og Kasses teststatus beholdes. Hosting Manager inngår ikke i GitHub-utgivelsen.

## English

Fixes a shared roster projection failure when absence information preceded another shift, either across employees or across dates. Day, three-day and week views preserve both shift labels and absence categories. Desktop and mobile web clients now handle non-JSON server/proxy errors safely, retaining HTTP status and expired-session handling without exposing raw response bodies. Native PC already reports invalid responses understandably. Stored shifts, absence and payroll calculations are unchanged. Private hosting installers remain excluded from GitHub.
