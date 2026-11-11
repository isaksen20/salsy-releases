# Regnskapsfører – PC og PC-nett (0.93.0)

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
4. Dobbeltklikk en rad for detaljer og eventuell dokumentfil. Nettleseren laster
   ned dokumentet; PC-klienten åpner PDF/bilder i standardprogrammet.
5. Velg Last opp lønnsslipp, ansatt, lønnsperiode og utbetalingsdato. Oppgi brutto,
   skattetrekk og netto slik de står i PDF-en. Velg PDF, maksimalt 5 MiB, og lagre.
   Den ansatte finner dokumentet under Lønn og lønnsslipper. Identisk opplasting
   oppretter ikke et ekstra eksemplar; samme PDF med andre opplysninger avvises.

Tilgangen **Regnskapsfører – lese og eksportere økonomidata** gir finansrapporter.
Tilgangen **Regnskapsfører – lese/eksportere timer og lønn, laste opp lønnsslipp** gir i tillegg timer,
lønnsgrunnlag, lønnsslipper, hovedbok/saldobalanse og opplasting av lønnsslipper.
Den inkluderer hovedbok fordi den kan inneholde lønnsføringer. Rollen kan ikke
endre timer, lønnssatser, fakturaer, bankavstemming, bokføring eller brukere.
Personalia, HR-notater og medisinske fraværsopplysninger inngår ikke i rapportene.
Dokumenter som regnskapsfører får lese kan selvsagt inneholde opplysningene
virksomheten selv har lagt i disse dokumentene.

Ved avdelinger opprettes kontoen i valgt avdeling. Tilgangen Velge og se alle
avdelinger åpner avdelingsvalg og samlet rapportvisning, med avdelingsnavn på
hver rad. **Velg én avdeling før opplasting av lønnsslipp.** En ansatt i en annen
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
existing payslip feature. Other financial and payroll records remain read-only.
The payroll permission controls hours, payroll, payslips, ledger/trial balance
and payslip uploads. HR and medical absence details are excluded from reports.
Select one department before uploading; cross-department reads require explicit
permission. Hours use the shared payroll engine, including scheduled future
shifts, and do not confirm actual attendance. Shadow-accounting limitations remain.
