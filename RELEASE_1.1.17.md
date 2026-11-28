# Salsy 1.1.17

Sikkerhetsrettelser i den felles serveren for PC, nett og mobil:

- Store filopplastinger kontrollerer nå innlogging før filinnholdet mottas.
  Dette gjelder blant annet kurs, stoffkartotek, kvitteringer og vedlegg.
- Samtidige opplastinger begrenses, og ufullførte forespørsler har tidsgrense.
  Ved opptatt server kan opplastingen prøves igjen etter kort ventetid.
- dnspython er oppdatert til 2.9.2 etter leverandørens sikkerhetsvarsel.
  Den sårbare DNS-soneparseren er ikke påvist brukt gjennom Salsy.
- HTTPS-komponenten Caddy er bygget på nytt med Go 1.26.11,
  OpenTelemetry 1.47.0 og compress 1.20.2 etter nye sikkerhetsvarsler.

PC-klienten og PC-nettklienten bruker samme rettede API. Mobil og Android får
serverrettelsen ved oppdatering av serveren; Android-versjonen er uendret.
Gjennomgangen og begrensningene beskrives i SECURITY_REVIEW_2026-11-28.md.

Etter installasjon må Salsy-serveren og den tilhørende Caddy-/HTTPS-tjenesten
startes på nytt. En vanlig omlasting av Caddy-konfigurasjonen bytter ikke ut
den kjørende programfilen. Ingen endring i eksisterende Caddyfile er nødvendig
for disse rettelsene.

English: Large uploads now authenticate before reading their body, share a
bounded upload budget and time out if their request body remains incomplete.
dnspython is upgraded to 2.9.2; exploitability of its vulnerable zone parser
through Salsy was not established. Caddy is rebuilt with Go 1.26.11,
OpenTelemetry 1.47.0 and compress 1.20.2. All clients use the corrected shared API.
Restart both Salsy Server and its Caddy/HTTPS service after installing. A
configuration reload alone does not replace a running Caddy binary. These
fixes do not require changes to an existing Caddyfile.
