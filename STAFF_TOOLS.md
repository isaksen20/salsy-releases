# Minioppgaver, ferieoversikt, timebank og stempling / Staff tools

Brukerstøtte i Innstillinger har en klikkbar lenke til **https://salsy.eu/** under
**support@salsy.eu** i PC-programmet, PC-nettklienten, mobilnettet, Warehouse og
Android-appene, inkludert Kasse. Regnskapsførersiden har kontaktfelt nederst.
PRP har en Brukerstøtte-knapp med samme kontaktinformasjon. Nettklientene åpner
nettsiden i en ny fane; programmene bruker enhetens nettleser.

Support in Settings includes a clickable **https://salsy.eu/** below
**support@salsy.eu** across PC, web, Warehouse and Android, including Checkout.
The accountant workspace has a contact panel at the bottom; PRP has a Support
button. Web clients open a new tab; native apps use the device browser.

Fra / Since server and PC **0.94.0**, Salsy Android **0.35.2**.

## Norsk

Se kapittel 27 i `SALSY_BRUKSANVISNING.md` for full norsk brukerveiledning.
Aktiver Minioppgaver i Innstillinger. Leder oppretter oppgaver med navn og
valgfrie beskrivelser/tider. Tildel fra vakten i Kalender eller Vaktbok.
Bibliotekendringer endrer ikke allerede tildelte kopier. Ansatte ser egne
oppgaver i kalenderens dagsvindu, også på Android og mobilweb.

Lederfanen Ferie samler ferieønsker med faste navn til venstre. Prikkene er
grønne (godkjent), røde (avslått) eller blå (ubehandlet). Rediger timebank
bruker ny saldo og obligatorisk begrunnelse; historikken beholdes.

Stempling vises `10:00 - 16:00`, eller `10:00 - --:--` til utstempling.
Registrerte stemplinger endrer ikke lønn automatisk. Leder forhåndsviser og
begrunner bruk av stemplingstid. Bare manglende tid innenfor oppsatt vakt
reduserer betalt tid; ekstra timer må godkjennes på vanlig måte. Original
skiftplan og stemplinger beholdes. Aktiv beslutning må tilbakestilles med
begrunnelse før kildedata/fravær endres. Utstedte lønnsslipper sperrer endring.
Klokkeomstilling og ufullstendig/uklar stemplingsrekkefølge må avklares manuelt.
Tidsavgrensede tariffkalendertillegg krever plassert ubetalt pause.

OnCall kan velges per dag, også med fast arbeidstid og på fridager.
Tomme standardtider gir vaktslutt til neste start (08–16 gir 16–08 neste dag);
fridager bruker 00–24. Velg egne tider per dag eller felles standardtider.
Oppsatt beredskap kan ikke overlappe vakter eller andre OnCall-perioder.
Ved forlengelse til neste måned beholdes standardene, men dagene velges på nytt.

Rettigheter: Minioppgaver, OnCall og stemplingsbeslutninger krever
`manage_schedule`; ferieoversikt og timebankkorrigering krever `manage_leave`.
Hver avdelings data og innstillinger holdes adskilt. Ansatte ser bare egne
minioppgaver og egne stemplinger. Begge serverutgaver bruker samme motor.

## English

Enable **Mini tasks** in Settings. Managers create named tasks with optional
descriptions and times, then assign them from a shift in Calendar or Roster.
The desktop browser shows a task panel beside the shift; native PC opens a
selection window. Existing assignments keep their original text when library
templates change. Employees see their tasks below the shift in the calendar
day view, including Android and mobile web.

The manager **Vacation** tab shows employees vertically and their requests
horizontally. Names remain fixed when scrolling. Green means approved, red
rejected, blue pending. **Edit time bank** records a new balance and mandatory
reason while preserving the existing ledger and pending reservations.

Clock times appear as `10:00 - 16:00`, or `10:00 - --:--` until clock-out.
They do not change pay automatically. A manager must preview **Use clock
times**, supply a reason, and approve. Only missing time inside the scheduled
shift reduces paid time. Extra work outside that shift follows the existing
approval workflow and is never credited automatically. The original schedule
and raw punches are preserved. Restore scheduled pay with a reason before
editing those sources or adding conflicting leave. Issued payslips block
changes. Daylight saving dates and incomplete/ambiguous punch sequences need
manual review. Time-banded contractual calendar premiums require the unpaid
break to be located.

Select **OnCall** per date in the shift planner, including fixed hours and days
off. Blank defaults mean shift end until the following start (08–16 becomes
16–08 next day); a day off defaults to 00–24. Override the shared or individual
times as needed. Standby cannot overlap ordinary shifts or another standby
period. Plan renewal retains defaults but requires new daily selections.

Managers need `manage_schedule` for tasks, standby and clock-pay decisions;
`manage_leave` for vacation overview and balance corrections. Employees only
see their own task assignments and punches. Department boundaries are enforced
by the shared server in both public and private editions.

## Sortering av tildelte minioppgaver / Assigned mini-task order (0.95.1)

I kalenderen vises tildelte minioppgaver etter starttid, fra tidligst til senest.
Ved lik starttid brukes sluttid og deretter navn. Oppgaver uten starttid vises
nederst. Dette gjelder også når leder legger til eller fjerner en oppgave mens
kalendervinduet er åpent. Biblioteket beholder alfabetisk sortering.

Assigned mini tasks appear chronologically by start time, then end time and
name. Tasks without a start time appear last. The same order applies after
live assignment changes in native PC, desktop web and mobile calendar views.
The task library remains alphabetical.


## Stemplingskamera og økter / Camera and sessions (0.95.3)

QR-leseren kan startes på nytt ved hengende video eller etter bakgrunn. Ingen
kamerabilder sendes til serveren. Manuell stempling avviser ikke-eksisterende
tider ved sommertid og to stemplinger på samme tidspunkt. Mobilvalg **Forbli
innlogget** gjelder maksimalt ni timer; PC og PC-nett logger ut etter tretti
minutter uten brukerinteraksjon, uavhengig av bakgrunnshenting.

The shared browser QR reader offers recovery after stalled or interrupted video.
Manual punches reject nonexistent daylight-saving times and equal timestamps.
Optional mobile sessions last at most nine hours. PC and desktop web sign out
after thirty minutes without user interaction; polling does not extend idle time.


## Dagens minioppgaver på mobil – 0.95.5 / Android 0.35.4

Mobilnettklienten på `/app/` og Salsy Android viser **Dagens minioppgaver**
over kalenderen når den valgte ansatte har tildelte minioppgaver i dag.
Listen viser navn, eventuelle tider og beskrivelse, sortert etter starttid.
Oppgaver uten starttid vises nederst. Datoen følger norsk tid (Europe/Oslo).
Dagens liste beholdes også når du blar til en annen måned. Uten oppgaver eller
når modulen er deaktivert, vises ingen ekstra liste. Oppgavene finnes fortsatt
under vakten når en kalenderdag åpnes. PC og PC-nett beholder dagens visning
inne i kalenderen. Ingen nye rettigheter eller endringer i tildeling innføres.

English: Mobile web (`/app/`) and Salsy Android show **Today’s mini tasks**
above the calendar, with names, optional times and descriptions. Tasks are
chronological, with tasks without start times last. Today uses Norwegian time
and remains visible while browsing another month. The list is omitted when
empty or disabled. Shift/day details and the existing PC calendar are retained;
all data comes from the same permission-checked calendar API.


## Nye beskjeder på mobilkalenderen – 0.95.6 / Android 0.35.5

Øverst i kalenderen vises **1 ny beskjed** eller **2 nye beskjeder** når den
innloggede brukeren har uleste, tilgjengelige beskjeder eller varsler.
Trykk på telleren for å åpne **Beskjeder og varsler**. Bruk den eksisterende
haken for å markere et varsel som sett, eller krysset for å fjerne det. Å bare
åpne innboksen eller få et systemvarsel levert endrer ikke lesestatus.

Listen hentes ved åpning, omtrent hvert minutt mens kalenderen er synlig,
og når appen eller fanen blir aktiv igjen. Ved null uleste skjules telleren.
Telleren gjelder din konto selv når leder viser en annen ansatts kalender;
rettighetsbegrensede og fjernede varsler telles ikke. Nettverksfeil stopper
ikke kalenderen. Oppdateringen gjelder mobilnett på /app/ og Salsy Android.

English: The mobile calendar's new-message count opens the existing inbox.
Only your readable unseen messages/alerts count, independently of the selected
calendar employee or device delivery cursor. Mark as seen or remove using the
existing actions. Count refreshes on opening, roughly each visible minute, and
when returning to the app/tab. At zero it is hidden; outages do not block Calendar.
