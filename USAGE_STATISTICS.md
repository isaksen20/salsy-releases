# Bruksstatistikk fra Salsy 0.95.4

Salsy rapporterer antall aktive brukerkontoer, slik at utvikleren kan få et
anslag på bruken. Dette er egenrapporterte kontoer per serverinstallasjon,
ikke et verifisert antall unike personer. Samme person på to servere kan telle
to ganger. Avdelinger telles samlet én gang innenfor samme serverinstans.
Deaktiverte kontoer og ansatte med avsluttet arbeidsforhold telles ikke som
aktive ansattkontoer. En aktiv administrator uten ansattprofil telles med.

## Hva som sendes

Rapportering er på som standard i den installerte serveren. Første forsøk skjer
etter fem minutter, deretter høyst én gang per døgn. Rapporten har kun to felt:

- Antall aktive kontoer, som ett heltall.
- Tilfeldig installasjons-ID, slik at nye rapporter erstatter forrige tall.

En separat tilfeldig rapportnøkkel beskytter oppdatering og sletting av samme
installasjons tall. Dette er ikke en innloggingsnøkkel til bedriften. Navn,
e-postadresser, organisasjonsnummer, klientkode, brukernavn, passord og
virksomhetsdata sendes ikke. Mottakeren er fast satt til
`https://demo.salsy.eu:7443/api/v1/usage/report`, med HTTPS og sertifikatkontroll.
Mottakeren ser nødvendigvis kilde-IP i nettforbindelsen; statistikkdatabasen
lagrer ikke IP-adressen. Nettverksutstyr/proxy kan ha egne tilgangslogger.
Rapporteringen beskrives derfor ikke som garantert anonym.

Rapporteringsfeil stopper ikke Salsy. Nytt forsøk gjøres tidligst etter en time.
Kun siste rapport per installasjon beholdes, uten historikk. Tall eldre enn
30 dager utelates og slettes når databasen brukes igjen.

## Slå av eller fjerne en rapport

1. Åpne serveradministrasjonen og fanen **Bruksstatistikk**.
2. Fjern haken ved **Send antall aktive brukerkontoer**. Endringen lagres straks.
3. Ingen nye automatiske tall sendes. Tidligere tall utløper etter 30 dager.
4. Vil du fjerne dem nå, trykk **Fjern tidligere rapporterte tall** etter at
   rapportering er slått av. Dette sender en uttrykkelig sletteforespørsel.
   Dersom mottakeren er utilgjengelig, prøv igjen senere eller la tallene utløpe.

Hver instans i Hosting Manager har samme innstilling i sin serverfane.
Installasjons-ID, rapportnøkkel og status lagres i en egen fil ved datafilen,
med filrettighet 0600. Denne filen og mottakerens statistikkdatabase er ikke
bedriftsdata og inngår ikke i bedriftens sikkerhetskopi. En ny installasjon får
ny ID; gammel rapport utløper etter 30 dager. Ved flytting/kloning kan derfor
tall midlertidig overlappe. Ekstra nettverksvern kan stoppe rapportering med
miljøvariabelen `SALSY_USAGE_NETWORK=0` i serverens prosessmiljø.
Kildekodekjøring og pakker som bare pakkes ut til test sender ikke automatisk.

## Aktivere mottak på demoserveren

Dette gjøres én gang på maskinen som kjører demo.salsy.eu, etter installasjon
av server 0.95.4 og matchende privat Hosting Manager. Utgivelsen i seg selv
aktiverer ikke mottak på en allerede kjørende demoserver.

1. Installer server og privat Manager i samme APT-kommando når Manager brukes.
2. Start serverinstansen og logg inn i Hosting Manager med hostingadministrator.
3. Trykk **Bruksstatistikk** i Manager-verktøylinjen.
4. Velg den lokale instansen som svarer på demo.salsy.eu:7443.
5. Kryss av **Ta imot statistikk på valgt instans**. Kontrollen er av som standard.
6. Kontroller at den eksisterende HTTPS-proxyen videresender `/api/v1/usage/report`
   til denne instansen. Ingen ny port trenger åpnes utover eksisterende 7443.
7. **Oppdater** viser aktive kontoer, rapporterende servere og siste mottak.
   Det kan ta ett døgn før alle oppgraderte installasjoner har forsøkt å sende.

Oversikten leses lokalt etter innlogging hos hostingadministrator. Den har
ingen offentlig API for uthenting av tall. Mottakeren godtar strengt avgrensede
rapporter med egen installasjonsnøkkel og rate-/størrelsesgrenser. En rapport
beviser ikke en ekte installasjon; tallene må brukes som anslag, ikke revisjon.
Den offentlige serveren har samme mottaksmotor; Manager gir lokal kontroll og
oversikt. Andre bedrifter skal normalt la mottak være avslått.

## English

Installed Salsy servers report an active-account count by default to the fixed
HTTPS demo endpoint, first after five minutes and at most daily. The body contains
only a random installation ID and one integer. An independent random reporting
key protects updates/deletion, and grants no company/account access. No names,
emails, company identifiers, client codes, passwords or business records are sent.
The connection necessarily exposes a source IP; the statistics database does not
store it. Existing reverse proxies may keep their own access logs.

Disable reporting in the server's **Usage statistics** tab. Optional explicit
removal is available after disabling. Otherwise a report expires after 30 days.
Reporting failure never blocks business operations. Source/extracted test runs do
not report automatically; `SALSY_USAGE_NETWORK=0` suppresses outbound reporting.
Installation identity/statistics are excluded from company backups.

Install both matching DEBs on the demo host, open the private Hosting Manager's
**Usage** button, select the local demo instance, then enable **collection here**.
The existing HTTPS proxy must forward the reporting path. The local master login
protects the summary; no public summary endpoint exists. Figures are self-reported
active accounts, not independently verified installations or unique people.
