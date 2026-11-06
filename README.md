# Salsy – offisielle installasjonsfiler / official installers

Last ned fra [nyeste utgivelse](https://github.com/isaksen20/salsy-releases/releases/latest).
[Bruksanvisning (PDF)](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-bruksanvisning.pdf) ·
[Utgivelsesnotat 0.88.0](RELEASE_0.88.0.md) ·
[Ressursstyring](RESOURCE_MANAGEMENT.md) · [Kompetanse](COMPETENCIES.md) ·
[Reise og Utlegg](TRAVEL_EXPENSES.md)

Utvikler og utgiver: **Thomas Isaksen**. Brukerstøtte: support@salsy.eu.
Dette repositoriet inneholder offentlig utgivelsesinformasjon og installasjonsfiler.
Kildekoden holdes privat; ingen åpen kildekodelisens gis. Se
[distribusjonsinformasjon](NOTICE.md) og vilkår på
[norsk](terms-nb.md) / [English](terms-en.md). Tredjepartslisenser følger pakkene.

## Nytt i 0.88.0: Ressursstyring og Kompetanse

Aktiver **Ressursstyring og Mine oppgaver** i Innstillinger → Tilleggsmoduler.
Leder får en tidslinje med ansatte, vaktrammer og oppgaver med faste klokkeslett,
detaljer, kompetansekrav og prioritet. Dra oppgaver vertikalt fra oppgaveruten
til en ansatt eller mellom ansatte; klokkeslettet beholdes. Vaktene åpner de
samme handlingene som kalenderen. Datofestede oppgaver kan gå over midnatt.
Et gjenbrukbart oppgavebibliotek kommer senere.

Utenfor vakten tilbys **Avbryt**, **Utvid vakt automatisk** eller **Endre start/slutt
manuelt**. Vaktutvidelse og tildeling lagres samlet med kalenderens kontroller.
Kompetansekrav, overlapp, fravær, GS-arbeidstid og betalt hvile/deldagsfri kontrolleres.
Ansatte får **Mine oppgaver** i PC, PC-nett, mobilnett og Salsy Android og ser
bare sine egne oppgaver. Modulen er valgfri og beholder data ved deaktivering.

Aktiver også **Kompetanse** for å administrere kompetanser og ansattmatrisen.
Fullt navn, forkortelse, farge, planmarkering og krav om sammenhengende dekning
kan overføres til PRP. Salsy og PRP kan importere/eksportere kompetanse som JSON;
ansatte kobles med samme ansatt-ID. [Veiledning](COMPETENCIES.md).

## Salsy Kasse – tidlig testutgave

Separat Android-/Linux-app med servertilkobling og frakoblet demo, store
vareknapper, søk, handlekurv, parkert kvittering, ordrehenting og A4/58/80 mm
PDF-utskrift. Android er tilpasset nettbrett og kasseskjermer på 10 tommer eller
mer. **Kun testing: ingen reelle betalinger, lagerendringer, fakturaer eller
regnskapsposter.** Kortterminal og øvrige krav før virkelig kassebruk gjenstår.
Les [testveiledningen](SALSY_KASSE.md).

## Nedlasting og oppgradering

| Program | Versjon | Plattform |
| --- | --- | --- |
| Salsy Server | 0.88.0 | Debian 13 amd64 |
| Salsy Server ARM64 | 0.88.0 | Debian 13 arm64 / 64-bits Raspberry Pi OS (trixie) |
| Salsy PC-klient | 0.88.0 | Debian 13 amd64 |
| Salsy PRP, frittstående | 0.2.27 | Debian 13 amd64 |
| Salsy Android | 0.34.0 | Android 7+, arm64 eller x86_64 |
| Salsy Warehouse Android | 0.11.2 | Android 7+, arm64 eller x86_64, uendret |
| Salsy Kasse – test | 0.1.2 | Debian 13, Python 3.13 |
| Salsy Kasse Android – test | 0.1.2 | Android 7+, arm64 eller x86_64 |

Ta sikkerhetskopi før oppgradering. Installer ny server- og PC-DEB over eksisterende
pakke med `sudo apt install ./FILNAVN.deb`, start serveren på nytt og last
nettklientene på nytt. Oppdater Android med den nye signerte APK-filen.
Samme offisielle Android-signatur beholdes. Eldre debug/test-apper kan kreve
avinstallasjon; ta da vare på tilkoblingsinformasjonen først.

Debian-pakkene krever Debian 13 og Python 3.13. Kontroller arkitektur med
`dpkg --print-architecture`: velg amd64 eller arm64 for serveren. ARM64 krever
64-bits OS; 32-bits ARM/armhf og Debian 12 støttes ikke av disse pakkene.
PC og PRP er amd64. Begge serverarkitekturer har samme funksjoner og nettklienter.
Kasse Linux er en arkitekturuavhengig tilleggspakke; se dens veiledning om avhengigheter.

Server og PC-klient sjekker GitHub ved oppstart og daglig. Manuell sjekk finnes
under Oppdateringer i serveren og Innstillinger i PC/PC-nett. Oppdateringer
installeres ikke automatisk. `release.json` har direkte nedlastingslenker,
versjoner, SHA-256 og Android-signatur. `SHA256SUMS` dekker utgivelsesfilene.
Privat Hosting Manager følger serverversjonen, men publiseres ikke her.

## Reise, tariff, PRP og regnskap

Reise og Utlegg fra 0.85-serien beholdes: kvitteringer før reiseregning, egne
utlegg, attestering, statlige eller uttrykkelig valgte bedriftsdiettsatser,
tilpasning av store kvitteringsbilder og kopiering av overnattingssted.
Automatiske reisesatser er avgrenset til vanlige innenlandsreiser i Norge i
2026 inntil 28 døgn. Andre land/år og særtilfeller krever separat behandling.
Se [reiseveiledningen](TRAVEL_EXPENSES.md).

**Flyoverenskomsten og Luftfartsoverenskomsten (HK) er fortsatt ufullstendige.**
Kontroller kilder, personkrets, lokale valg og gjenstående dekning før bruk.
En kontrollert enkeltregel gjør ikke hele avtalen fullstendig. Salsy og PRP
kan fortsatt brukes uten tariffavtale. Se [tariffmaler](TARIFFMALER.md),
[luftfartsstatus](AIRLINE_TARIFF_REVIEW.md),
[beregningsstatus](TARIFF_CALCULATIONS_STATUS.md) og [PRP-veiledning](SALSY_PRP.md).
Genererte planer kan ha udekket behov og krever gjennomgang. Regnskap er
fortsatt i kontrollmodus; komplett årsregnskap, skattemelding og direkte
myndighetsinnsending er ikke implementert. Betalinger og myndighetsinnsending
skjer fortsatt manuelt.

## Salsy dependency fix

Last ned [Salsy-dependency-fix.sh](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-dependency-fix.sh)
og kjør `sh Salsy-dependency-fix.sh --install` fra nedlastingsmappen.
Hjelpefilen ber om Linux-administratorpassord, oppdaterer APT-pakkelisten og
installerer systemavhengigheter på Debian 13 amd64/arm64. Den kan reparere
manglende pakkeavhengigheter uten at APT får fjerne pakker. Uten sudo brukes
su og root-passord. Passord lagres ikke. Den installerer ikke Salsy eller pip-
pakker og endrer ikke bedriftsdata, porter, proxykonfigurasjon eller APT-kilder.
Vanlige Debian-installasjonsskript kan starte tjenester. Python-biblioteker og
Caddy følger med serverpakken. `--check` kontrollerer uten endringer eller passord.
Les [hele veiledningen](DEPENDENCY_FIX.md).

## English

Salsy 0.88.0 adds Resource management to native PC and PC web. Allocate dated,
fixed-time tasks with competency requirements and priorities by dragging between
employees. Outside a shift, cancel or explicitly extend the shift automatically
or with manually entered times. Shift changes and assignment commit atomically
using shared calendar checks. Employees see only their own tasks in native PC,
PC web, mobile web and Android 0.34.0. A reusable task library will follow.

The Competencies module and PRP 0.2.27 share stable competency and employee IDs,
with employee matrices, colours, plan markers and JSON exchange.
Salsy Kasse 0.1.2 is an early Android/Linux test edition with an offline demo,
tablet-friendly checkout, parked receipts, order retrieval and receipt PDFs.
**It does not perform real payments or alter stock, invoices or accounting.**
Terminal integration and production register requirements remain outstanding.

Back up, upgrade server/PC, restart/reload web clients and update Android.
Native/browser workflows, packaged public/private server flows and ARM64 under
QEMU were tested with synthetic data. No physical Android/iPhone/ARM device or
real systemd boot was tested for this release. Both aviation agreements remain
incomplete. Source code and private hosting installers are not published.
