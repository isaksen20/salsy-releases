# Ressursstyring / Resource management — Salsy 0.88.0

## Norsk

Aktiver **Ressursstyring og Mine oppgaver** i **Innstillinger → Tilleggsmoduler**.
Modulvalg krever `manage_tasks`. Lederfanen **Ressursstyring** krever lederrolle
og `manage_schedule`. Den finnes i PC-klienten og PC-nettklienten på `/app/salsy/`.
Ansatte med `work_distribution` og ansattilknytning får **Mine oppgaver** i
PC, PC-nettklient, mobilnettklient og Android 0.34.0. De ser bare egne oppgaver.
Deaktivering skjuler sidene og sperrer API-et, men beholder lagrede data.
Avdelinger har separate oppgaver og kompetansetildelinger.

Velg dato mellom pilene. Tidslinjen åpner på arbeidsdagens tidsrom og kan
rulles vannrett til døgnet før og etter. Navn står fast til venstre; like
fornavn får første bokstav i etternavnet. Annenhver rad er grå. Vakter vises
med tykk, ufarget ramme; oppgaver med navn og prioritet inni raden.

**Oppgaver → Ny oppgave** åpner redigering med navn, dato, start, slutt,
detaljer, prioritet 1–10 (10 høyest), aktiv/inaktiv og kompetansekrav fra
Kompetanse-registeret. Kompetansemodulen må aktiveres for å redigere selve
registeret. Uten avkryssing er det ingen kompetansekrav; med flere avkryssinger
må den ansatte ha alle. Oppgaver kan krysse midnatt når slutt er før start.
Redigering, aktivering/deaktivering og sletting finnes i samme oppgavevindu.
Vinduet viser oppgaver som berører den valgte tredøgnsvisningen. Dette er
foreløpig daterte enkeltoppgaver; et gjenbrukbart oppgavebibliotek kommer senere.
Prioriteten vises for leder og ansatt; den gjør ingen automatisk fordeling.

I henhold til skissen heter nedre venstre rute **Info oppgave**, men inneholder
valgt ansatt, kompetanse og vakter, samt valgt oppgave. Nedre høyre rute heter
**Info ansatt**, men inneholder oppgaver som er klare til tildeling på en egen
tidslinje. Dra fra denne ruten til en ansattrad, mellom ansattrader eller
fra en ansatt tilbake til oppgaveruten. Klokkeslett endres aldri av dragging.
Det finnes også en ansattliste og **Lagre tildeling** i informasjonsruten.

Tildeling krever en aktiv ansatt med riktig kompetanse, tilgjengelig arbeidstid
og ingen overlapp med andre aktive tildelte oppgaver. Godkjent fravær trekkes
fra tilgjengeligheten; faktisk GS-arbeidstid brukes ved gradert sykemelding.

**Utenfor vakten** gir et uttrykkelig valg:

- **Avbryt:** Ingen vakt eller tildeling endres. En ledig oppgave blir i ruten.
- **Utvid vakt automatisk:** Se opprinnelige og foreslåtte tider før lagring.
- **Endre start/slutt manuelt:** Skriv tidene selv, og lagre utvidelse og tildeling.

Utvidelsen må dekke hele oppgaven og kan ikke forkorte eksisterende vakt.
Hvis oppgaven krysser midnatt, kan en sammenhengende fortsettelse opprettes
på neste dato. Finnes ingen nærliggende vakt, opprett vakt i kalenderen først.
Vaktutvidelsen påvirker skiftplanen og kan påvirke lønnsgrunnlaget. Den bruker
kalenderens felles kontroller for blant annet overlapper, ekstra timer,
beredskap og beskyttede fraværs-/GS-registreringer. Vakt og tildeling lagres
samlet; endres grunnlaget etter forhåndsvisningen, avvises lagringen til det
kontrolleres på nytt. Det opprettes ingen separat overtidsregistrering automatisk.

Dobbeltklikk/høyreklikk en vakt, eller bruk vaktknappen i informasjonsruten,
for de samme dag-/vakthandlingene som i kalenderen. Nettleser og PC har samme
serverkontroller. Endres kompetanse eller arbeidstid senere, vises varsel ved
berørte tildelinger; eksisterende oppgaver flyttes ikke automatisk.
**Mine oppgaver** viser kronologisk navn, dato, start/slutt, detaljer,
kompetanse og prioritet, med valg av periode på inntil 31 dager.

## English

Enable **Resource management and My tasks** in **Settings → Add-on modules**
(`manage_tasks`). The manager timeline requires an administrator/manager role
and `manage_schedule`, in native PC and PC web (`/app/salsy/`). Linked employees
with `work_distribution` get **My tasks** in native PC, PC web, mobile web and
Android 0.34.0. This endpoint only returns the signed-in employee's tasks.
Disabling the module hides its pages and denies API access without deleting
records. Department data stays separate.

Use the centred date and arrows. The timeline fits the working day and scrolls
into the previous/next day. Employee names stay visible. Shifts have unfilled
thick outlines; alternating rows improve alignment. **Tasks** opens the task
manager: name, date, fixed start/end, details, priority 1–10 (10 highest),
active status and required competencies. All checked competencies are required;
none means no qualification requirement. A finish before start crosses midnight.
These are dated tasks; a reusable task library will follow later.

The sketch's intentionally swapped panel labels are preserved: **Task information**
at bottom left shows the selected employee/shift and selected task;
**Employee information** at bottom right is the unassigned-task timeline.
Drag vertically to allocate, move between employees or return a task to the pool.
Task times never move during dragging. An employee selector offers the same action.

Assignments require qualifications, available work and no conflicting task.
Approved leave and actual graded sick-leave hours are respected. Outside a shift,
choose **Cancel**, **Extend shift automatically**, or **Set start/end manually**.
The preview shows old/new times and a payroll warning. Extensions cannot shorten
existing shifts and may create a contiguous continuation across midnight. Without
a nearby shift, first add one in the calendar. The server reuses calendar checks,
rejects stale previews, and commits shift changes and assignment atomically.
This changes the schedule; it does not automatically create an overtime entry.

Double-click/right-click a shift or use its information-panel button for the
same day/shift actions as the calendar. Later changes to shifts or competencies
show review warnings instead of silently moving tasks. **My tasks** lists only
own active assignments in time order, with details, competencies and priority,
for a date range of up to 31 days.
