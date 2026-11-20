# Utstyrskontroll / Equipment inspections

Kontrollgrunnlag gjennomgått 20.11.2026. Modulen finnes i Salsy PC, PC-nett `/app/salsy/`, mobilnett `/app/` og Salsy Android. Den bruker samme krypterte serverdata og avdelingsgrenser som øvrige moduler.

## Aktivering og tilganger

Leder aktiverer **Utstyrskontroll** under **Innstillinger → Tilleggsmoduler**. Modulen er av som standard. Deaktivering skjuler siden og sperrer API-et uten å slette register eller historikk.

**Utstyrskontroll – se utstyr og utføre kontroll før bruk** gir ansatte tilgang til register, kontrollister, utstyrets sikkerhetshistorikk og utføring. **Administrere utstyr, kontrollister og frigivelse etter feil** gir vedlikehold av register/listene, PDF-eksport og dokumentert frigivelse. Rettigheten kan velges for IT ansvarlig uten ansattilknytning. Ved oppgradering får eksisterende leder-/IT-kontoer med HMS-, modul- eller serveradministrasjon administrasjonsrettigheten; øvrige eksplisitte tilganger beholdes. Regnskapsfører får ikke utstyrstilgang gjennom økonomirettigheter.

## Oppsett

1. Åpne **Utstyrskontroll → Kontrollister**. Lag egen liste eller velg et eksempel for truck, hjullaster, kjøretøyløfter eller generelt arbeidsutstyr.
2. Tilpass punkter og instruks etter produsentens manual og lokal risikovurdering. Velg hvilke feil som krever bruksstans, og hvilke punkter som kan være «Ikke relevant» med begrunnelse. Eksemplene har sikkerhetsstans på alle punkter som utgangspunkt.
3. Velg **Utstyr → Nytt utstyr**. Skriv navn, type, produsent/modell, serienummer og plassering. Kjøretøy har eget valgfritt registreringsnummer.
4. Serveren tildeler automatisk et femsifret utstyrsnummer, fra **00001**. Nummeret er unikt i hele bedriften, også mellom avdelinger, og beholdes når utstyret redigeres eller deaktiveres. Deaktiverte numre gjenbrukes ikke. Hver separat Salsy-server har sin egen nummerserie.
5. Knytt en kontrolliste til utstyret og dokumenter instruks/manual. Bekreft at oppsettet er tilpasset akkurat dette utstyret.
6. Velg kontroll før første bruk hver bruksdag, eller ved hver bruk/overtakelse. Ved sistnevnte valg markeres ikke utstyret ferdig for resten av dagen.
7. Registrer ved behov frist og rapport-/rutinereferanse for periodisk kontroll eller sakkyndig kontroll. En utløpt frist vises separat og gir leder en hendelse. Frister settes ikke automatisk ut fra utstyrsnavnet.

## QR-etikett 4 × 6 tommer

Åpne utstyret og velg **Skriv ut QR-etikett 4 × 6 tommer**. Kontroller nettadressen til mobilnettappen, vanligvis `https://bedriftens-server/app/`. Adressen må være tilgjengelig fra telefonene som skal skanne. PDF-en har én side på **101,6 × 152,4 mm**, med QR-kode og utstyrsnummer. Skriv ut med **faktisk størrelse / 100 %**, stående, på en 4 × 6-tommers etikett. Ved utskrift på A4 må man unngå «tilpass til side» for å beholde målene.

Vanlig mobilkamera åpner nettappen på riktig utstyr. Ved behov må den ansatte først logge inn. Android og nettklientene har dessuten **Skann utstyrs-QR**. PC og mobil har **Åpne med utstyrsnummer** som alternativ til kamera/skanner. QR-en inneholder ingen passord, klientkode eller tilgangsnøkkel. Den gir ikke nye rettigheter eller innsyn i andre avdelinger. Velg riktig avdeling før oppslag dersom kontoen har flere.

## Utføring når utstyret brukes

Åpne riktig utstyr → **Start kontroll ved bruk**. Kontroller fysisk før bruk etter instruksen, svar **OK**, **Avvik**, eller tillatt **Ikke relevant** på hvert punkt. Avvik og ikke-relevante punkter krever kommentar. Målerstand og samlet kommentar er valgfrie. Bekreft at kontrollen faktisk er utført, og lagre.

Det opprettes ingen manglende dagskontroller for dager der utstyret ikke brukes. Salsy vet ikke automatisk om en maskin fysisk er i bruk. Ny kontroll kreves ved endret utstyr eller kontrolliste. Serveren registrerer kontrollør og faktisk tidspunkt; etterregistrering med en oppdiktet dato tilbys ikke.

Sikkerhetskritisk feil eller kontrollørens avkryssing for uforsvarlig bruk setter **BRUKSSTANS** og gir leder en hendelse. Stans og sikre maskinen fysisk; Salsy er ikke en fysisk startsperre. En ny vanlig kontroll eller redigering av registeret opphever ikke bruksstansen.

Etter reparasjon velger ansvarlig med administrasjonsrett **Utbedring og frigivelse**, beskriver arbeid og kontroll, oppgir kvalifisert kontrollør og bekrefter at utstyret er forsvarlig kontrollert. Dette bevares i historikken. Ny brukskontroll kreves etter frigivelse. Frigivelse forlenger ikke fristen for periodisk eller sakkyndig kontroll. Utstyret kan deaktiveres uten at historikken fjernes.

## Logg og dokumentasjon

Kontrolloggen kan filtreres på periode og ett utstyr eller hele avdelingen. Den viser 100 kontroller per side. Innsendte kontroller beholdes uendret med kontrollisteversjon, utstyrsdata på kontrolltidspunktet, svar, kommentarer og kontrollør. Retting dokumenteres gjennom oppfølging og ny kontroll, ikke ved å overskrive gamle resultater.

Leder/IT med administrasjonsrett kan eksportere register og kontrollogg til PDF. Eksporten inkluderer avvik og relevante frigivelser. Ved mer enn 1000 kontroller må perioden eller utstyrsutvalget avgrenses. Sikre eksporterte filer etter bedriftens egne oppbevaringsrutiner.

## Faglig grunnlag og avgrensning

Forskrift om utførelse av arbeid kapittel 12 omhandler kontroll og vedlikehold, opplæring av kontrollpersonell og dokumentasjon. Kapittel 13 stiller ytterligere krav til sakkyndig kontroll for bestemte utstyrstyper. Daglig førbrukskontroll og periodisk/sakkyndig kontroll er forskjellige oppgaver. Det finnes ingen universell sjekkliste som passer alle maskiner.

Truck og visse hjullastere omfattes av ordningen for sakkyndig kontroll. Klassifisering av en kjøretøyløfter må vurderes etter faktisk konstruksjon og bruk; modulens eksempel betegner ikke alle kjøretøyløftere som utstyr med sertifisert sakkyndig kontroll. Produsentens instruks, risikovurdering, nødvendig opplæring og relevante kontrollkrav gjelder fortsatt. Salsy utsteder ikke et sakkyndig kontrollbevis.

Kilder kontrollert 20.11.2026:

- [Arbeidstilsynet – forskrift om utførelse av arbeid, kapittel 12 og 13](https://www.arbeidstilsynet.no/regelverk/forskrifter/forskrift-om-utforelse-av-arbeid/).
- [Arbeidstilsynet – sertifisert sakkyndig kontroll](https://www.arbeidstilsynet.no/risikofylt-arbeid/maskiner/sertifiseringsordningen-for-arbeidsutstyr/sakkyndig-kontroll/).
- [STILL – sikker bruk av gaffeltruck](https://data.still.de/assets/products/Service/Training/Driver_Training/pdfs/Safety_forklift_use_NO_Poster.pdf).
- [Volvo CE – kontroll og vedlikehold av hjullaster](https://www.volvoce.com/sv-se/discover/guides-and-advice/2020/four-quick-tips-to-prolong-wheel-loader-life/).
- [STENHØJ – produsentens manualarkiv](https://arkiv.stenhoj.dk/).

## English

Enable Equipment inspections in Settings. Employees carry out pre-use inspections; authorized managers and IT staff maintain equipment and checklists, follow up faults, print labels and export logs. Templates must be adapted to the actual manufacturer's instructions. Equipment gets a permanent, company-wide five-digit number. Vehicles may also have a registration number. Print the QR PDF at actual size on a portrait 4 × 6 inch label. The QR opens the correct equipment after authentication and does not bypass department or user permissions.

Answer every point, explain faults and permitted not-applicable answers, and confirm actual inspection. A safety fault latches an out-of-use status. Later ordinary checks cannot release it. An authorized manager records repair, qualified verification and release; a new pre-use check is then required. The application is not a physical immobilizer or a substitute for training, maintenance or required expert inspections. Submitted checks and their snapshots remain unchanged. Logs support date filtering, pagination and PDF export.
