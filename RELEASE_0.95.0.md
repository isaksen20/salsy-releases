# Salsy 0.95.0 – Ferieoppgjør og regnskapsfører

- Daterte ferieinnstillinger per ferieår: betalt ferie uten samlet trekk,
  ubetalt ferie med trekk for planlagte timer, eller samlet årsoppgjør i valgt
  måned med ordinær lønn når ferien tas ut.
- Årsoppgjør forhåndsberegnes og bekreftes per ansatt, med avtalte ferieuker,
  stillingsprosent, beregningsmetode, feriepenger og trekkpliktige deler.
  Feriepenger og ferietrekk er separate poster i estimat, eksport og lønnsslipp.
  Utstedt lønn sperrer endring av oppgjør og historiske lønnssatser.
- Egen regnskapsførerrettighet til å endre lønn, lønnstabeller, skattekort,
  tillegg og kontrakter. Nye kontoer får standardtilgangen; eksplisitte
  eksisterende tilgangslister beholdes og kan oppdateres av leder.
- Regnskapsfører kan åpne og eksportere alle fakturaer når fakturering er
  aktivert, med valg om å vise alle datoer. HR- og avdelingsgrenser beholdes.
- Samme arbeidsflyt i PC og PC-nettklienten. Felles lønnsmotor i offentlig
  server og privat Hosting Manager, med matching privat bygg lagret lokalt.

Oppdater server og PC til 0.95.0. Start serveren på nytt og last nettklienten
på nytt. Se [veiledningen for ferie og regnskapsfører](VACATION_FINANCE.md).
Utgivelsen inkluderer også Minioppgaver, stemplingslogg og godkjent
stemplingstrekk, samlet ferieoversikt, timebankkorrigering og daglig OnCall
fra den tidligere lokale 0.94.0-utgaven. Se [personalverktøy](STAFF_TOOLS.md)
og [endringene fra 0.94.0](RELEASE_0.94.0.md). Android 0.35.2 følger med;
ferieoppgjøret bruker serverens felles lønnsgrunnlag. Tariffavtalenes tidligere oppgitte kontrollstatus beholdes.
