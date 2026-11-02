# Salsy – offisielle installasjonsfiler / official installers

Last ned fra [nyeste utgivelse](https://github.com/isaksen20/salsy-releases/releases/latest).
[Bruksanvisning (PDF)](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-bruksanvisning.pdf) ·
[Utgivelsesnotat 0.85.2](RELEASE_0.85.2.md) ·
[Reise og Utlegg](TRAVEL_EXPENSES.md)

Utvikler og utgiver: **Thomas Isaksen**. Brukerstøtte: support@salsy.eu.
Dette repositoriet inneholder offentlig utgivelsesinformasjon og installasjonsfiler.
Kildekoden holdes privat; ingen åpen kildekodelisens gis. Se
[distribusjonsinformasjon](NOTICE.md) og vilkår på
[norsk](terms-nb.md) / [English](terms-en.md). Tredjepartslisenser følger pakkene.

## Rettet i 0.85.2: ansatt-tilgang til Reise og Utlegg

PC-nettklientens brukerskjema lot ikke leder velge Reise og Utlegg for rollen
Ansatt, og kunne fjerne en eksisterende tilgang ved lagring. Skjemaet bruker
nå samme rettighetsgrunnlag og standardvalg som PC-klienten og serveren.
Nye ansattkontoer får egne reiser og utlegg som standard. Leder kan gi eller
fjerne tilgangen uten å endre rollen til administrator.

For eksisterende kontoer: åpne **Ansettelse → Brukere og tilganger**, velg
brukeren og **Endre valgt konto** (PC) / **Rediger** (PC-nett). Behold rollen
**Ansatt**, velg riktig ansattkobling og kryss av **Reise og Utlegg – egne krav
og kvitteringer**. Lagre og la brukeren logge inn på nytt. Modulen må være
aktivert i Innstillinger. Økonomisk ansvar tildeles fortsatt uttrykkelig;
det er ikke nødvendig for egne krav.

## Reise og Utlegg fra 0.85.1

Ansatte kan laste opp kvitteringer før de lager en reiseregning, registrere
vanlige utlegg uten reise, velge attestant og følge behandlingen. Tilgangen
**Økonomisk ansvar** gir attestering av tildelte krav. Egenattestering er sperret.
PC, PC-nett, mobilnett og Salsy Android bruker samme serverberegning.

**Statens diettsatser er standard.** Leder/admin med lønnstilgang kan uttrykkelig
velge bedriftens egne diettsatser i Innstillinger, med beløp, tidsgrenser og
gyldighetsdato. Offisielle skattegrenser er separate og kan ikke redigeres.
Innsendte og attesterte krav beholder beregningen; berørte utkast må gjennomgås
og lagres på nytt før innsending.

Attesterte krav kan tas med i lønn på valgt utbetalingsdato. Trekkfri refusjon
vises separat fra bruttolønn; trekkpliktig godtgjørelse inngår i trekkgrunnlaget.
Attestasjons-PDF, kvitteringer og beregningsgrunnlag beholdes.

Automatiske reisesatser gjelder vanlige innenlandsreiser i Norge i **2026**,
inntil 28 døgn. Andre land/år bruker dokumenterte utgifter uten automatisk diett.
Forskudd og særtilfeller krever separat behandling. A-melding og betaling skjer
fortsatt manuelt. Les [veiledningen og begrensningene](TRAVEL_EXPENSES.md).

## Nedlasting og oppgradering

| Program | Versjon | Plattform |
| --- | --- | --- |
| Salsy Server | 0.85.2 | Debian 13 amd64 |
| Salsy Server ARM64 | 0.85.2 | Debian 13 arm64 / 64-bits Raspberry Pi OS (trixie) |
| Salsy PC-klient | 0.85.2 | Debian 13 amd64 |
| Salsy PRP, frittstående | 0.2.26 | Debian 13 amd64, uendret fra 0.84.0 |
| Salsy Android | 0.33.1 | Android 7+, arm64 eller x86_64 |
| Salsy Warehouse Android | 0.11.2 | Android 7+, arm64 eller x86_64, uendret |

Ta sikkerhetskopi før oppgradering. Installer ny server- og PC-DEB over eksisterende
pakke med `sudo apt install ./FILNAVN.deb`, start serveren på nytt og last
nettklientene på nytt. Oppdater Salsy Android med den nye signerte APK-filen.
Samme offisielle Android-signatur beholdes. Eldre debug/test-apper kan kreve
avinstallasjon; ta da vare på tilkoblingsinformasjonen først.

Debian-pakkene krever Debian 13 og Python 3.13. Kontroller arkitektur med
`dpkg --print-architecture`: velg amd64 eller arm64. ARM64 krever 64-bits OS;
32-bits ARM/armhf og Debian 12 støttes ikke av disse pakkene. PC-klienten er amd64.
ARM64 og amd64 har samme serverfunksjoner og nettklienter.

Server og PC-klient sjekker GitHub ved oppstart og daglig. Manuell sjekk finnes
under Oppdateringer i serveren og Innstillinger i PC/PC-nett. Oppdateringer
installeres ikke automatisk. `release.json` inneholder direkte nedlastingslenker,
versjoner, SHA-256 og Android-signatur. `SHA256SUMS` dekker utgivelsesfilene.
Privat Hosting Manager følger serverversjonen, men publiseres ikke her.

## Tariff, PRP og regnskap

Tariffarbeidet fra [delutgivelse 0.84.0](RELEASE_0.84.0.md) er beholdt.
**Flyoverenskomsten og Luftfartsoverenskomsten (HK) er fortsatt ufullstendige.**
Kontroller kilder, personkrets, lokale valg og gjenstående dekning før bruk.
En kontrollert enkeltregel gjør ikke hele avtalen fullstendig. Salsy og PRP
kan fortsatt brukes uten tariffavtale.

Se [tariffmaler](TARIFFMALER.md), [luftfartsstatus](AIRLINE_TARIFF_REVIEW.md),
[beregningsstatus](TARIFF_CALCULATIONS_STATUS.md) og [PRP-veiledning](SALSY_PRP.md).
Genererte planer kan ha udekket behov og krever gjennomgang. Regnskap er
fortsatt i kontrollmodus; komplett årsregnskap, skattemelding og direkte
myndighetsinnsending er ikke implementert.

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

Salsy 0.85.2 fixes the desktop web account editor: managers can grant
Travel and Expenses to Employee accounts, existing grants survive editing,
and new accounts get the same defaults as the native PC client and server.
Explicit revocation is preserved. Financial responsibility remains opt-in.
Save the account and sign in again after changing permissions.

Travel and Expenses was introduced in 0.85.1 across desktop, desktop web, mobile web
and Android. Upload receipts independently, create ordinary expense claims or
travel claims, and select an attestor with Financial responsibility. Self-approval
is blocked. State meal allowance rates are the default; a payroll manager/admin
can explicitly enable company amounts, duration thresholds and an effective date.
Official tax limits remain separate. Submitted and approved claims stay frozen.
Approved payroll reimbursements and taxable allowances use the shared server engine.

Automatic allowances cover common domestic travel in Norway in 2026, up to
28 days. Other countries/years use documented expenses without automatic allowances.
Advances and special cases require separate handling; payments and a-melding
submission remain manual. See [the travel guide](TRAVEL_EXPENSES.md).

Back up before upgrading both server and desktop. Restart the server and reload
web clients; update Salsy Android to 0.33.1. PRP 0.2.26 and Warehouse
Android 0.11.2 are unchanged. Native desktop/browser account workflows and ARM64 runtime under QEMU
were tested with synthetic data; no physical Android/iPhone/ARM device or actual
OS boot was tested for this release. Both aviation agreements remain incomplete.
Source code and private hosting installers are not published.
