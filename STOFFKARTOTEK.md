# Stoffkartotek – Salsy 0.97.0

Aktiver **Innstillinger → Tilleggsmoduler → Aktiver Stoffkartotek for bedriften**.
Fanen **Stoffkartotek** vises i sidemenyen for kontoer med lesetilgang.
Funksjonen finnes i Salsy PC, PC-nettklienten `/app/salsy/`, mobilnettklienten
`/app/` og Salsy Android 0.36.0. Lager-/Warehouse-appen er en separat klient.

## Finn og åpne et produkt

Søkefeltet filtrerer etter produktnavn, beskrivelse, leverandør, produktkode/UFI
eller bruks-/oppbevaringssted. Søket ignorerer store og små bokstaver. Flere ord
må finnes i oppføringens søkefelt, uansett rekkefølge. Tomt søk viser alle aktive
produkter. Flisene tilpasses skjermen, med opptil fem kolonner på stor skjerm.

Trykk på en flis. Farepiktogrammer og innskrevne tiltak vises over PDF-en.
**Påkrevd verneutstyr** vises først. Bruk **Forrige side / Neste side** for å
lese PDF-en. **Last ned original PDF** gir nøyaktig filen som ble lastet opp.
På PC lagres den i en valgt fil; Android åpner den via en tilgjengelig PDF-app;
i nettleseren lastes den ned. Innebygd sidevisning krever ingen ekstern PDF-app.

## Legg til eller rediger – tre steg

Krever **Administrere Stoffkartotek og sikkerhetsdatablad**, som kan delegeres
under brukertilganger. Vanlige ansatte får lesetilgang som standard, og kan
ikke endre oppføringene. IT-kontoer får kun tilgangene som er valgt for kontoen.
Regnskapsførerportalen får ikke stoffkartotektilgang automatisk.

1. **Produkt og datablad:** velg PDF, produktnavn, kort beskrivelse og ett av
   24 produktikoner. Leverandør, produktkode/UFI, plassering og databladets
   revisjonsdato kan også registreres. Ikonene er illustrasjoner og sier ikke
   noe om fareklassifisering.
2. **Faremerking:** velg de aktuelle GHS01–GHS09-piktogrammene, eventuelt
   varselord Fare/Advarsel og kopier H/EUH- og P-setninger fra avsnitt 2.
   Ikke velg piktogrammer hvis produktet ikke har disse. Salsy klassifiserer
   ikke produktet og oversetter ikke de innskrevne setningene automatisk.
3. **Verneutstyr og tiltak:** oppgi påkrevd verneutstyr fra avsnitt 8. Dersom
   databladet ikke krever verneutstyr, skriv dette uttrykkelig. Legg inn
   produktets tiltak ved øye-/hudkontakt, innånding og svelging, generelle
   tiltak, symptomer, behov for legehjelp og beredskapskontakt. Valgfrie felt
   finnes også for brann, søl, håndtering/oppbevaring og avfall. Bekreft at
   opplysningene er kontrollert mot databladet, og velg **Lagre produkt**.

Tilbakeknappen bevarer utkastet i veiviseren. Avbrytes veiviseren før lagring,
opprettes ingen oppføring. Redigering bruker samme veiviser. PDF-en trenger
ikke lastes opp igjen når bare tekst endres. Samtidige endringer oppdages,
slik at du må åpne oppføringen på nytt fremfor å overskrive andres arbeid.

**Arkiver produkt** skjuler det fra standardlisten. **Vis arkiverte produkter**
lar deg finne og aktivere det igjen. Tidligere innhold ved redigering beholdes
internt i den krypterte historikken og sikkerhetskopien; denne utgaven har
ikke en egen historikkviser for eldre PDF-revisjoner. Oppføringer slettes ikke
permanent fra brukergrensesnittet.

## Server, tilganger og tilgjengelighet

- Databladet må være en lesbar, ikke passordbeskyttet PDF på maksimalt 5 MiB
  og 1–200 sider. Originalfilen endres ikke.
- Serveren validerer og viser PDF-sidene som bilder med Poppler i en isolert
  Bubblewrap-prosess uten tilgang til bedriftsdata eller nettverk. JavaScript,
  skjemaer og vedlegg i PDF-en kjøres ikke i den innebygde visningen.
- Debian-pakken avhenger allerede av `poppler-utils`, `bubblewrap` og
  `util-linux`. Manglende verktøy eller blokkert isolering gir en tydelig
  feilmelding; dokumentet åpnes ikke med en ubeskyttet konverteringsprosess.
- Originaler og tidligere revisjoner lagres sammen med bedriftens krypterte
  data og følger vanlig sikkerhetskopi/gjenoppretting. Hver instans og hver
  avdeling har sitt eget kartotek. Slås modulen av, beholdes dataene.
- Innlogging, lesetilgang og aktivert modul kreves også ved direkte API-kall
  til dokumentet og PDF-sidene. Endringer loggføres; PDF-innhold kopieres ikke
  inn i endringsloggen.
- Det er ikke en frakoblet nødvisning. Arbeidsgiver må sikre at gjeldende
  datablad er tilgjengelige på arbeidsstedet også når nett/server er nede,
  for eksempel ved å laste ned nødvendige originaler.

## Faglig grunnlag og ansvar for produktopplysningene

Kontrollert 16.11.2026. Feltene følger aktuelle deler av sikkerhetsdatabladets
16 avsnitt. Tiltakene skal komme fra det konkrete produktets leverandør og
bedriftens risikovurdering. Tomme tiltak er ikke en bekreftelse på at produktet
er ufarlig. Mangler opplysninger, kontakt ansvarlig leder/leverandør.

- Arbeidstilsynet: https://www.arbeidstilsynet.no/risikofylt-arbeid/kjemikalier/stoffkartotek/
- Sikkerhetsdatablad: https://www.arbeidstilsynet.no/risikofylt-arbeid/kjemikalier/stoffkartotek/sikkerhetsdatablad/
- CLP-merking: https://www.miljodirektoratet.no/clp/
- Standardiserte GHS-piktogrammer: CCOHS, https://www.ccohs.ca/WHMISpictograms.html

Produktikoner er egenlagde Salsy-illustrasjoner. GHS-bildene er standardiserte
piktogrammer hentet fra CCOHS' nedlastbare piktogramsett; kildeadresser og
kontrolldato følger med i `web/chemical-assets/sources.json`. Valg av
faremerking følger produktets sikkerhetsdatablad og norsk CLP, ikke
kanadiske klassifiseringsregler.

## English guide

Enable **Settings → Optional modules → Enable the chemical register for the
company**. Open **Chemical register** from the sidebar. Search by name,
description, supplier, product code/UFI or location. Open a tile to see hazard
pictograms, required protective equipment and entered first aid measures above
the PDF pages. The original PDF can be downloaded without modification.

Managers with **Manage the chemical register and safety data sheets** use the
same three-step wizard in PC, desktop web, mobile web and Android: upload the
PDF and product information; select the exact hazard labels from section 2;
enter required PPE and the product's first aid/other precautions, then confirm
review. No automatic classification or medical instructions are generated.
Editing may keep the existing PDF. Archive hides products without destroying
their history. Staff read access does not grant editing. Departments and
server instances remain separate. Documents require authentication. PDFs must
be readable, unencrypted, at most 5 MiB and 200 pages. Secure PDF rendering
requires Poppler, Bubblewrap and util-linux. Provide separate workplace access
to current safety data sheets for network/server outages.
