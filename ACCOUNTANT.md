# Regnskapsfører – PC og PC-nett (0.95.0)

Leder/admin velger **Regnskapsfører** som rolle under Ansettelse → Brukere og
tilganger, eller i serverens Brukere-fane. Kontoen trenger brukernavn og passord,
uten ansattilknytning eller personalia. Serveropprettede kontoer bruker samme
tvungne passordbytte som andre kontoer. Administrator må ha tilgangene som tildeles.

Regnskapsfører kobler til bedriftens vanlige server med PC-klienten, eller åpner
`/app/salsy/`. Klientkode/tilkoblingsprofil, HTTPS og vilkår gjelder som før.
Etter innlogging åpnes en egen oversikt uten vanlig ansattmeny eller lederlinje.

1. Velg rapport: fakturaer/kreditnotaer, innkjøp og MVA, fakturaavstemming,
   utgifter/bilag, attesterte reiseregninger, timer per ansatt, timelinjer,
   lønnsgrunnlag, lønnsslipper, hovedbok eller saldobalanse.
2. Fra-/til-dato står på første og siste dag i gjeldende måned, norsk tid.
   Velg en annen periode ved behov, maksimalt to år. Saldobalanse må holde seg
   innenfor ett kalenderår.
3. Velg Alle ansatte eller én ansatt for relevante rapporter. Trykk Vis.
   Oversikten viser 200 rader per side. CSV/Excel eksporterer hele utvalget,
   med samme rapport-, dato-, avdelings- og ansattfilter.
   For fakturaer kan **Alle fakturaer (uansett dato)** velges når fakturering
   er aktivert i avdelingen.
4. Dobbeltklikk en rad for detaljer og eventuell dokumentfil. Nettleseren laster
   ned dokumentet; PC-klienten åpner PDF/bilder i standardprogrammet.
5. Velg Last opp lønnsslipp, ansatt, lønnsperiode og utbetalingsdato. Oppgi brutto,
   skattetrekk og netto slik de står i PDF-en. Velg PDF, maksimalt 5 MiB, og lagre.
   Den ansatte finner dokumentet under Lønn og lønnsslipper. Identisk opplasting
   oppretter ikke et ekstra eksemplar; samme PDF med andre opplysninger avvises.

Tilgangen **Regnskapsfører – lese og eksportere økonomidata** gir finansrapporter.
Tilgangen **Regnskapsfører – lese/eksportere timer og lønn, laste opp lønnsslipp** gir i tillegg timer,
lønnsgrunnlag, lønnsslipper, hovedbok/saldobalanse og opplasting av lønnsslipper.
Den inkluderer hovedbok fordi den kan inneholde lønnsføringer. Den separate
rettigheten **Regnskapsfører – endre lønn, ferieoppgjør, skattekort, tillegg og
kontrakter** gir tilgang til disse oppgavene og lønnstabeller. Nye kontoer har
den som standard; eksisterende eksplisitte tilgangslister oppdateres av leder.
Uten redigeringsrettigheten forblir økonomidata lesbare/eksporterbare.
Regnskapsfører kan ikke endre timer, fakturaer, bankavstemming, bokføring eller
brukere. Se [ferie- og lønnsveiledningen](VACATION_FINANCE.md).
Personalia, HR-notater og medisinske fraværsopplysninger inngår ikke i rapportene.
Dokumenter som regnskapsfører får lese kan selvsagt inneholde opplysningene
virksomheten selv har lagt i disse dokumentene.

Ved avdelinger opprettes kontoen i valgt avdeling. Tilgangen Velge og se alle
avdelinger åpner avdelingsvalg og samlet rapportvisning, med avdelingsnavn på
hver rad. **Velg én avdeling før opplasting av lønnsslipp eller endring av lønnsopplysninger.** En ansatt i en annen
avdeling kan ikke velges. Kontoer opprettet før første avdeling beholder tilgang
til Hovedavdeling. Uten avdelinger fungerer portalen for hele bedriften.

Timer kommer fra Salsys felles lønnsberegning: oppsatte vakter og godkjente
mertids-/overtidstimer, med eksisterende fratrekk for matpause, ulønnet permisjon
og timebank. Dette er lønnsgrunnlag, ikke verifisert oppmøte. Framtidige vakter kan
inngå. Banktimer vises separat. Manglende lønnssats gir ufullstendig grunnlag og
manglende brutto, ikke en beregnet nullønn. Opplasting av PDF beregner eller
validerer ikke lønn/skatt fra et eksternt lønnssystem.

Regnskapets tidligere begrensninger gjelder: dette er fortsatt skyggeregnskap,
og bankavstemming bokfører ikke automatisk i hovedboken. Eksportene er
rapportuttrekk, ikke en ny lovpålagt innsendingskanal.

## English

Create an Accountant account without an employee link. Connect using the normal
PC connection profile or `/app/salsy/` and the existing company client code.
The separate workspace defaults to the current Norwegian calendar month. Select
a report, date range and one/all employees. CSV and Excel export the complete
selection, including department filtering; the screen displays 200 rows per page.

Accountants can upload PDF payslips (up to 5 MiB) for individual employees with
period, payment date, gross, tax and net amounts. Employees see these through the
existing payslip feature. A separate payroll editing permission enables pay
rates, pay tables, tax cards, supplements, contracts and vacation settlements.
New accounts receive it by default; existing explicit permissions are preserved.
Other data remains read-only. See [the finance guide](VACATION_FINANCE.md).
The payroll permission controls hours, payroll, payslips, ledger/trial balance
and payslip uploads. HR and medical absence details are excluded from reports.
Select one department before uploading; cross-department reads require explicit
permission. Hours use the shared payroll engine, including scheduled future
shifts, and do not confirm actual attendance. Shadow-accounting limitations remain.

## Hvis innloggingen ser ut til å stoppe

Rapportfeil eller manglende regnskapsførertilgang skal vises etter at kontoen er
logget inn. Oversikten beholdes med Logg ut og Prøv igjen/Oppdater. Rapportfeil
kan løses ved å velge en annen rapport eller periode; feil i timegrunnlaget må
avklares av leder. Ingen lønnsregler omgås for å få fram en rapport.

Kontroller at rollen er Regnskapsfører og at **Regnskapsfører – lese og eksportere økonomidata** er aktivert. Timer, lønn og PDF-opplasting krever også
lønnstilgangen. Utløpt/deaktivert økt sender fortsatt brukeren til innlogging.

Report or permission errors remain visible in the signed-in workspace, with
retry and logout controls. Authentication/session expiry still requires login.
The financial-data permission is required to open the accountant portal.

Nye kontoer, eller endring fra en annen rolle til Regnskapsfører, bruker
standardtilgangene for økonomidata, timer/lønn og avgrenset lønnsredigering når det sendes et tomt valg.
Leder/admin må selv ha rett til å tildele disse tilgangene; ellers avvises
opprettingen. Eksisterende regnskapsførerkontoer uten tilgang endres ikke
automatisk. Leder/admin må oppdatere disse, og brukeren må logge inn på nytt.
Bevisst fjerning av tilganger fra en eksisterende konto respekteres fortsatt.

Leder/admin med **Administrere brukere og tilganger** kan opprette, redigere og
resette regnskapsførerkontoer uten **Økonomisk ansvar** eller egne regnskapsfører-
og lønnsrettigheter. Økonomisk ansvar gjelder attestering av reiser og utlegg.
Dette gir ikke lederen tilgang til økonomirapportene eller mulighet til å tildele
større administratorrettigheter. Tilgang til flere avdelinger krever fortsatt
at lederen selv har denne tilgangen. Avdelingsgrenser beholdes.

Leaders/admins with **Manage users and permissions** can provision and manage
accountant accounts without financial responsibility or personal finance/payroll
report permissions. This delegation does not grant the leader report access,
broader administrator privileges or additional department access.

Timelønn (NOK) vises i Timer per ansatt og Lønnsgrunnlag, og følger med i CSV og Excel. Den viser ordinær sats ved valgt periodeslutt fra felles lønnsmotor, også når den ansatte ikke har timer. Historiske beløp bruker fortsatt satsen på arbeidsdatoen; tom sats betyr at lønn ikke er registrert. Månedslønnstabeller og tariffgrunnlag bruker den ordinære omregnede timesatsen. Feltet krever regnskapsførerens lønnstilgang.

Hourly pay appears in employee hour summaries and payroll-basis reports, including CSV/XLSX. It is the ordinary hourly equivalent at the selected period end, not a rate to multiply by all historical hours. Missing rates remain blank. Payroll read permission is required.
