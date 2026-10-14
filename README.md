# Salsy – offisielle installasjonsfiler / official installers

Utvikler og utgiver / developer and publisher: **Thomas Isaksen**.

Last ned fra [nyeste utgivelse](https://github.com/isaksen20/salsy-releases/releases/latest).
Les [bruksanvisningen (PDF)](https://github.com/isaksen20/salsy-releases/releases/latest/download/Salsy-bruksanvisning.pdf).
Dette repositoriet inneholder utgivelsesinformasjon og offentlige installasjonsfiler.
Kildekoden holdes privat. Se [distribusjonsinformasjon](NOTICE.md) og vilkårene
på [norsk](terms-nb.md) / [English](terms-en.md).

| Program | Versjon | Plattform |
| --- | --- | --- |
| Salsy Server | 0.71.3 | Debian 13 amd64 |
| Salsy PC-klient | 0.71.3 | Debian 13 amd64 |
| Salsy Android | 0.30.0 | Android 7+ / arm64 eller x86_64 |
| Salsy Warehouse Android | 0.11.0 | Android 7+ / arm64 eller x86_64 |

Debian-pakkene bruker Python 3.13. Andre Linux-versjoner og Raspberry Pi/ARM
støttes ikke av disse to amd64-pakkene. Nettklientene følger serveren.
For Debian: last ned riktig `.deb` og installer med `sudo apt install ./FILNAVN.deb`.
Ta sikkerhetskopi av serverdata før oppdatering; oppdater server og PC-klient sammen.

Last ned APK på Android og åpne filen. Android kan be om tillatelse til å installere
fra nettleseren. Første offentlige APK har ny signatur: eldre debug/testapper kan
kreve avinstallasjon først. Ta vare på tilkoblingsfilen; lokale appinnstillinger
slettes ved avinstallasjon. Serverdata beholdes. Kommende utgivelser bruker samme
private signeringsnøkkel.

`SHA256SUMS` dekker alle fire installasjonsfilene og PDF-bruksanvisningen. `release.json` inneholder
nedlastingsadresser, versjoner, kontrollsummer og Android-signatur.
Server og PC-klient sjekker GitHub ved oppstart og daglig. Sjekk manuelt under
Oppdateringer i servervinduet / Innstillinger i PC og PC-nettklient. Det er ikke
innført automatisk installasjon av oppdateringer.
Vilkår 1.3 må godtas ved første gangs bruk eller når tidligere godtatte vilkår er endret.

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

Download the four installers from [Releases](https://github.com/isaksen20/salsy-releases/releases/latest).
Source code is private; this is not an open-source release.
Debian packages target Debian 13 amd64 with Python 3.13.
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
and APK signatures. Native desktop GUI and physical Android testing were not
available in the build environment.
