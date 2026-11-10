# Fakturainnstillinger og fakturaavstemming – 0.92.0

PC-klienten og PC-nettklienten på `/app/salsy/` har **Fakturainnstillinger**
oppe til høyre i Fakturering. Vinduet samler Generelt, EHF, eFaktura,
Fakturaavstemming og Open Banking / API. Tilgang krever `manage_billing`.
Alle innstillinger og bankdata gjelder valgt avdeling; data blandes ikke mellom
avdelinger. Hosting Manager bruker samme servermotor.

## Kom i gang

1. Lagre bedriftsdata og riktig bankkonto under Generelt.
2. Åpne Fakturaavstemming → Rediger avstemming og KID. Aktiver avstemming og
   skriv inn mottakerkontoen. Bankkontoen kontrolleres mot bankfilen.
3. Ønskes KID: inngå OCR/KID-avtale i banken og avklar lengde, prefiks og
   modulus 10 eller 11. Bekreft avtalen i Salsy før KID aktiveres. KID består
   av prefiks + nullutfylt fakturanummer + kontrollsiffer, maksimalt 25 siffer.
   Oppsettet må være godkjent av banken. Et modulus 11-grunnlag som ikke gir
   et numerisk kontrollsiffer avvises; Salsy endrer ikke KID-format i skjul.
4. Nye fakturaer får KID i PDF og EHF PaymentID. Gamle fakturaer beholder
   konto og betalingsreferanse; innstillingene omskriver ingen utstedt faktura.
5. Åpne Fakturaavstemming fra fakturalisten eller innstillingsvinduet.
6. Importer fil fra nettbanken, velg format og kontroller forhåndsvisningen.
   Konto, beløp, dato, referanse og forslag vises før **Bekreft og importer**.
7. Velg banklinje og **Avstem innbetaling**. Velg faktura og beløp. Samme
   innbetaling kan fordeles mellom flere fakturaer innenfor banklinjens saldo.
   Delbetaling reduserer Restbeløp. Fakturaen blir Betalt når hele summen er
   avstemt. Overbetaling blir stående som ledig bankbeløp.
8. Feil kobling kan oppheves med begrunnelse. Historikken beholdes, og
   fakturaens saldo/betalingsstatus oppdateres. En aktiv bokført betaling må
   reverseres i Regnskap før avstemmingen kan oppheves.

Forslag krever eksakt KID eller et uttrykkelig fakturanummer samt samme
mottakerkonto. Beløp alene brukes ikke til å velge kunde. Ukjent KID faller
ikke tilbake til beløpsmatching. Avvikende referanse eller mulig duplikat krever
begrunnelse og manuell kontroll. Ingen faktura merkes automatisk betalt ved
filimport. Manuell «Merk som betalt» kan ikke overstyre en delbetalt faktura;
avstem resten av innbetalingen i avstemmingsvinduet.

## Bankformater

- **ISO 20022 XML:** camt.053 og camt.054, med namespace `camt.053.001.xx`
  eller `camt.054.001.xx`, bokføringsstatus BOOK, bokføringsdato, CRDT/DBIT,
  valutakode og stabil AcctSvcrRef/TxId. Både IBAN og norsk kontonummer støttes.
  NO-IBAN og tilsvarende norsk konto sammenlignes som samme konto.
  Samleposter splittes på transaksjonsdetaljer bare når detaljbeløpene finnes
  og summerer nøyaktig til bankens post. Blandede valutaer, tvetydige
  referanser og ufullstendige detaljer avvises; importer en detaljert bankfil.
  EndToEndId er betalingsreferanse, aldri unik bank-ID.
- **OCR:** komplett Nets OCR giro v4-fil med 80 tegn per record. Start/slutt,
  beløpsposter 30/31/32, antall og summer kontrolleres. Terminalens
  informasjonstyper 18–21 beholdes for kontroll og kan ikke kobles som egne
  fakturainnbetalinger. Ingen tolkning av kvitteringsbilder/OCR-bildegjenkjenning.
- **CSV:** UTF-8 (med eller uten BOM), eventuelt Windows-1252. Komma eller
  semikolon som feltseparator. Obligatoriske engelske kolonnenavn er `date`,
  `amount`, `reference`. Valgfrie: `account`, `currency`, `kid`,
  `invoice_number`, `text`, `reversal`. Ulike bankers CSV-eksporter må ved
  behov tilpasses denne malen. Behold referanser og KID som tekst, også
  innledende nuller. Ikke finn på en ny referanse ved gjentatt eksport.

Eksempel med semikolon, fiktive data:

```csv
date;amount;reference;account;currency;kid;invoice_number;text
2026-11-01;1250,00;BANK-UNIK-001;12345678901;NOK;;1001;Innbetaling fra kunde
```

Beløp er i kroner med høyst to desimaler, uten tusenskilletegn. Innbetaling er
positiv; utbetaling er negativ. Dato er YYYY-MM-DD. Tom konto/valuta i CSV
bruker valgt konto/NOK; ISO/API må oppgi dem. Reversal er true/false eller 1/0.
Maksimalt 4 MiB og 5000 transaksjoner per fil. Hele filen avvises hvis en rad
er ugyldig. Duplikater på konto + stabil bankreferanse importeres ikke igjen.
Motstridende data for samme referanse avvises. Ulike kilder med ulike bank-ID-er
kan fremdeles beskrive samme betaling: bruk ikke blandede kilder ukritisk.

Utbetalinger, reverseringer og fremmed valuta vises, men avstemmes ikke som
NOK-fakturabetaling. Regnskap/bank må håndtere refusjon, valutakurs og gebyrer.
Dette er fakturaavstemming, ikke bankens fullstendige saldoavstemming og ikke
automatisk hovedbokføring. Eksisterende Regnskap → Bankavstemming beholdes.
Salsys regnskap er fortsatt skyggeregnskap med sine eksisterende begrensninger.

## Bedriften velger bank eller API-leverandør

Under Open Banking / API kan bedriften lagre leverandørnavn, eget offentlig
HTTPS-endepunkt (port 443), Bearer/OAuth-token, Basic eller API key i et
`X-...`/`Api-Key`-hode. Nøkler lagres kryptert og returneres aldri i UI eller
endringshistorikk. Tomt nøkkelfelt beholder gjeldende nøkkel; egen avkrysning
sletter den. Ved bytte av URL må nøkkelen legges inn på nytt.

Det er en konfigurerbar **leseadapter**, ikke et løfte om at alle bankers API-er
har samme format. Banken/leverandøren må gi lovlig kontotilgang. BankID,
OAuth-godkjenning, samtykke, tokenutstedelse/fornyelse, eventuelle sertifikater og
avtaler må ordnes hos leverandøren. mTLS og automatisk OAuth authorization-code
flyt er ikke implementert. En integrasjonspartner kan gi Salsy et kompatibelt
endepunkt dersom bankens native API krever disse mekanismene.

Velg JSON Pointer for liste og hvert felt; for eksempel `/transactions`,
`/transactionId`, `/amount/value`. Bruk `~1` for `/` og `~0` for `~` i feltnavn.
Obligatoriske transaksjonsfelt: unik ID, bokføringsdato, signert beløp, valuta,
kontonummer og status. Oppgi verdien som betyr bokført, eksempel `booked`.
Resten gir KID, fakturanummer, banktekst og reverseringsflagg (ekte JSON boolean).
Standard normalisert svar er:

```json
{"transactions":[{"id":"BANK-UNIK-001","date":"2026-11-01",
  "amount":"1250.00","currency":"NOK","account":"12345678901",
  "status":"booked","kid":"","invoice_number":"1001",
  "text":"Kundebetaling","reversal":false}],"next":null}
```

Positive/negative beløp må være ferdig signert; adapteren konverterer ikke
leverandørspesifikke debet/kredit-felter. Et `next`-felt med verdi avviser
ufullstendige resultater. Avgrens dato/periode hos leverandøren eller importer
bankfil. Salsy følger ikke lenker til nye sider automatisk. Kun status som
matcher valgt bokført-verdi importeres; pending hoppes over og telles.

Trykk **Hent fra bankens API**, kontroller forhåndsvisningen og importer.
Forhåndsvisningen utløper etter 15 minutter og blir ugyldig ved endret oppsett.
Nettverkskall skjer bare på brukerens forespørsel, kun GET; løsningen sender
ikke betalinger. URL må ikke inneholde API-nøkler/passord. TLS kontrolleres,
omdirigering følges ikke, lokale/private IP-adresser sperres, og offentlig
IP festes til forbindelsen for å hindre DNS-bytte mot interne tjenester.

## EHF og eFaktura

Eksisterende EHF-oppsett samles i samme vindu; Recommand-integrasjonen og
valideringen er videreført. Fakturaavstemming fungerer også for fakturaer sendt
på e-post. eFaktura til privatpersoner er fortsatt bare klargjøring, ikke aktiv
sending. Se EHF.md for avtale, testmiljø og produksjonsoppsett.

## Kilder og avgrensning

Kontrollert 10.11.2026 mot:
- Bits, ISO 20022 og norske meldingsspesifikasjoner:
  https://bits.no/bank/iso-20022/
- Nets/Mastercard Payment Services, Systemspesifikasjon OCR giro v4 (2018),
  recordstruktur og kontrollsiffer:
  https://www.nets.eu/no-nb/SiteCollectionDocuments/OCR%20giro/Systemspesifikasjon%20(NO).pdf
- DNB, filoverføring og innbetalingsavtaler:
  https://www.dnb.no/bedrift/hjelp-og-veiledning/filoverforing
- Open Banking, Account Information Services og uttrykkelig samtykke:
  https://standards.openbanking.org.uk/customer-experience-guidelines/account-information-services/latest/

Ingen virkelig bankkonto, API-avtale eller produksjonsbetaling er brukt til
utviklingstestene. Leverandørens faktiske fil/API må kontrolleres mot et lite
utvalg og nettbanken før driftsbruk.
