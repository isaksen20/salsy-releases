# Salsy 1.1.8 – detaljert lønnsgrunnlag i PDF

Oppdater Server og PC til **1.1.8**, start serveren på nytt og last nettappene på nytt. Eksisterende Android 0.41.0 kan brukes videre. Ingen ny Caddyfile kreves.

## Dagsoversikt for regnskapsfører

PDF-eksporten bruker stående A4. Alle datoer i perioden vises kronologisk, med ordinær tid før mertid/overtid samme dato og tillegg som egne linjer. Klokkeslett, lønnsarter, betalte timer/antall, satser og beløp følger det felles servergrunnlaget. Timer og beløp summeres både i ansattfeltet øverst og nederst i tabellen.

Ansattfeltet viser ansattnummer, avdelings-/prosjektkode, utbetalingskonto, sats ved periodeslutt, ferie brukt i perioden og hittil i året, og gjenstående feriedager ved periodeslutt. Godkjente feriedager senere i året oppgis separat som reservasjoner. Den lagrede feriekvoten, overføringen, ukedagene og helligdagene brukes. Ukjent kvote merkes tydelig.

Ferie, avspasering, permisjon og øvrige fraværskategorier, tid til timebank, manuelle bankkorreksjoner og registreringer til behandling vises som egne opplysninger. Bare godkjent lønnsgrunnlag inngår i beløpene. Tilleggenes beregningsantall og informasjonsrader øker ikke antall betalte timer. Månedslønnens dagsregistreringer vises også når de ikke importeres som ekstra timelønn. Registrerte trekk, naturalytelser og refusjoner holdes atskilt fra ordinær bruttolønn. Skattekortet er en referanse ved periodeslutt; endelig skatt/netto beregnes ved lønnskjøringen.

**Hver ansatt begynner alltid på en ny side.** Hvis dagsoversikten ikke får plass, fortsetter den på neste side med den ansattes navn og kolonneoverskriftene gjentatt. Større, rød **NB: nytt kontonr** beholdes ved første PDF-eksport etter kontoendring. Private arbeids-/fraværsnotater tas ikke med.

Samme PDF brukes i native PC, PC-nettklienten og regnskapsførersiden. PowerOffice-importfilens sju kolonner, eksisterende Excel/CSV og lønnsberegningene beholdes. Manglende lønnsartkoblinger eller satser merkes fortsatt **IKKE KLAR FOR IMPORT**. Bruksanvisningene er oppdatert.

## Kontroll og avgrensninger

Kontrollert med syntetiske data: hele måneder, dato-/radrekkefølge, overtid, avspasering/timebank uten dobbelttelling, ferie ved periodeslutt og framtidige reservasjoner, månedslønn, informasjonsdager uten lønn, lange fortsettelsestabeller, tilgangs-/avdelingsskille og kontonummervarsler. Native PC-knapp og PC-nettets PDF/XLSX-nedlasting er testet mot felles API. Pakkene kontrolleres isolert, inkludert ARM64 under emulering og privat serveradministrasjon. Fysisk mobil/Raspberry Pi og faktisk systemd-oppstart er ikke testet.

Tariffavtalenes ufullstendige kontrollstatus og Kasses teststatus beholdes. Hosting Manager inngår ikke i GitHub-utgivelsen.

## English

The payroll PDF now uses portrait A4 and lists every date chronologically, with regular work before overtime on the same date. Employee details include period totals, payout account, vacation used and the remaining balance at period end, with future approved reservations shown separately. Totals repeat below the table. Leave, time off, time bank, pending records, deductions, benefits and reimbursements remain distinct from payable wage lines. Each employee always starts on a new page; long reports continue with repeated employee/table headings. Shared calculations and the exact PowerOffice XLSX format are unchanged. Private hosting packages remain excluded from GitHub.
