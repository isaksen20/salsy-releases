# Salsy 0.85.1 – Reise og Utlegg, statlige og egne diettsatser

Server og PC-klient **0.85.1**, Salsy Android **0.33.1**. Denne utgivelsen tar
med hele den nye Reise og Utlegg-modulen og innstillingene for egne diettsatser.
Frittstående PRP **0.2.26** og Warehouse Android **0.11.2** er uendret fra 0.84.0.

## Reise og vanlige utlegg

- Last opp kvitteringer før en reiseregning opprettes. Mobilen kan velge fil
  eller ta bilde; JPEG, PNG og PDF støttes.
- Velg **Utlegg** for vanlige innkjøp for bedriften, uten å registrere en reise.
  Angi hva kjøpet gjelder, beløp og om den ansatte skal ha refusjon.
- Reiseregning har formål, reiserute, avreise/hjemkomst, overnatting, måltider,
  kilometergodtgjørelse og kvitteringer. Dokumentasjon av valutakurs kreves ved
  utenlandsk valuta.
- Velg attestant med den nye tilgangen **Økonomisk ansvar**. Attestanten kan
  attestere, returnere eller avslå tildelte krav. Egenattestering er sperret.
  Vanlige ansatte ser sine egne krav; avdelings- og lønnstilganger gjelder.
- PDF viser bilagsgrunnlag, beregning og bekreftelser. Godkjente krav låses.
  Krav merket for lønn inngår på valgt utbetalingsdato, med trekkfri refusjon
  separat fra trekkpliktig godtgjørelse. Regnskapsgrunnlaget unngår dobbel
  kostnadsføring av refusjonen ved lønnsoppgjør.

PC, PC-nettklient, mobilnett og Android bruker den samme serverberegningen.

## Diettsatser: statens satser som standard

**Innstillinger → Reise og Utlegg – diettsatser** bruker statens satser inntil
leder/admin med lønnstilgang uttrykkelig velger **Bedriftens egne satser**.
Ved egne satser angis lav/høy dagsats, overnattingssats, tidsgrenser og datoen
satsene gjelder reiser startet fra. Før denne datoen brukes statens satser.

Offisielle skattegrenser kan ikke redigeres. Kilometergodtgjørelse, nattillegg,
kvitteringsrefusjon og måltidsfradrag beholdes. Salsy viser trekkfri, trekkpliktig
og samlet utbetaling hver for seg. Gå tilbake til statens satser for å slå av
bedriftssatsene; innlagte verdier beholdes uten å brukes.

Innsendte og attesterte krav beholder sin lagrede beregning. Berørte utkast må
kontrolleres, beregnes og lagres på nytt før innsending etter en satsendring.

## Oppgradering og nedlasting

Ta sikkerhetskopi av serverdata. Installer riktig server-DEB og PC-DEB over
eksisterende pakker med `sudo apt install ./FILNAVN.deb`. Start serveren på nytt,
last nettklientene på nytt og oppdater Salsy Android med APK-en fra utgivelsen.
Android bruker samme offisielle signatur som tidligere offentlige APK-er.

Serveren finnes for Debian 13 amd64 og arm64. ARM64 krever 64-bits OS, for
eksempel Debian 13 eller Raspberry Pi OS basert på trixie. PC og PRP er amd64.
Android-appene krever Android 7+ på arm64 eller x86_64.

Vedlagt følger oppdatert **Salsy-bruksanvisning.pdf**, **TRAVEL_EXPENSES.md**,
PRP- og tariffveiledninger, dependency-fix-hjelperen med forklaring,
**release.json** og **SHA256SUMS**. Privat Hosting Manager er bygget og
kontrollert for samme serverversjon, men distribueres bare lokalt.

## Kontroll og avgrensninger

85 relevante kilde-/API-regresjoner, 41 tester mot kompilerte pakker og tre
private pakketester bestod. PC-grensesnitt, PC-nett og mobilnett er prøvd med
syntetiske data, også fra ferdige pakker. ARM64-serveren er prøvd under QEMU,
inkludert reise/utlegg, attestering, PDF, lønnsrefusjon og satsbytte.
Android-signaturene, arkitekturdekning og fravær av lesbare Python-kildefiler
er kontrollert. Faktisk dpkg-utpakking er kontrollert i en midlertidig rot.
Fysisk Android/iPhone/ARM-enhet og reell OS/systemd-oppstart er ikke testet her.

Automatisk reiseberegning dekker vanlige innenlandsreiser i Norge i **2026**,
inntil 28 døgn. Andre land og år bruker dokumenterte utgifter uten automatisk
diett. Reiseforskudd, særtilfeller og korreksjon etter attestering krever
separat dokumentert behandling. Attestering er ikke en kvalifisert elektronisk
signatur. A-melding og betaling leveres/utføres fortsatt manuelt; kontroller
inntektsbeskrivelser og antall før rapportering. MVA-fradrag beregnes ikke
automatisk fra refusjonen. Se reiseveiledningen for øvrige vilkår.

**Tariffavtalene er ikke ferdigstilt i denne utgivelsen.** Flyoverenskomsten
og Luftfartsoverenskomsten (HK) beholder ufullstendig-status og sine kilde-
og dekningsmerknader. Drift uten tariffavtale er fortsatt mulig. Regnskap
beholder kontrollmodus; komplett årsregnskap, skattemelding og direkte
myndighetsinnsending er ikke implementert.

## English

Salsy 0.85.1 introduces Travel and Expenses across desktop, desktop web, mobile
web and Android 0.33.1. Upload receipts separately, register ordinary business
expenses without a trip, or create travel claims with mileage, lodging and
provided meals. A designated user with Financial responsibility reviews
assigned claims; self-approval is blocked. Approved claims retain their
calculation and may feed payroll with tax-exempt refunds shown separately.

State meal allowance rates are the default. A payroll manager/admin may
explicitly enable company rates, duration thresholds and an effective date in
Settings. Official tax limits stay separate; submitted/approved claims remain
frozen, and changed drafts require review and saving before submission.

Back up, upgrade both server and desktop, restart the server, reload web
clients and update Android. Standalone PRP 0.2.26 and Warehouse Android 0.11.2
are unchanged. Automatic allowances cover common domestic travel in Norway
in 2026 up to 28 days. Other countries/years, advances and special cases need
separate handling. Payments and a-melding submission remain manual. Both
aviation agreements remain incomplete. No physical mobile/ARM device or real
OS boot was tested. Application source and private hosting installers remain
private.
