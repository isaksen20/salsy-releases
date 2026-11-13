# Salsy 0.95.6 – Nye beskjeder på mobilkalenderen

Mobilnettklienten på `/app/` og Salsy Android 0.35.5 viser en klikkbar teller
øverst i kalenderen: **1 ny beskjed** eller **2 nye beskjeder**. Telleren åpner
**Beskjeder og varsler** og inkluderer bare den innloggede brukerens uleste,
tilgjengelige beskjeder og varsler. Den skjules når antallet er null.

Antallet oppdateres ved åpning, omtrent hvert minutt mens kalenderen er synlig,
og når appen/fanen blir aktiv igjen. Markering som sett eller fjerning i
innboksen reduserer antallet. Å åpne innboksen eller levere et Android-varsel
markerer ikke automatisk meldingene som lest. Kalendervisning for en annen
ansatt endrer ikke hvilken innboks telleren gjelder. Ingen nye rettigheter gis.
Nettverksfeil ved telling blokkerer ikke kalenderen.

Oppdater server og Android-appen, start serveren på nytt og last nettklienten
på nytt. Server og PC 0.95.6 for Debian, ARM64-server, bruksanvisning og oppdatert
personalverktøyveiledning følger med. Matchende privat Hosting Manager beholdes
lokalt og må installeres sammen med serverpakken når den brukes. Regnskap er
fortsatt skyggeregnskap; tariffmaler beholder sin eksisterende kontrollstatus.

## English

Mobile web and Android 0.35.5 show a clickable **1 new message / 2 new messages**
indicator at the top of Calendar, opening the existing inbox. Only the current
account's readable, unseen and non-dismissed notifications count. A delivery
acknowledgment is not a read acknowledgment. The indicator is hidden at zero,
refreshes roughly each minute while visible and upon returning to the app/tab,
and does not block the calendar during outages. Viewing another employee's
calendar never switches the private inbox. Existing seen/delete actions apply.
Upgrade/restart the server, update Android and reload mobile web. Private Manager
remains local; install matching DEBs together. Physical Android and systemd boot
have not been tested; ARM64 is verified in QEMU.
