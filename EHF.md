# EHF og klargjøring av eFaktura – Salsy 0.91.1

## Kundetype

Under **Fakturering → Kunder → Ny kunde / Rediger** velger du **Bedriftskunde**
eller **Privatkunde**. Samme register brukes av lager og Warehouse. Eksisterende
kunder beholder typen de allerede har; kunder uten eldre typefelt behandles
som bedriftskunder. Kontroller typen før du lager fakturaen.

EHF støttes her for norske bedriftskunder. eFaktura er klargjort for
privatkunder, men har foreløpig ingen tilkoblet sendetjeneste. E-post kan
fortsatt brukes for begge. **Foretrukket fakturakanal** er informasjon i
kunderegisteret; den starter ikke utsending automatisk. Kundens navn, adresse,
type og rutingsopplysninger kopieres til fakturaen ved utstedelse. Senere
endringer i kunderegisteret endrer ikke den utstedte fakturaen.

## Hva virker uten en leverandøravtale?

En ny serverinstallasjon kan kontrollere og eksportere EHF-fakturaer og
kreditnotaer som UBL 2.1 / Peppol BIS Billing 3.0 XML. Java og Saxon installeres
som DEB-avhengigheter (`default-jre-headless`, `libsaxonhe-java`). Kontrollene
kjøres lokalt med medfølgende OASIS-, CEN- og Peppol-regler fra mai 2026;
fakturaen sendes ikke til en ekstern validator. Ved manglende verktøy eller
regelbrudd stopper eksport og sending med en feilmelding.

Det kreves et Peppol-aksesspunkt for faktisk nettverkslevering. Salsy har en
dokumentert integrasjon med **Recommand API v1**. Det opprettes ingen konto
eller avtale automatisk. Leverandørens avtale, priser, godkjenning og API-tilgang
avklares av bedriften. Dette er ikke en egen Salsy Peppol-aksesspunkttjeneste.

## Oppsett, trinn for trinn

1. Oppdater server og PC-klient til 0.91.1 eller nyere, start serveren på nytt
   og last nettklienten på nytt. Ta sikkerhetskopi før oppdateringen.
2. Under **Fakturering → Bedriftsdata**: legg inn korrekt firmanavn, norsk
   organisasjonsnummer, adresse, postnummer, poststed, land og bankkonto.
   Angi riktig MVA-registrering. Landkode er `NO`. Kontonummer har 11 siffer;
   punktum og mellomrom kan brukes i feltet. Peppol-adresse kan stå tom:
   den utledes som `0192:` etterfulgt av organisasjonsnummeret.
3. Under **Kunder**: velg Bedriftskunde og fyll ut kundens korrekte
   organisasjonsnummer og adresse. Bruk landkode `NO`. Mottakeren må være
   registrert i Peppol. Legg inn kundens referanse, eller bruk ordrenummer
   i EHF-vinduet. Opprett fakturaen etter at dataene er kontrollert.
4. For eksport uten avtale: velg fakturaen → **EHF / eFaktura**. Fyll inn
   **Deres referanse** eller **Kjøpers ordrenummer**, og trykk **Kontroller EHF**.
   Rett feilene før du velger **Eksporter EHF**. Nedlasting merker ikke
   fakturaen som sendt. PC lagrer via filvalg; nettleseren laster ned XML-filen.
5. For sending: opprett konto/avtale hos Recommand, registrer og få bedriften
   godkjent, og opprett en Basic API-nøkkel med hemmelighet. Finn bedriftens
   ID hos leverandøren. Bruk leverandørens playground først.
6. Åpne **Fakturering → EHF-leverandør**. Legg inn bedrifts-ID,
   organisasjonsnummer, API-nøkkel og API-hemmelighet. Bekreft at bedriften
   har avtale/godkjenning, velg **Testmiljø (playground)** og aktiver sending.
   Tomme nøkkelfelt beholder lagrede nøkler. Nøkler lagres i den krypterte
   serverdatabasen og returneres ikke til klientene etter lagring.
7. Åpne en faktura → **EHF / eFaktura → Kontroller aksesspunkt**. Serveren
   kontrollerer bedriftens organisasjonsnummer og at kontoen faktisk er i
   valgt test-/produksjonsmiljø. Trykk **Send EHF** for en testsending.
   Playground gir **Test sendt – ingen produksjonsfaktura**. Den ordinære
   fakturaen blir ikke merket som sendt av en slik test.
8. Når leverandøravtalen er produksjonsklar: legg inn produksjonstilgangen,
   slå av testmiljø, kontroller tilkoblingen og prøv med en avtalt mottaker.
   **Send EHF** sender det kontrollerte dokumentet via leverandøren.
   **Oppdater EHF-status** henter senere leveringsresultat. Leverandøren kan
   belaste bedriften for produksjonssendinger.

Fakturavinduet viser test/produksjon. Bekreftelsen gjelder akkurat dette
miljøet og leverandøroppsettet. Hvis en administrator endrer oppsettet mens
vinduet er åpent, stoppes sendingen: åpne fakturaen på nytt og kontroller
miljøet. API-klienter må sende `test_mode` og `provider_revision` fra
GET av fakturaens `/electronic`-opplysninger i POST til `/ehf/send`.
Produksjonsstatus vises separat når du arbeider i testmiljø.

Bare brukere med tilgang til å administrere fakturering kan konfigurere,
eksportere og sende. Oppsett, nøkler og leveringshistorikk er adskilt per
avdeling/instans. PC og PC-nettklienten har samme funksjoner. Android og
Warehouse har fortsatt sine eksisterende fakturafunksjoner; denne versjonen
legger ikke til en egen EHF-sendeknapp i Android-appene.

## MVA og enheter

Vanlige enheter oversettes automatisk, for eksempel `stk` → `C62`,
`timer` → `HUR`, `kg` → `KGM`, `liter` → `LTR` og `døgn` → `DAY`.
Andre enheter kan angis per linje i EHF-vinduet; offisiell kontroll validerer
kodene. Ved 0 % MVA må riktig kategori angis: **Z** (fritatt/nullsats),
**E** (unntatt, med begrunnelse) eller **O** (utenfor MVA-området, for
ikke-MVA-registrert selger). Salsy gjetter ikke hvorfor en registrert
bedrift bruker 0 %. Kategori O kan ikke blandes med andre kategorier.

Eksporten beholder fakturaens lagrede mengder, rabatter, priser og summer.
Hvis disse bryter de offisielle kontrollreglene, stoppes eksport/sending;
Salsy endrer ikke en utstedt faktura for å få kontrollen til å bestå.
Kontroller grunnlaget og bruk kreditnota/ny faktura ved nødvendige rettelser.
Denne første integrasjonen gjelder norske avsendere/mottakere med
organisasjonsnummeradresse `0192`, NOK og kategoriene S/Z/E/O. Utenlandske
mottakere og andre MVA-spesialtilfeller inngår ikke i dette oppsettet.

## Sending og feil

- **Sendt til aksesspunkt – venter på levering:** leverandøren har bekreftet
  mottak. Fakturaen er merket sendt, men endelig nettverkslevering gjenstår.
- **Levert til mottakers aksesspunkt:** leverandøren rapporterer levert.
  Dette betyr ikke at kunden har lest eller betalt fakturaen.
- **Avvist før innsending:** rett opp feilen før et nytt sendeforsøk.
- **Ukjent leveringsutfall:** ikke send på nytt før utfallet er undersøkt i
  leverandørens kontrollpanel. Salsy stopper automatiske gjentakelser for
  å unngå dobbeltfakturering. Dette gjelder også hvis serveren stoppes
  midt i et sendeforsøk.
- **Levering feilet:** undersøk dokumentreferansen hos leverandøren.
  Fakturaen sendes ikke automatisk på nytt.

Hvis leverandøren uttrykkelig bekrefter at en ukjent innsending **ikke** er
sendt, velg **Avklar ukjent innsending**, bekreft dette og skriv en begrunnelse
på minst 20 tegn. Det må ha gått minst to minutter siden forsøket. Ny sending
kan deretter gjøres manuelt. Hvis den faktisk er sendt, behold sperren og
bruk leverandørens dokumenthistorikk; ikke bekreft «ikke sendt» for å omgå den.
Et ukjent utfall uten dokumentreferanse kan ikke automatisk gjenopprettes fra
leverandøren. Leveringshistorikken beholdes. Endring av den generelle
Sendt-statusen på PC opphever ikke EHF-sperren mot dobbel innsending.

Et dokument som er under eller etter innsending kan ikke bare slettes i
Salsy. Bruk kreditnota når det er nødvendig å korrigere en sendt faktura.

## eFaktura til privatpersoner

Velg Privatkunde. eFaktura-adressen må komme fra en fremtidig leverandørs
mottakeroppslag; ikke legg inn fødselsnummer i dette feltet. I fakturavinduet
kan **Klargjør eFaktura** eksportere en versjonert JSON-pakke med fakturadata,
PDF og mottakeradresse. Filen inneholder kundeopplysninger og må behandles
som fakturadata. Den sendes ikke og merker ikke fakturaen som sendt.
En leverandøravtale, mottakeroppslag, konkret API-integrasjon og nødvendige
produksjonsgodkjenninger gjenstår før eFaktura kan sendes.

## Teknisk og kontrollkilder

Recommand bruker HTTPS og Basic API-nøkkel/-hemmelighet. Serveren bruker
fast API-adresse `https://app.recommand.eu/api/v1`, følger ikke omdirigeringer
og faller ikke automatisk tilbake til e-post. XML, dokumenthash og
leveringsforsøk lagres i serverens krypterte data. Kildedata og lisenser for
offisielle validatorer ligger i `salary_server/assets/ehf/NOTICE.md` og
`sources.json`. `tools/build_ehf_validation.py` bygger XSLT-reglene fra de
fastlåste kildene. Regler følger programoppdateringer og lastes ikke ned
ukontrollert ved hver faktura.

Integrasjonen er testet mot simulerte leverandørsvar og ekte lokale
XSD/CEN/Peppol-kontroller. Ingen ekte API-nøkler eller produksjonssendinger
har vært tilgjengelig i utviklingstesten. Gjennomfør leverandørens testløp
før første ordinære utsending.

Kontrollert 09.11.2026:

- [Peppol BIS Billing 3.0 – mai 2026](https://docs.peppol.eu/poacc/billing/3.0/)
- [Recommand: sending, rå UBL og svar](https://docs.recommand.eu/docs/sending-invoices)
- [Recommand: API-tilgang](https://docs.recommand.eu/docs/authentication)
- [Recommand: mottakeroppslag](https://docs.recommand.eu/docs/verifying-recipients)
- [eFaktura: utvikler- og leverandørtilgang](https://www.efaktura.no/developer/)

## Rettelser og drift fra 0.91.1

Ferdige simuleringer låser ikke en usendt produksjonsfaktura; endrede valg kan
testes på nytt. Produksjonshistorikk er fortsatt beskyttet. En opprettet
kreditnota stopper ikke en allerede påbegynt sending. Kontroller usikkert
leveringsutfall hos leverandøren før eventuell sending av kreditnota. En kjørende
innsending kan ikke låses opp selv om to minutter er gått.
Ved opptatt XML-kontroll: vent litt og forsøk kontrollen igjen. Andre deler
av serveren kan fortsatt brukes. Status og Sendt-opplysninger lagres samlet.
Se [gjennomgangen](SECURITY_REVIEW_2026-11-09.md) for detaljer.
