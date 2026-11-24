# Salsy 1.1.7 – arbeidsordre og synlig vaktstatus

Oppdater Server og PC til **1.1.7**, Android til **0.41.0**, start serveren på nytt og last nettappene på nytt. Ingen ny Caddyfile kreves.

## Arbeidsordre

Aktiver **Innstillinger → Tilleggsmoduler → Aktiver Arbeidsordre for bedriften**. Modulen er avslått som standard. Rettigheten **Arbeidsordre** gir opprettelse, visning og fullføring. **Administrere arbeidsordre og påkrevde felt** gir oppsett og redigering av alle åpne ordre.

**Ny arbeidsordre** åpner et vindu for navn, beskrivelse, kunde/kontakt, utstyr eller registreringsnummer, arbeidssted, referanse, prioritet, frist og tildelte ansatte. Leder velger obligatoriske felt og kan legge til egne tekstfelt. Navn kreves alltid. Hver ordre beholder feltoppsettet fra opprettelsen, også etter senere oppsettsendringer.

Listen viser **Ikke utførte**. Velg **Mine arbeidsordre** eller **Alle arbeidsordre**, søk og åpne ordren med dobbeltklikk/Enter på PC eller ett trykk på mobil. **Fullfør arbeidsordre** registrerer utført arbeid, bruker og tidspunkt og flytter ordren til **Fullførte**. Fullførte ordre beholdes som skrivebeskyttet historikk. Ordrene oppretter ikke lønn, lageruttak eller faktura automatisk.

Oppretter, tildelte ansatte og leder med administrasjonstilgang kan redigere åpne ordre. Ansatte med modultilgang kan fullføre alle ordre i valgt avdeling. Avdelinger har adskilt oppsett, ordrenummer, tildelinger og historikk. Samtidige endringer gir varsel fremfor overskriving.

## Synlig vaktstatus

Åpne en vakt i Kalender og velg **Endre vaktstatus**: **På jobb**, **Kurs**, **Annet oppdrag** eller **Møte**. Ansatte kan endre egne vakter; vaktadministrator kan endre synlig status på andres. IT-ansvarlig med vaktadministrasjon kan gjøre denne synlige endringen uten å få rett til å registrere arbeidstimer for andre.

Status vises i kalender og vaktbok og endrer **ikke vakttider, betalte timer, lønn, timebank eller fravær**. Godkjent ferie og fravær beholdes i vaktboken. Bruk fraværsmodulen for reelt fravær.

## Kontroll og avgrensninger

Kontrollert med syntetiske data: API-validering, tilgangsbegrensninger, avdelingsskille, samtidige endringer, uendret lønnsgrunnlag, PC-/nettparitet, native PC, PC-nett og mobilnett med norsk/engelsk og mørk modus. Android er bygget og broens tilgangsgrenser er automatisk testet. Pakkede ressurser, ARM64 og privat serveradministrasjon kontrolleres før publisering. Fysisk Android/iPhone, Raspberry Pi og faktisk systemd-oppstart er ikke testet i denne runden.

Tariffavtalenes ufullstendige kontrollstatus og Kasses teststatus beholdes. Hosting Manager inngår ikke i GitHub-utgivelsen.

## English

Work orders are an optional module across native PC, desktop/mobile web and Android. Managers configure required/custom fields; each order retains its original form. Orders support deadlines, priorities, employee assignment, search, My/All views and immutable completion details. Department boundaries and optimistic concurrency are enforced on the shared server.

Informational shift labels (Working, Course, Other assignment, Meeting) appear in calendars and rosters without changing paid hours, payroll, time bank or absence. Private hosting installers are excluded from GitHub.
