# Salsy 0.77.19 – PRP og automatisk hjelp med avhengigheter

Denne utgivelsen samler endringene siden 0.75.1, med Salsy Server og PC-klient
0.77.19 og den frittstående skiftplanleggeren Salsy PRP 0.2.19.

- PRP kan brukes frittstående på PC, eller som nettapp når bedriften aktiverer modulen i Salsy.
- Grafisk behovsplanlegging, kompetansematrise, standardbehov og unike dager,
  ukentlig planlegging, låste vakter og synlig udekket bemanning.
- Planer og ansatte kan utveksles med Salsy. PDF, Excel og CSV støttes.
- PRP inkluderer kompetansemarkeringer, kvarterbaserte vakttider og oppdatert
  PDF-layout med felles forklaring og vaktkodeoversikt.
- OnCall krever en tilstøtende kveldsvakt og følger kompetansekrav og sperret
  arbeidsoppgave. Ekstra O i vaktkoden forklares i tegnforklaringen.
- «Salsy dependency fix» med norsk og engelsk veiledning følger med som egen nedlasting.

Genererte planer kan fortsatt ha udekkede behov og krever gjennomgang.
Generatoren garanterer ikke en optimal eller fullstendig plan.

## Installasjonsfiler

| Program | Versjon | Plattform |
| --- | --- | --- |
| Salsy Server | 0.77.19 | Debian 13 AMD64 |
| Salsy Server ARM64 | 0.77.19 | Debian 13 ARM64 / 64-bits Raspberry Pi OS 13 |
| Salsy PC-klient | 0.77.19 | Debian 13 AMD64 |
| Salsy PRP | 0.2.19 | Debian 13 AMD64 |
| Salsy Android | 0.31.1, uendret | Android 7+, ARM64/x86_64 |
| Salsy Warehouse Android | 0.11.0, uendret | Android 7+, ARM64/x86_64 |

Ta sikkerhetskopi av serverdata før oppdatering. Oppdater server og PC-klient
sammen. Last ned riktig DEB og kjør `sudo apt install ./FILNAVN.deb` fra
nedlastingsmappen. Du trenger normalt ikke avinstallere den gamle pakken.
Serverens nettklienter følger med serverpakken. Start serveren på nytt etter
oppdatering og last nettklienten på nytt.

PRP trenger ikke Salsy Server installert. Begge Android-appene bruker samme
offisielle signeringsnøkkel som forrige offentlige utgivelse.

## Salsy dependency fix

Last ned **Salsy-dependency-fix.sh**, åpne terminalen i nedlastingsmappen og kjør:

```sh
sh Salsy-dependency-fix.sh --install
```

Hjelpefilen ber om Linux-administratorpassord, oppdaterer APT-pakkelisten og
installerer systemavhengighetene til Salsy Server på Debian 13 (AMD64/ARM64).
Den kan også reparere manglende avhengigheter etter en avbrutt installasjon.
APT tillates ikke å fjerne pakker. Passordet lagres ikke. På minimale systemer
uten sudo brukes su med root-passordet.

Filen installerer ikke Salsy, kjører ikke pip og endrer ikke bedriftsdata,
porter, proxyinnstillinger eller APT-kilder. Python-bibliotekene og Caddy følger
allerede med serverpakken. Vanlige Debian-installasjonsskript kan starte
systemtjenester. Filen oppgraderer ikke eldre Debian-utgaver til Debian 13.

Kun kontroll, uten endringer eller passord:

```sh
sh Salsy-dependency-fix.sh --check
```

Se **DEPENDENCY_FIX.md**, **SALSY_PRP.md** og **Salsy-bruksanvisning.pdf** blant
nedlastingene. **SHA256SUMS** dekker installasjonsfilene, PDF-en, hjelpefilen og
veiledningene. **release.json** oppgir versjoner, nedlastingsadresser og kontrollsummer.

## English

Salsy Server and desktop 0.77.19 include the shared PRP web planner.
Standalone PRP 0.2.19 works without a Salsy Server account and includes graphical
demand planning, skills, locked shifts, uncovered demand and PDF/Excel/CSV exports.
OnCall requires immediately preceding evening work and obeys qualification and
excluded-duty settings. Generated schedules may remain incomplete and need review;
the generator does not guarantee an optimal solution.

Server packages target Debian 13 AMD64 and ARM64; desktop and standalone PRP
target AMD64. Android installers are unchanged (Salsy 0.31.1, Warehouse 0.11.0).
Back up before upgrading, update server and desktop together, restart the server
and refresh web clients. Install DEBs using `sudo apt install ./FILENAME.deb`.

The separately downloadable **Salsy-dependency-fix.sh** requests administrator
authentication and installs Salsy Server's system dependencies through APT on
Debian 13. Run `sh Salsy-dependency-fix.sh --install`, or use `--check` for a
read-only check. It can repair missing dependencies, disallows package removal,
and does not store passwords, install Salsy, run pip or alter company data,
ports, proxies or APT repositories. Standard Debian package scripts may start
services. Without sudo, su requests the root password. The helper does not
upgrade older Debian releases. Read **DEPENDENCY_FIX.md** for details.

The release contains public installers and documentation. Salsy application
source code and the private hosting manager are not included.
Physical Android, Raspberry Pi and Safari devices were not available for testing.
