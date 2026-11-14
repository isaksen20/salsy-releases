# Salsy – offisielle installasjonsfiler / official installers

Last ned fra [nyeste utgivelse](https://github.com/isaksen20/salsy-releases/releases/latest).
[Bruksanvisning (PDF)](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-bruksanvisning.pdf) ·
[Regnskapsfører – bruksanvisning (PDF)](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-regnskapsforer-bruksanvisning.pdf) ·
[Utgivelsesnotat 0.95.6](RELEASE_0.95.6.md) ·
[Ressursstyring](RESOURCE_MANAGEMENT.md) · [Kompetanse](COMPETENCIES.md) ·
[Reise og Utlegg](TRAVEL_EXPENSES.md) · [Kurs](COURSES.md) · [Regnskapsfører](ACCOUNTANT.md) ·
[Ferieoppgjør](VACATION_FINANCE.md) · [Personalverktøy](STAFF_TOOLS.md) · [Bruksstatistikk](USAGE_STATISTICS.md)

Utvikler og utgiver: **Thomas Isaksen**. Brukerstøtte: support@salsy.eu.
Dette repositoriet inneholder offentlig utgivelsesinformasjon og installasjonsfiler.
Kildekoden holdes privat; ingen åpen kildekodelisens gis. Se
[distribusjonsinformasjon](NOTICE.md) og vilkår på
[norsk](terms-nb.md) / [English](terms-en.md). Tredjepartslisenser følger pakkene.

## Nytt i 0.95.6 / New in 0.95.6

Mobilkalenderen på **/app/** og Android **0.35.5** viser **1 ny beskjed** eller
**2 nye beskjeder** som en lenke til **Beskjeder og varsler**. Bare din kontos
uleste, tilgjengelige varsler telles. Markering som sett eller fjerning oppdaterer
antallet; ved null skjules telleren. Den oppdateres automatisk mens kalenderen
brukes og når du kommer tilbake til appen/fanen. Oppdater server og Android,
start serveren på nytt og last mobilnettklienten på nytt.
[Utgivelsesnotater](RELEASE_0.95.6.md) · [Veiledning](STAFF_TOOLS.md).

Mobile web and Android show an own-account unread count linking to the inbox.
The indicator refreshes while visible and is hidden at zero. Existing seen/delete
actions and permission boundaries are retained.

## Dagens minioppgaver fra 0.95.5

Mobilnettklienten på **/app/** og Salsy Android **0.35.4** viser **Dagens
minioppgaver** over kalenderen. Navn, valgfrie tider og beskrivelse vises i
kronologisk rekkefølge. Listen gjelder dagens norske dato, også når du blar
til en annen måned, og skjules uten oppgaver eller når modulen er av.
Androids kalenderoppdatering henter nye tildelinger fra serveren. PC og PC-nett
beholder eksisterende visning inne i kalenderen. Oppdater server og Android,
start serveren på nytt og last mobilnettklienten på nytt.
[Utgivelsesnotater](RELEASE_0.95.5.md) · [Personalverktøy](STAFF_TOOLS.md).

Mobile web and Android show today's assigned mini tasks above the calendar,
chronologically, independently of the browsed month. Android refresh fetches
current assignments. Existing desktop views and access controls are retained.

## Bruksstatistikk fra 0.95.4

Serveren rapporterer automatisk ett tall for aktive kontoer til demoserveren.
Rapporteringen kan slås av i serverfanen **Bruksstatistikk**. Ingen navn,
e-post, klientkode eller bedriftsdata sendes. Tallene er egenrapporterte
kontoer, ikke unike personer; eldre rapporter utløper etter 30 dager.
Mottak må aktiveres på demoserveren etter oppgradering. Les
[veiledningen](USAGE_STATISTICS.md) og [utgivelsesnotatene](RELEASE_0.95.4.md).

Servers report an active-account count by default with an opt-out. Latest
self-reported counts expire after 30 days; no account/company details are sent.
Collection must be enabled on the upgraded demo host.

## Stempling og innloggingsfrister fra 0.95.3

Stemplingskameraet kan startes på nytt etter avbrudd/hengende video. Mobilvalg
**Forbli innlogget** varer maksimalt ni timer fra innlogging. PC og PC-nett logger
ut etter tretti minutter uten brukeraktivitet; bakgrunnshenting teller ikke.
Manuell stempling avviser ugyldige sommertider og identiske tidspunkter.
[Utgivelsesnotater](RELEASE_0.95.3.md) · [Sikkerhetsgjennomgang](SECURITY_REVIEW_2026-11-13.md).

QR video recovery and clock-entry validation improved. Mobile stay-signed-in is
limited to nine hours; PC/desktop web use thirty-minute inactivity sign-out.


## Kronologiske minioppgaver fra 0.95.1

Tildelte minioppgaver i kalenderen sorteres etter starttid, med oppgaver uten
starttid nederst. Rekkefølgen oppdateres også når oppgaver tildeles i det åpne
kalendervinduet. Samme retting gjelder PC, PC-nett og mobil gjennom den felles
serveren. Biblioteket beholder alfabetisk rekkefølge. Oppdater server og PC,
start serveren på nytt og last nettsiden på nytt.

## Ferieoppgjør og utvidet regnskapsførerportal fra 0.95.0

Leder velger datert ferieoppsett: betalt ferie uten samlet trekk, ubetalt ferie
med trekk for planlagte timer, eller samlet ferieoppgjør i valgt måned.
Årsoppgjør forhåndsberegnes og bekreftes per ansatt. Feriepenger og ferietrekk
er separate poster; ordinær lønn beholdes når ferien tas ut ved årsoppgjør.
Kontroller avtalte ferieuker, ekstraferie, tidligere utbetalinger og lokale
beregningsmåter. Utstedt lønn sperrer historiske endringer.
[Veiledning for ferieoppgjør](VACATION_FINANCE.md).

Regnskapsfører har en egen avgrenset redigeringsrettighet til lønnssatser,
lønnstabeller, skattekort, tillegg, kontrakter og ferieoppgjør. Nye kontoer får
rettigheten som standard. Eksisterende eksplisitte tilgangslister beholdes;
leder kan aktivere rettigheten under **Brukere og tilganger**. Økonomisk ansvar
for attestering er ikke et krav for å opprette en regnskapsførerkonto.

Fakturering må være aktivert før fakturaer vises. Regnskapsfører kan velge
**Alle fakturaer (uansett dato)**, åpne dokumentene og eksportere listen til
CSV eller Excel. HR-notater, medisinske opplysninger og avdelingsgrenser
beskyttes fortsatt. Velg én avdeling før lønnsopplysninger endres.
[Regnskapsførerveiledning](ACCOUNTANT.md).

Denne utgivelsen inkluderer også personalverktøyene fra den tidligere lokale
0.94.0-utgaven: Minioppgaver, stemplingslogg og begrunnet bruk av stemplingstid
til lønn, samlet ferieoversikt, korrigering av timebank og OnCall per dag i
skiftplanen. [Veiledning](STAFF_TOOLS.md) · [Endringsliste](RELEASE_0.94.0.md).
Salsy Android 0.35.5 følger med. Oppdater server og PC, start serveren
på nytt og last nettklienten på nytt. Regnskapet er fortsatt skyggeregnskap.

## Fakturainnstillinger og bankavstemming fra 0.92.0

PC og PC-nett har **Fakturainnstillinger** oppe til høyre. Generelt, EHF,
eFaktura, fakturaavstemming og Open Banking / API samles i et eget vindu.
Importer ISO 20022 camt.053/camt.054, Nets OCR giro eller CSV med
forhåndsvisning og duplikatkontroll. Avstem innbetalinger, delbetalinger og
restbeløp; opphev feil koblinger med historikk. KID kan aktiveres for nye
fakturaer etter bekreftet bankavtale. Bedriften kan velge egen API-leverandør,
HTTPS-adresse, autentisering og JSON-feltkoblinger.

Kun lesing av bankdata; ingen betalinger sendes. Bankavtale og samtykke kreves.
BankID/OAuth, tokenfornyelse, mTLS og alle leverandørspesifikke formater er ikke
universelt støttet. Ekte bankintegrasjon er ikke produksjonstestet.
Ingen automatisk bokføring i hovedboken. eFaktura-sending er fortsatt kun
klargjort. Oppdater server og PC, restart serveren og last nettklienten på nytt.
Les [veiledningen for fakturaavstemming](INVOICE_RECONCILIATION.md).

## EHF og sikkerhetsrettelser fra 0.91.1

PC og PC-nett har lokal EHF-kontroll, XML-eksport og Recommand-integrasjon.
Sending krever bedriftens egen avtale og API-tilgang; testmiljø er standard.
Kunder velges som Privatkunde eller Bedriftskunde. eFaktura er kun klargjort.
Miljøbundet sendebekreftelse, aktive sendesperrer, atomisk lagring, tryggere
statusoppdatering og feilbehandling inngår i denne utgivelsen. Produksjonssending
har ikke vært tilgjengelig for testing. Oppdater både server og PC, restart
serveren og last nettklienten på nytt. Java/Saxon installeres som avhengigheter.
Les [EHF-veiledningen](EHF.md) og [sikkerhetsgjennomgangen](SECURITY_REVIEW_2026-11-09.md).

## Kursfiler og fjerning av tildeling fra 0.90.0

Leder kan velge **Fjern tildeling** fra kursstatus på PC og PC-nett. Tilgangen stoppes,
mens tidligere forsøk og resultater beholdes i serverens historikk. Fjernede
introduksjoner tildeles ikke automatisk igjen; ordinære kurs kan tildeles på nytt.

**Eksporter kurs (.ksa)** inneholder siste lagrede utkast med lysbilder, bilder,
bakgrunn, prøve/fasit, tidsgrenser, beståttgrense og antall forsøk. Ansatte og
resultater følger ikke med. **Importer kurs (.ksa)** oppretter et nytt upublisert
utkast som leder kontrollerer, publiserer og tildeler. Filen er ikke kryptert og
inneholder fasit: del den bare med kursholdere. Maks 40 MiB og 24 MiB bilder.
Les [kursveiledningen](COURSES.md).

## Større lysbilder og prøveforsøk fra 0.89.1

Kurs bruker mer av skjermen i PC, PC-nett og mobilnett, med fullskjerm og
zoom/panorering av kursbilder. Android 0.35.5 viser større kursbilder og
har fullskjerm med knipezoom.

Leder velger **Antall prøveforsøk** i kursbyggeren, med **2 som standard**.
Etter siste feilslåtte forsøk vises **Du har ikke bestått, kontakt din leder**.
Serveren sperrer egen omstart; leder med kurstilgang kan nullstille kurset og
gi en ny runde. Tidligere forsøk og nullstillinger beholdes. Eldre kurs uten
feltet får to forsøk, og tidligere fullførte forsøk teller med.
Introduksjonskursene har fortsatt ingen prøve. Les [kursveiledningen](COURSES.md).

## PowerPoint-kurs og introduksjoner fra 0.89.0

Importer PPTX i **Kurs** i PC-klienten og PC-nettklienten. Presentasjonen blir
et nytt utkast med ett bilde per lysbilde; legg til prøve etterpå om ønskelig.
Skjulte lysbilder tas også med. Importen støtter inntil 20 MiB og 100 lysbilder.
Animasjon, video og lyd blir ikke interaktive kurselementer. Konverteringen
bruker LibreOffice/Poppler i en nettverksisolert Bubblewrap-sandkasse og krever
nye systemavhengigheter som følger serverpakkens avhengighetsliste.

Når Kurs aktiveres, tildeles illustrerte introduksjoner automatisk: ni
innholdssider for leder/admin og seks for ansatte på mobil, på norsk og engelsk.
**Introkursene har ingen prøve.** Også ledere uten ansattilknytning får eget
kurs. Fullføring beholdes når modulen slås av/på. Les [kursveiledningen](COURSES.md).

## Ressursstyring og Kompetanse

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
| Salsy Server | 0.95.6 | Debian 13 amd64 |
| Salsy Server ARM64 | 0.95.6 | Debian 13 arm64 / 64-bits Raspberry Pi OS (trixie) |
| Salsy PC-klient | 0.95.6 | Debian 13 amd64 |
| Salsy PRP, frittstående | 0.2.27 | Debian 13 amd64 |
| Salsy Android | 0.35.5 | Android 7+, arm64 eller x86_64 |
| Salsy Warehouse Android | 0.11.3 | Android 7+, arm64 eller x86_64, uendret |
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

Salsy 0.95.6 sorts assigned mini tasks chronologically in calendars, including
live assignment refresh, with tasks without a start time last. Native PC,
desktop web and mobile use the same corrected server order.

Salsy 0.95.0 introduced dated vacation payment policies and reviewed annual vacation
settlements, with separate holiday pay and salary deductions. Accountants can
be authorized to edit pay rates, pay tables, tax cards, supplements, contracts
and vacation settlements without general HR access. Existing explicit permission
lists are preserved. When invoicing is enabled, accountants can view and export
all invoices, irrespective of date. Native PC and desktop web share the same
server validation and calculations. [Guide](VACATION_FINANCE.md).

The staff tools from the previously local 0.94.0 build are included: mini tasks,
clock logs with reviewed payroll deductions, vacation overview, audited timebank
corrections and daily OnCall selection. Android 0.35.5 is included.
[Staff tools guide](STAFF_TOOLS.md).

Earlier versions added course assignment removal and `.ksa` course exchange in
native PC and PC web. Removal blocks access while retaining historical attempts
and results. Export contains the latest saved draft, images, exam/answer key
and settings, without learner records. Import creates a new unpublished draft
for review and manual publication/assignment. Files are not encrypted; share
only with course administrators. Limits: 40 MiB per file, 24 MiB total images.

Course display improvements from 0.89.1 remain available in native PC, PC web and mobile web,
with full-screen viewing and image zoom/pan. Android 0.35.5 adds larger
course images and full-screen pinch zoom. Managers set the final-exam attempt
limit, defaulting to **two attempts**. After all attempts fail, learners must
contact their manager; the server blocks self-reset. Managers with course
access may grant a new round while retaining attempt/reset history. Older
course versions default to two and count earlier completed attempts.

PPTX import from 0.89.0 remains available in native PC and PC web. Slides become static
images in a new course draft, with an optional exam added afterwards. Conversion
runs in a network-isolated sandbox. Bundled Norwegian/English illustrated
introductions are assigned automatically when courses are enabled: nine content
slides for managers/admins and six for employees on mobile. Neither introduction
has an exam. Android 0.35.5 and mobile web support course completion.
See the [course guide](COURSES.md) for limits and dependencies.

Resource management is available in native PC and PC web. Allocate dated,
fixed-time tasks with competency requirements and priorities by dragging between
employees. Outside a shift, cancel or explicitly extend the shift automatically
or with manually entered times. Shift changes and assignment commit atomically
using shared calendar checks. Employees see only their own tasks in native PC,
PC web, mobile web and Android 0.35.5. A reusable task library will follow.

The Competencies module and PRP 0.2.27 share stable competency and employee IDs,
with employee matrices, colours, plan markers and JSON exchange.
Salsy Kasse 0.1.2 is an early Android/Linux test edition with an offline demo,
tablet-friendly checkout, parked receipts, order retrieval and receipt PDFs.
**It does not perform real payments or alter stock, invoices or accounting.**
Terminal integration and production register requirements remain outstanding.

Back up, upgrade server/PC, restart/reload web clients and update Android.
Native/browser workflows, packaged public/private server flows and ARM64 under
QEMU were tested with synthetic data. No physical Android/iPhone/ARM device or
real systemd boot was tested for this release. Office conversion was tested on
AMD64; the ARM64 Office converter has not been tested. Both aviation agreements remain
incomplete. Source code and private hosting installers are not published.

Leder/admin med brukeradministrasjon kan opprette regnskapsførerkontoer uten Økonomisk ansvar. Avdelingsgrenser og øvrige administratorrettigheter beholdes.


