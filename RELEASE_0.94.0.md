# Salsy 0.94.0 – Minioppgaver og personalverktøy

- Valgfri Minioppgaver-modul med oppgavebibliotek og tildeling fra Kalender og
  Vaktbok. Navn, beskrivelse og valgfrie tider vises under den ansattes vakt,
  også på Android og i mobilnettklientene.
- Stemplinger i kalenderen og dagslogg per ansatt. Leder kan forhåndsvise og
  begrunne bruk av stemplingstid til lønn. Kun manglende tid innenfor oppsatt
  vakt trekkes. Original plan og stemplinger beholdes. Utstedte lønnsslipper
  sperrer endring; tilbakestilling krever ny begrunnelse.
- Samlet Ferie-fane på lederlinjen: grønne/røde/blå statusprikker og faste navn
  ved horisontal skrolling.
- Begrunnet korrigering av timebanksaldo med endringshistorikk og kontroll mot
  samtidige endringer.
- OnCall direkte per dag i skiftplanen, også ved fast arbeidstid og fridager.
  Standardtider og daglige overstyringer, 25 % som standard beregningsandel.
  08–16 gir automatisk 16–08 neste dag når andre tider ikke er valgt.
- Samme API og lønns-/timeberegning i offentlig server, PC, PC-nett og privat
  Hosting Manager. Modulvalg, rettigheter og avdelingsskille gjelder fortsatt.

Oppdater server og PC til 0.94.0 og Salsy Android til 0.35.2. Start serveren
på nytt og last nettsiden på nytt. Se STAFF_TOOLS.md og bruksanvisning kapittel 27.
Hosting Manager 0.94.0+hosting.1 er kun lokal og installeres sammen med den
matchende serverpakken i én APT-kommando. Ingen endring av Caddyfile kreves.

Andre komponenter og korrekt merking av ufullstendige tariffavtaler videreføres.
