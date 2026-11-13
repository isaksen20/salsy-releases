# Salsy 0.95.4 – Bruksstatistikk

Serveren kan rapportere **antall aktive brukerkontoer** til demoserveren.
Automatisk rapportering er på som standard og kan slås av i den nye serverfanen
**Bruksstatistikk**. Bare ett antall og en tilfeldig installasjons-ID sendes;
en egen rapportnøkkel beskytter oppdatering/sletting uten å gi kontotilgang.
Ingen navn, e-post, klientkode, passord eller bedriftsdata sendes. HTTPS brukes;
mottakeren ser nettforbindelsens IP, men statistikkdatabasen lagrer den ikke.

Første rapport forsøkes etter fem minutter og deretter høyst daglig. Feil stopper
ikke Salsy. Tidligere tall kan fjernes uttrykkelig etter avslag, ellers utløper
de etter 30 dager. Avdelinger telles samlet innenfor serverinstansen.
Tallene er egenrapporterte aktive kontoer, **ikke unike personer**.

Den private Hosting Manager har lokal oversikt over totaler og en kontroll for
å aktivere mottak på valgt lokal instans. **Installer oppdateringen og aktiver
mottak på demoserveren før tall kan samles.** Ingen offentlig total-API finnes.
Privat pakke beholdes lokalt og følger ikke GitHub-utgivelsen.

[Veiledning for bruksstatistikk](USAGE_STATISTICS.md) og oppdatert bruksanvisning
følger med. Oppdater server og PC, start serveren på nytt og last nettklienten
på nytt. Server for amd64 og ARM64 bruker samme funksjoner. Mobilappene og PRP
beholder versjonene fra 0.95.3; rettelsene for kamera og innloggingsfrister beholdes.
Regnskap er fortsatt skyggeregnskap; ufullstendige tariffmaler er fortsatt merket.

## English

Automatic active-account reporting is enabled by default, with a server-side
opt-out and optional explicit removal. Only a count, random installation ID
and independent reporting credential reach the fixed HTTPS demo endpoint.
No account/company details are sent. The connection exposes its source IP;
the statistics database does not retain it. Latest counts expire after 30 days.
The figures are self-reported accounts, not unique people. Reporting errors never
block operations. The private Hosting Manager provides local totals and collector
activation; the demo host must be upgraded and collection enabled before use.
Private packages remain local. Existing camera/session fixes are retained.
