# Salsy 1.1.4 – lønnseksport, vaktbok og trygg oppdatering

Publisert 24.11.2026. Oppdater Salsy Server og PC-klienten til **1.1.4**, start serveren på nytt og last PC-nettklienten på nytt. Ingen ny Caddyfile kreves. Android-appene og de separate PRP-, Kasse- og Status-appene beholder sine eksisterende versjoner.

## Bakgrunnsoppdatering uten tap av arbeid

PC-nettklienten bygger ikke lenger hele siden på nytt ved vanlig automatisk oppdatering av serverdata. Dette retter blant annet at stoffkartotekets veiviser kunne lukkes mens produktinformasjon ble skrevet inn. Åpne skjemaer, utfylt tekst og valgt PDF beholdes. Hendelser og data hentes fortsatt i bakgrunnen.

**↻ øverst til høyre** oppdaterer visningen manuelt. Knappen markeres når nye data er oppdaget. Nettklienten spør før ulagrede inndata eller åpne dialoger forkastes; avbryt beholder arbeidet. PC-klienten har tilsvarende knapp, bekreftelse og bevarer visningen ved automatisk henting. Utlogging, øktutløp og tap av nødvendige tilganger gjelder fortsatt.

## Vaktbok

- Navn og andre celleverdier bruker opptil to linjer, med avkorting innenfor egen kolonne. Full tekst er tilgjengelig ved å holde pekeren over.
- Arbeidstid, status og stempling overlapper ikke nabokolonner.
- Ansatte med oppsatt arbeid eller godkjent mertid/overtid vises først for hver dag. Fri og heldagsfravær vises under, også når en fraværende ansatt har en opprinnelig vakt i planen. Gruppene sorteres alfabetisk.
- Dag-, tredagers- og ukevisning bruker samme serverregler i PC og PC-nett.

## Lønn og PowerOffice

PDF-grunnlaget følger regnskapsførerens kolonner: **Ansattnummer – Avdelingskode – Prosjektkode – Lønnsart – Sats – Sum – Antall**. Hver ansatt starter på egen side. Lønn, tillegg og refusjoner oppsummeres separat.

PDF-en viser utbetalingskonto. Ved kontobytte vises større, rød **NB: nytt kontonr** bare ved første PDF-eksport etter endringen. Varselet brukes opp når serveren oppretter eksporten, også ved forhåndsvisning eller hvis nedlastingen avbrytes etterpå. Lagre den første filen. Kontonummeret beholdes på senere eksporter. Varslet på neste genererte lønnsslipp fungerer uavhengig av PDF-grunnlaget. Tidligere utstedte og opplastede lønnsslipper omskrives ikke.

Egen PowerOffice XLSX følger `[SalaryBasis]` med sju kolonner. Regnskapsfører kan samkjøre ansattnumre, avdelings-/prosjektkoder og lønnsarter. Sats/antall, prosentarter og beløpsarter kontrolleres mot det felles lønnsgrunnlaget. Eksisterende vanlig CSV/Excel-eksport beholdes.

PowerOffice API er klargjort for kryptert lagring av bedriftens nøkler, henting av faktisk lønnsartregister og uttrykkelig bekreftet overføring av lønnslinjer etter forhåndskontroll. Varige kvitteringer og stabile eksterne referanser beskytter mot dobbelt sending. Uavklarte overføringer krever kontrollert avklaring. Sending oppretter grunnlag til kontroll i PowerOffice; den utbetaler ikke lønn eller leverer a-melding. Ikke importer samme grunnlag både som fil og via API. **Reell PowerOffice-tilgang, nødvendige rettigheter og ende-til-ende-test mot leverandøren gjenstår hos bedriften.** Se [POWER_OFFICE_PAYROLL.md](POWER_OFFICE_PAYROLL.md).

## Kontroll og avgrensning

Automatiserte tester bruker syntetiske bedriftsdata. Kontrollert: kalender-/vaktbokhandlinger, tolinjevisning på flere nettleserbredder, sortering, bevaring av faktisk stoffkartotekutkast/PDF, manuell oppdatering med avbryt/bekreft, SDB-import/eksport og søk, lønnsgrunnlag, kontovarsler, rettigheter og avdelingsgrenser. PC GUI er testet på Linux; ARM64 er kontrollert med QEMU. Fysisk Raspberry Pi, telefon og faktisk systemd-oppstart er ikke testet i denne runden.

Oppdaterte bruksanvisninger følger utgivelsen. Tariffenes ufullstendige kontrollstatus beholdes; denne utgaven innebærer ikke full tariffdekning. Salsy Kasse er fortsatt kun for testing av fiktive betalinger. Hosting Manager og annen privat kode/distribusjon publiseres ikke.

## English

Version 1.1.4 keeps desktop/web drafts intact during background polling and adds an explicit circular-arrow refresh control. Roster cells use up to two lines, stay inside their columns and show scheduled workers first. Payroll PDFs and the dedicated PowerOffice SalaryBasis workbook follow the accountant's seven-column layout. Payout accounts and independent first-export/first-payslip account-change notices are included. The documented PowerOffice API adapter requires company credentials, permissions and live provider validation; it stages payroll lines for review, without paying wages. Existing incomplete tariff status and test-only Checkout status remain unchanged. Private hosting administration is excluded from this release.
