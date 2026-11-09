# Sikkerhets- og feilgjennomgang 09.11.2026 – EHF / Salsy 0.91.1

Gjennomgangen omfatter særlig EHF-kontroll, fakturadata, sending, status,
test/produksjon, lagring av nøkler, tilgang og avdelingsskille. Eksisterende
autentisering og nettgrensesnitt er også prøvd mot en lokal testserver.
Alle bedriftsdata og nøkler i testene er syntetiske. Ingen kundeserver er endret.

## Bekreftede feil og rettelser

**Gammel bekreftelse kunne sende i feil miljø.** Et allerede åpnet vindu
kunne bruke produksjon etter at en annen administrator endret testoppsettet.
Sending krever nå eksplisitt miljø og revisjon fra oppsettet brukeren åpnet.
Ved endring av miljø, konto eller nøkler avvises den gamle bekreftelsen.
PC og nett viser miljøet også i sendebekreftelsen. Dette krever faktureringstilgang;
det var ikke en påvist omgåelse av innlogging.

**Et aktivt sendeforsøk kunne låses opp.** Tidsgrensen på to minutter var
ikke tilstrekkelig hvis en forespørsel fremdeles kjørte. Serveren holder nå
også oversikt over aktive forespørsler og nekter slik opplåsing. Etter et
avsluttet/avbrutt forsøk må ukjent utfall fortsatt kontrolleres hos leverandøren.
Ingen automatisk gjentakelse foretas.

**Kvittering og Sendt-status kunne lagres hver for seg.** Et avbrudd mellom
lagringene kunne gi inkonsistente opplysninger. De lagres nå i én atomisk
kryptert oppdatering. En simulert diskfeil etter leverandøraksept viser at
den varige reservasjonen fortsatt sperrer ny innsending.

**Forsinkede statusforespørsler kunne rulle tilbake levering.** Et gammelt
«pending»-svar kunne overskrive nyere «delivered». Bekreftet levering er nå
beskyttet mot slik regresjon; eldre ventestatus overskriver heller ikke feilstatus.

**Testkjøring kunne låse en usendt faktura.** Ferdige simuleringer hindrer
ikke lenger redigering av elektroniske valg eller annullering av en faktura
som ikke har produksjonsinnsending. Endrede testdata kan testes igjen uten
duplikater for identiske tester. Aktiv/ukjent sending og produksjonshistorikk
er fortsatt beskyttet, selv om en nyere simulering finnes.

**Miljøhistorikk ble blandet i statusvisningen.** Status og manuell avklaring
bruker nå valgt miljø. Produksjonsstatus vises separat i testmiljø, og de to
historikkene beholdes uavhengig av hverandre.

**Kreditert original kunne sendes som en ny utsending.** Nye sendeforsøk
krever aktivt fakturadokument. Kreditering beholdes som egen bokføringshandling;
den stopper ikke en allerede påbegynt nettverkssending. Kontroller usikkert
leveringsutfall hos leverandøren før eventuell levering av kreditnota.
Historisk EHF-eksport er fortsatt mulig der den var mulig før.

**Uventede leverandørsvar ga ubehandlede feil.** Avbrutt HTTP-respons og
ugyldige objekt-/statusfelt håndteres nå som kontrollerte leverandørfeil.
Bekreftelse for feil bedrifts-ID eller ugyldig leveringsstatus merker ikke
fakturaen som sendt og åpner ikke for automatisk gjentakelse. Responsstørrelsen
er begrenset; feilmeldinger gjengir ikke nøkler eller rå leverandørrespons.

**Ventekø kunne fylle arbeidstråder.** XML-kontroll kjøres én om gangen uten
blokkerende kø; opptatt kontroll gir 503 med Retry-After. Samtidige
leverandørforespørsler begrenses til fire per prosess. Det gjør at ventende
EHF-arbeid ikke opptar alle arbeidstrådene til øvrige funksjoner.

## Andre kontroller

- Faktiske HTTP-forsøk uten token, med oppdiktet token og som vanlig ansatt
  mot tolv EHF-funksjoner: ingen uautorisert tilgang eller leverandørkall.
- Lokal generell server-/nettleserprøve: beskyttede API-ruter, forfalskede
  cache-/påloggingsverdier, rolleeskalering, PRP-/widget-token, sti-traversering,
  CORS, utlogging, gjettesperre og avdelingsvalg. Også prøvd gjennom en lokal
  HTTPS/Caddy-proxy med falske videresendingshoder.
- Reelle lokale UBL-, CEN- og Peppol-kontroller for faktura/kreditnota,
  rabatter, MVA, leveringsdatoer og ugyldige data. Ingen endring av lagrede
  beløp for å få dokumentene godkjent.
- Kontroll av at API-nøkler og lagret XML ikke lekker gjennom offentlig
  leverandøroppsett, registervisning eller revisjonshistorikk. Generisk
  sletting/endring av leveringshistorikk er fortsatt sperret.
- Fast HTTPS-leverandøradresse, sertifikatkontroll, ingen fulgte
  omdirigeringer og ingen automatisk e-postreserve eller omlevering.
- Pip-audit mot de fastlåste Python-bibliotekene i serverpakken fant ingen
  kjente sårbarheter i den brukte databasen ved kontrolltidspunktet.

Testlogger ligger lokalt i `build/ehf-audit-*.log` og JSON-rapporter sammen
med dem. `tests/test_ehf_security.py` gjenskaper feil- og samtidighetstilfellene;
de første åtte gjenskapingsprøvene feilet før rettelsene. Tester for PC/Tk
og nettleser bruker samme server-API og valideringsmotor.

## Avgrensning

Dette er en kode- og testgjennomgang, ikke en garanti mot alle sikkerhetsfeil,
en ekstern sertifisering eller en full penetrasjonstest av en produksjonsserver.
Ingen ekte Recommand-konto eller produksjonssending gjennom Peppol var
tilgjengelig. Leverandørsvar simuleres; offisiell XML-kontroll kjøres reelt.
Fysisk ARM-enhet, Safari/iPad og OS-tjenester i en kundes installasjon er
ikke prøvd. Debian/Java-oppdateringer må fortsatt vedlikeholdes på serveren;
Python-skanningen er ikke en skanning av alle systempakker.

eFaktura er fortsatt kun klargjort, og krever en fremtidig leverandørintegrasjon.
Oppdater server og PC til 0.91.1, start serveren på nytt og last nettklienten
på nytt. Privat Hosting Manager følger samme motor og beholdes lokalt.

Tekniske kontrakter kontrollert mot primærkilder:

- [Recommand: sending og leveringsstatus](https://docs.recommand.eu/docs/sending-invoices)
- [Recommand: mottakerkontroll](https://docs.recommand.eu/docs/verifying-recipients)
- [Peppol BIS Billing 3.0](https://docs.peppol.eu/poacc/billing/3.0/)
- [Pip-audit](https://github.com/pypa/pip-audit)
