# Lønnseksport og PowerOffice

Oppsettet bygger på regnskapsførerens `Eksempelfil.xlsx` og PowerOffice Go sin standardimport `[SalaryBasis]`. Kontrolldato: 23.11.2026. Samme servergrunnlag brukes i Salsy PC, PC-nettklienten `/app/salsy/` og regnskapsførerens arbeidsflate.

## PDF og importfil

PDF-en er i **stående A4** med én dagsoversikt per ansatt. Hver ansatt starter på egen side; stort grunnlag fortsetter med navnet i tabellhodet. Alle datoer i perioden vises fra tidligst til senest. Ordinær arbeidstid står først på datoen, deretter mertid/overtid, tillegg og øvrige registreringer. Dagslinjene viser klokkeslett, lønnsart, betalte timer/antall, sats og beløp. Ansattnummer, avdelingskode, prosjektkode, utbetalingskonto og sats ved periodeslutt står øverst. Historiske dagslinjer bruker fortsatt satsen på arbeidsdatoen.

Timer og beløp summeres både over dagsoversikten og nederst i tabellen. Tilleggenes antall er bare beregningsgrunnlag og telles ikke som ekstra betalte timer. Ordinære timer dekket av fast månedslønn vises også når de er utelatt fra PowerOffice-importen. Grunnlønn og overtidsprosent er separate linjer. Refusjoner vises utenfor bruttolønn.

Godkjent ferie, avspasering, permisjon og øvrige fraværskategorier vises som informasjon, også på dager uten lønnslinje. Godkjente lønnsvirkninger hentes fra den samme lønnsmotoren som før. Opplysninger som ikke er godkjent merkes tydelig og legges ikke til lønnen. Periodens avspasering og tid som føres til timebank vises uten dobbel betaling. Registrerte pensjons-/andre trekk, naturalytelser og arbeidsgiverkostnader skilles fra ordinær lønn. Skattekortet er en referanse ved periodeslutt; endelig skatt og netto beregnes fortsatt ved lønnskjøringen, med riktig utbetalingsdato.

Ferieoversikten viser brukte dager i perioden og hittil i året, **gjenstående feriedager ved periodeslutt** samt godkjent ferie reservert senere i året. Feriedager telles etter ansattes lagrede ukedager, helligdager, kvote og overføring. Framtidige reservasjoner er ikke trukket fra tallet ved periodeslutt. Ukjent kvote merkes «Ikke registrert». Interne arbeidsnotater, medisinske fraværsnotater og navn på barn tas ikke med.

Utbetalingskonto vises ved hver ansatt i PDF-grunnlaget. Første PDF-eksport etter endring av kontonummer får større, rød **NB: nytt kontonr**. Varselet brukes opp når serveren har opprettet og registrert PDF-eksporten, også om den åpnes som forhåndsvisning eller nedlastingen senere avbrytes. Lagre denne første PDF-en. Senere eksporter viser fortsatt kontonummeret. Varslingen gjelder per ansatt, på tvers av perioder og brukere; Excel-eksport og API-overføring bruker den ikke opp. PDF-feil bruker den heller ikke opp. Første nye genererte lønnsslipp får sitt eget varsel uavhengig av PDF-grunnlaget. Tidligere lagrede PDF-er endres ikke.

Den nye knappen **PowerOffice Excel-import** lager en egen XLSX med `[SalaryBasis]` i A1 og disse kolonnene i rad 2:

| EmployeeNo | DepartmentCode | ProjectCode | PayItemCode | Rate | Amount | Quantity |
| --- | --- | --- | --- | --- | --- | --- |
| Ansattnummer | Avdelingskode | Prosjektkode | Lønnsart | Sats | Sum | Antall |

Importfilen inneholder ikke overskrifter, forklaringer eller totalsummer utover formatets to første rader. Ansattnummer er et tall; avdelings-, prosjekt- og lønnsartkoder beholdes som tekst. Tomt prosjekt gir en tom celle. Importlinjene beholdes enkeltvis, slik at avrunding per lønnslinje bevares. Eksisterende vanlig Excel- og CSV-eksport er fortsatt tilgjengelig.

**Rate og Quantity** fylles ved satsbaserte arter, og **Amount** ved beløpsbaserte arter. PowerOffice sier uttrykkelig at hvilke av disse som kreves, avhenger av lønnsartens behandlingsmåte. Salsy fyller ikke både sum og beregningsfeltene for å forsøke å tvinge mottakers beregning.

## Oppsett før første eksport

1. Velg periode og eventuelt ansatt under Lønnseksport eller på regnskapsførersiden.
2. Åpne **PowerOffice-oppsett → Felles oppsett** og angi avdelingskoden i lønnssystemet. Dette kan også gjøres når Salsy ikke bruker avdelingsmodulen. Prosjektkode er valgfri.
3. Under **Ansattkoblinger** kan regnskapsførerens ansattnummer overstyre Salsy-nummeret uten å endre den ansattes historikk. Tomt nummer bruker Salsy-nummer. Et eget avdelings-/prosjektvalg kan settes per ansatt og gjelder linjene i eksportperioden. Per-vakt prosjektfordeling er ikke del av dette oppsettet.
4. Under **Koble lønnsart** velges hver type grunnlag som finnes i perioden. Tillegg med forskjellige kilder har egne koblinger. Oppgi mottakers kode og behandlingsmåte. Lønnsarter må eksistere i PowerOffice.
5. Ved **Prosent av timelønn × antall** angis prosenten på mottakers lønnsart. Satsen i filen er grunnsatsen; PowerOffice anvender prosenten. Salsy kontrollerer at resultatet tilsvarer beregnet tillegg. En art med 150 % total overtid skal ikke brukes ukritisk når Salsy allerede har skilt grunnlønn og overtidsprosent.
6. Bruk **Utelat fra import** med begrunnelse hvis eksempelvis månedslønn allerede betales som fast lønnslinje i PowerOffice. Timer dekket av fast månedslønn er automatisk informative og blir ikke ekstra timelønn.
7. Velg **Bekreft oppsett** når koblingene er kontrollert sammen med regnskapsfører. Endring av koblinger i Salsy-vinduet krever ny bekreftelse.

Import stoppes ved manglende/dupliserte numeriske ansattnumre, manglende avdelingskode, ukoblet lønnsart, manglende lønnsgrunnlag eller avvik mellom sats/antall/prosent og serverens beregnede beløp. PDF kan fortsatt brukes til gjennomgang, men merkes **IKKE KLAR FOR IMPORT**. Ved avdelinger må én avdeling være valgt.

PowerOffice har et standardregister og tillater bedriftsdefinerte lønnsarter. Offentlig dokumentasjon bekrefter blant annet 120 Timelønn og 100 Fastlønn. Disse er referanser, ikke et fullstendig register eller automatisk godkjenning av bedriftens oppsett. Kode 100 beregner fastlønn fra arbeidsforholdet i PowerOffice og skal ikke uten videre brukes som en vanlig beløpslinje.

## API-tilkobling

Åpne **PowerOffice API** fra eksportoppsettet. Velg testmiljø eller produksjon og legg inn **applikasjonsnøkkel**, **klientnøkkel** og **abonnementnøkkel** fra samme miljø. Applikasjonen må være registrert hos PowerOffice og aktivert på riktig Go-klient. Ingen nøkler følger med Salsy. Nøklene lagres i serverens krypterte data, returneres ikke ved lesing og kopieres ikke til endringsloggen. Tomme nøkkelfelt beholder tidligere verdier. Miljøbytte krever nye nøkler. Frakobling sletter nøkler og det hentede registeret, men beholder overføringshistorikken.

**Hent lønnsarter** bruker API v2 `/PayItems` og viser bedriftens faktiske koder, navn, aktiv-status og behandlingsmåter. Dette krever PayItem/PayItem_Full-tilgang. Et komplett register lagres bare etter vellykket henting av alle sider. Nøkkel-/miljøbytte forkaster det gamle registeret. Koblingene må fortsatt velges og bekreftes; de opprettes ikke ut fra navnelikhet.

API-et bruker OAuth 2.0 Client Credentials, faste HTTPS-adresser hos `goapi.poweroffice.net` og PowerOffice sin abonnementsheader. Ingen egendefinert URL, omdirigering, lokal HTTP-server eller nøkkel i en URL brukes.

## Direkte overføring

**Send til PowerOffice** forhåndsviser først lønnslinjene mot bedriftens faktiske PowerOffice-register. Direkte sending krever i tillegg SalaryLine_Full og lesetilgang til Employees, Departments og eventuelt Projects. Kun nødvendige registerfelt leses; Salsy henter ikke fødselsnummer eller skattekort gjennom denne funksjonen.

Ansattnummer kobles slik importen gjør: eksternnummer har prioritet der det finnes, ellers brukes nummer i PowerOffice. Entydig kobling og aktiv-status kreves. Lønnsartens behandlingsmåte og prosent kontrolleres på nytt. Arter som trenger ekstra opplysninger utenfor dette lønnsgrunnlaget, støttes ikke automatisk. Standard arbeidsforhold må bekreftes; ved flere arbeidsforhold der standard ikke er riktig, brukes foreløpig en separat avklaring med regnskapsfører.

Forhåndsvisningen utløper etter ti minutter og avvises hvis grunnlaget eller målbedriften endres. Sending må bekreftes særskilt. Overføringen oppretter **lønnslinjer til kontroll i PowerOffice**, ikke en utbetaling, godkjent lønnskjøring eller a-melding.

Hver linje har en stabil `ExternalImportReference`, og Salsy lagrer kvittering per linje. Samme bekreftede linje sendes ikke på nytt. Endret grunnlag etter sending og overlappende månedslønn stoppes for manuell avklaring. Hvis forbindelsen brytes etter at en sending er startet, kan linjen ha blitt mottatt selv uten kvittering. Den markeres **uncertain / uavklart** i overføringsloggen og sendes ikke automatisk på nytt. Kontroller PowerOffice før korrigering. Et særskilt valg ved sending kan avklare uavklarte linjer mot mottakers register; eksisterende, identiske linjer får kvittering uten ny sending. Hvis linjen ikke finnes, brukes nøyaktig samme eksterne referanse ved det uttrykkelig bekreftede nye forsøket. Endret innhold eller avvikende mottakerlinje stoppes. Ikke importer XLSX-filen i tillegg til API-sending av samme grunnlag: manuell filimport gir ikke Salsy-kvittering eller samme duplikatkontroll. PowerOffice opplyser at filimporter akkumuleres.

Tilkoblingen er klargjort etter offentlig API-spesifikasjon og testes med syntetiske leverandørsvar. Virkelig ende-til-ende-test og produksjonsgodkjenning krever PowerOffice-tilgang. Ingen reell bedrift eller lønn er overført under utvikling.

## Kilder

- [Standardimport av lønnsgrunnlag](https://hjelpesenter.poweroffice.no/loennsgrunnlag-import).
- [Standardimport, filbeskrivelse revidert 03.08.2026, SalaryBasis side 27–28](https://hjelpesenter.poweroffice.no/hubfs/Standardimport%20%28Revidert%2003.08.2026%29.pdf).
- [Lønnsarter og behandlingsmåter](https://hjelpesenter.poweroffice.no/loennsarter-behandlingsmater).
- [Timelønn og lønnsart 120](https://hjelpesenter.poweroffice.no/go-timeregistrering-go-loeynn).
- [OAuth og miljøer](https://developer.poweroffice.net/documentation/authentication).
- [Hente lønnsarter](https://developer.poweroffice.net/workflows/endpoints/payroll/pay-item2).
- [Overføre lønnslinjer](https://developer.poweroffice.net/workflows/endpoints/payroll/salary-lines).
- [Offentlig API-spesifikasjon: lønnsarter](https://swagger.poweroffice.net/openapispecs/payroll.json).
- [Offentlig API-spesifikasjon: lønnslinjer](https://swagger.poweroffice.net/openapispecs/salarylines.json).

## English

The portrait A4 payroll PDF lists every date chronologically, with regular hours followed by overtime, supplements and leave information. Each employee starts on a separate page, with their name repeated on continuation tables. Employee details include remaining vacation days at period end, future approved reservations and the payout account. Totals appear above and below the table. Supplement quantities, time bank information, refunds and employee deductions remain distinct from paid hours and gross wages. The dedicated PowerOffice XLSX retains the accountant's exact seven SalaryBasis columns. Configure external employee numbers, department/project codes and each pay-item mapping in Payroll export or the accountant workspace. Confirm the setup before importing. Rate/quantity, percentage-based items, amounts and explicitly excluded items are handled separately. Existing general CSV/Excel exports remain available.

The payroll PDF shows each employee's payout account. A larger red **NB: nytt kontonr** notice appears only on the first PDF export after an account change. The notice is consumed when the server successfully creates and records the export, including a PDF opened for preview; save that first file. Later exports still show the account. Excel/API exports and failed PDF creation do not consume the notice. Generated payslips have a separate first-slip notice.

API credentials are stored encrypted on the server. Demo and production are separate. Fetch the actual pay-item register before confirming mappings. Direct delivery previews the exact lines, validates active employee/dimension/pay-item mappings and requires explicit confirmation of the employees' default employment. It stages salary lines for review in PowerOffice, without paying wages. Stable external references and durable receipts prevent silent retries. Uncertain deliveries and edited/overlapping previously delivered data require manual reconciliation. Do not also import a file for the same payroll. Real provider testing requires PowerOffice credentials; development tests use synthetic responses only.
