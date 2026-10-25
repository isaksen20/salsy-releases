# Salsy – offisielle installasjonsfiler / official installers

Utvikler og utgiver / developer and publisher: **Thomas Isaksen**.

Last ned fra [nyeste utgivelse](https://github.com/isaksen20/salsy-releases/releases/latest).
Les [bruksanvisningen (PDF)](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-bruksanvisning.pdf).
Dette repositoriet inneholder utgivelsesinformasjon og offentlige installasjonsfiler.
Kildekoden holdes privat. Se [distribusjonsinformasjon](NOTICE.md) og vilkårene
på [norsk](terms-nb.md) / [English](terms-en.md).

| Program | Versjon | Plattform |
| --- | --- | --- |
| Salsy Server | 0.77.22 | Debian 13 amd64 |
| Salsy Server ARM64 | 0.77.22 | Debian 13 arm64 / 64-bits Raspberry Pi OS (trixie) |
| Salsy PC-klient | 0.77.22 | Debian 13 amd64 |
| Salsy PRP (frittstående skiftplanlegger) | 0.2.22 | Debian 13 amd64 |
| Salsy Android | 0.31.1 | Android 7+ / arm64 eller x86_64 |
| Salsy Warehouse Android | 0.11.0 | Android 7+ / arm64 eller x86_64 |

Debian-pakkene bruker Python 3.13. Velg serverfilen for maskinens arkitektur:
`dpkg --print-architecture` viser `amd64` eller `arm64`. ARM64 krever 64-bits OS;
32-bits ARM/armhf og Debian 12 støttes ikke av disse pakkene. PC-klienten er amd64.
Nettklientene og alle serverfunksjoner er de samme på begge serverarkitekturer.
For Debian: last ned riktig `.deb` og installer med `sudo apt install ./FILNAVN.deb`.
Ta sikkerhetskopi av serverdata før oppdatering; oppdater server og PC-klient sammen.

## Brukere og første innlogging / Accounts and first sign-in

Serverens Brukere-fane kan opprette kontoer med valgfri ansattilknytning, roller og
tilganger. Midlertidige passord må byttes før bruk av PC, nett, Android, Warehouse
og PRP. Eksisterende kontoer beholdes. Brukerstøtte: support@salsy.eu.

The server Users tab supports optional employee links and explicit permissions.
Temporary credentials require a password change before application data is accessible.

## Tidligere sikkerhetsrettelser / Previous security fixes

Sikkerhetsrettelsene fra server/PC 0.77.20 og PRP 0.2.20 er beholdt i denne utgivelsen.
Utgivelsen retter delegert tilgangskontroll, oppdaterer medfølgende
sikkerhetsbiblioteker og fjerner GUI-trådfeil på stemplings- og lønnssiden.
Lønnsberegningene endres ikke. Start serverinstanser, PC-klienter og Salsys
egen HTTPS-proxy på nytt etter oppdateringen. Android-installasjonsfilene er uendret.
Les [sikkerhetsinformasjonen / security advisory](SECURITY_UPDATE_0.77.20.md).

## Salsy dependency fix

Last ned [Salsy-dependency-fix.sh](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-dependency-fix.sh)
og åpne en terminal i nedlastingsmappen:

```sh
sh Salsy-dependency-fix.sh --install
```

Hjelpefilen ber om Linux-administratorpassord, oppdaterer APT-pakkelisten og
installerer systemavhengighetene til Salsy Server på Debian 13 (AMD64/ARM64).
Den kan også reparere manglende avhengigheter etter en avbrutt pakkeinstallasjon.
APT får ikke fjerne pakker under reparasjonen. Passordet lagres ikke.
På minimale installasjoner uten sudo spør su etter root-passordet.
Filen installerer ikke Salsy eller Python-pakker med pip og endrer ikke
bedriftsdata, porter, proxyinnstillinger eller APT-kilder.
Python-bibliotekene og Caddy følger med serverens DEB-pakke.
Vanlige Debian-installasjonsskript kan starte systemtjenester.
For kontroll uten installasjon eller passord: `sh Salsy-dependency-fix.sh --check`.
Se [veiledningen](DEPENDENCY_FIX.md) for detaljer.

## Nytt siden 0.75.1

Server/PC 0.77.22 inkluderer PRP i nettklienten og utveksling av ansatte,
regler og skiftplaner. Den frittstående PRP-appen kan brukes uten serverinnlogging.
PRP 0.2.22 har grafisk behovsplanlegging, kompetansekrav, udekket bemanning,
redigering/låsing av vakter, OnCall og PDF-/Excel-/CSV-eksport.
OnCall krever en tilstøtende kveldsvakt og følger valgte kompetansekrav og sperrer.
PDF viser kompetansemarkeringer og felles forklaring/vaktkoder.
Genererte planer kan fortsatt ha udekkede behov og må kontrolleres; generatoren
lover ikke en optimal eller fullstendig plan. Se [PRP-veiledningen](SALSY_PRP.md).

Last ned APK på Android og åpne filen. Android kan be om tillatelse til å installere
fra nettleseren. Første offentlige APK har ny signatur: eldre debug/testapper kan
kreve avinstallasjon først. Ta vare på tilkoblingsfilen; lokale appinnstillinger
slettes ved avinstallasjon. Serverdata beholdes. Kommende utgivelser bruker samme
private signeringsnøkkel.

`SHA256SUMS` dekker alle seks installasjonsfilene, PDF-bruksanvisningen, hjelpefilen og veiledningene. `release.json` inneholder
nedlastingsadresser, versjoner, kontrollsummer og Android-signatur.
Server og PC-klient sjekker GitHub ved oppstart og daglig. Sjekk manuelt under
Oppdateringer i servervinduet / Innstillinger i PC og PC-nettklient. Det er ikke
innført automatisk installasjon av oppdateringer.
Vilkår 1.3 må godtas ved første gangs bruk eller når tidligere godtatte vilkår er endret.

Versjon 0.75.1 gir leder passordresetting i Brukere og tilganger, med avslutning
av brukerens økter. Deaktiverte Ledige vakter, Vaktbytte og Registrer tillegg
skjules også for administratorer i alle klientene. Android er 0.31.1.

Versjon 0.75.0 legger til valgfri Booking i PC, PC-nett, Android og mobilnett.
Ukevisningen har tidsmarkør, individuelle dagsruller og samtidige bookinger.
Brukertilganger skiller visning, oppretting og lederadministrasjon.
Android er oppdatert til 0.31.0. Aktiver Booking i bedriftens Innstillinger.

Versjon 0.74.0 utvider regnskap i både PC-klienten og PC-nettklienten med
reskontro og delbetalinger, MVA-grunnlag fra bokførte poster, lønnsbilag,
anleggsmidler og avskrivning, lagerverdsetting og årsavslutningskontroller.
Regnskap er fortsatt i skygge-/kontrollmodus: komplett årsregnskap,
skattemelding og direkte innsending til myndighetene er ikke implementert.
Bruksanvisningen beskriver arbeidsflytene og begrensningene.
Warehouse Android er uendret.

Versjon 0.71.3 retter systemctl-feil ved aktivering av nye tjenester.

Versjon 0.71.2 retter automatisk oppstart og nye forsøk etter mislykket oppsett.

Versjon 0.71.1 retter serverinstallasjon som feilet med **unsupported PAX tar header**.
Last ned den nye `.deb`-filen; tidligere installasjonsfiler skal ikke brukes.

Fra 0.71.0 kan automatisk OS-oppstart og opplåsing aktiveres per instans under
**Oppstart** i servervinduet. Systemd lagrer maskinbundet kryptert legitimasjon;
root på maskinen kan hente den ut. Nye vilkår godtas for bedriften av administrator
i Salsy PC eller PC-nett, uten lokal serverinnlogging. Se kapittel 15 i PDF.

Fra server 0.70.0 finnes **Domene / offentlig HTTPS → Sett opp HTTPS automatisk …**.
Veiviseren oppretter en separat Caddy-proxy med sudo. Med Apache, Mailcow eller
andre proxyer velges manuell DNS-bekreftelse og en ledig HTTPS-port, for eksempel
9443. Eksisterende proxykonfigurasjon og tjenester endres ikke. DNS/ruter må
settes av administrator; manuelle DNS-sertifikater må fornyes før utløp med samme
veiviser. Hele fremgangsmåten står i kapittel 14.0 i PDF-bruksanvisningen.

## English

Download the installers from [Releases](https://github.com/isaksen20/salsy-releases/releases/latest).
Source code is private; this is not an open-source release.
Server packages target Debian 13 amd64 or arm64 with Python 3.13; the PC package is amd64.
The ARM64 server requires a 64-bit operating system, including Raspberry Pi OS
based on Debian 13/trixie. Server code and web clients are identical on both
architectures. There is no 32-bit ARM package. Check `dpkg --print-architecture`.
Salsy 0.77.22 also includes the shared PRP web planner. Standalone PRP
0.2.22 works offline without a server account; generated schedules may
remain incomplete and require review. See [the PRP guide](SALSY_PRP.md).

Download [Salsy-dependency-fix.sh](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-dependency-fix.sh)
and run `sh Salsy-dependency-fix.sh --install` in the download folder.
It requests Linux administrator authentication, refreshes APT lists and installs
Salsy Server system dependencies on Debian 13 (AMD64/ARM64), with missing-dependency
repair and package removal disabled. Without sudo it uses su and the root password.
It does not store passwords, install Salsy, run pip or change company data,
ports, proxies or APT sources. Standard Debian package scripts may start services.
The DEB already contains Caddy and the Python libraries. `--check` checks without
changes or authentication. Read [the helper guide](DEPENDENCY_FIX.md).

Version 0.75.1 adds administrator password resets with session revocation.
Disabled Open shifts, Shift swaps and Register supplements are hidden for
administrators as well as employees. Salsy Android is updated to 0.31.1.
Version 0.75.0 adds optional Booking to native desktop, desktop web, Android
and mobile web: weekly timelines, independent day scrolling, a live clock
marker, simultaneous bookings and separate view/create/manager permissions.
Enable Booking in company Settings. Salsy Android is updated to 0.31.0.
Version 0.74.0 extends accounting in both desktop clients with open items and
partial payments, ledger-based VAT reports, payroll postings, fixed assets and
depreciation, inventory valuations and year-end controls. Accounting remains in
shadow/review mode; complete annual accounts, tax returns and direct submission
to authorities are not implemented. See the updated manual for limitations.
The Warehouse Android installer is unchanged.
Version 0.71.3 fixes reset-failed errors when enrolling new services.
Version 0.71.2 fixes boot-service configuration and retries after failed setup.
Version 0.71.1 fixes the server package’s unsupported PAX tar headers.
Download the new `.deb` rather than reusing the 0.71.0 server installer.
Android APKs target Android 7+ on arm64/x86_64 and use a permanent release key.
Previously debug-signed apps may require replacement after preserving connection
details. Back up server data before upgrading. Checksums and version metadata are
provided; automatic installation is not implemented.

Server 0.70.0 includes optional automatic HTTPS provisioning with a separate
Caddy service and a provider-independent manual DNS wizard. Use an unused public
port when Apache/Mailcow already runs on the machine. DNS certificates require
manual renewal through the wizard; router/DNS configuration remains external.

Build checks cover packaged server behavior, payroll, backups, source-file absence
and APK signatures. Native desktop GUI and browser workflows were tested with synthetic data.
Physical Android and Raspberry Pi devices were not available for testing.
