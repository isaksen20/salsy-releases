# Kompetanse / Competencies — Salsy 0.87.0 og PRP 0.2.27

## Norsk

Aktiver **Kompetanse** under **Innstillinger → Tilleggsmoduler for bedriften**.
Modulvalg krever tilgang til modulinnstillinger (`manage_tasks`). Lederfanen
**Kompetanse** krever lederrolle og **Administrere ansatte og personalia**.
Deaktivering skjuler fanen og sperrer kompetanse-API-et, men beholder data.
Avdelinger har separate kompetanseregistre og tildelinger.

Opprett kompetanser med fullt navn, unik forkortelse på 2–3 bokstaver og farge.
Som i PRP kan kompetansen ha ring/firkant og krav om sammenhengende dekning.
Disse planleggingsfeltene brukes når data overføres til PRP; de endrer ikke
lønn eller eksisterende skiftplaner. OnCall er innebygd og kan ikke slettes.

Ansatte står nedover og kompetanser bortover. I nettklienten krysses ruten av.
I PC-klienten dobbeltklikkes ruten; alternativt velges kompetanse i listen over
matrisen og ansatt i matrisen, og mellomrom trykkes. Hver endring lagres straks.
Søkefeltet filtrerer ansatte. Sletting av en kompetanse skjuler dens tildelinger;
endringshistorikken beholdes. Historikk er ikke en dokumentasjon av kompetansebevis;
slike dokumenter lastes fortsatt opp under Ansettelse → Kompetansebevis og vedlegg.

**Hent fra Salsy** og eksisterende Salsy → PRP-eksport tar automatisk med
kompetanser, farger, planmarkeringer, sammenhengende dekning og den ansattes
kompetanse-ID-er. Dette følger også med i den eksisterende PRP-CSV-filen.
PRP-tilgang styres fortsatt separat; en PRP-konto kan hente dette grunnlaget
uten å få tilgang til personalia eller redigering av kompetanseregisteret.

**Eksporter kompetanse / Importer kompetanse** finnes i Salsy PC, PC-nettklient,
PRP Linux og PRP-nettappen. Formatet er UTF-8 JSON med `format: salsy-competencies`
og `version: 1`, maksimalt 8 MiB. Filen inneholder kompetanser samt ansatt-ID,
navn og kompetansetildelinger; ingen lønn, passord eller øvrige personalia.
Lagre filen privat siden navn og kvalifikasjoner er personopplysninger.

Importen er additiv: den legger til nye kompetanser og tildelinger, og fjerner
ikke eksisterende data, vakter eller behov. Eksisterende metadata beholdes.
Navn/forkortelser som kolliderer må samordnes før import. Ansatte kobles bare med
identisk ansatt-ID, aldri automatisk etter navn. Ukjente ansatte hoppes over,
og antallet vises. Start derfor gjerne med ansatte hentet fra Salsy eller en
lagret PRP-ansattliste hvis tildelingene skal tilbakeføres. Et frittstående
prosjekt med andre ansatt-ID-er kan fortsatt importere selve kompetansene;
kryss deretter av tildelingene manuelt. Ingen nye ansatte opprettes av importen.

Fra Salsy 0.88.0 bruker Ressursstyring de samme stabile kompetanse-ID-ene og
ansattilknytningene. Se [Ressursstyring](RESOURCE_MANAGEMENT.md).

## English

Enable **Competencies** in **Settings → Company add-on modules**. Settings require
`manage_tasks`; the manager tab requires an administrator/manager role and
`manage_employees`. Disabling the module hides its tab and denies its API,
without deleting records. Each department has a separate register.

Create a full name, unique 2–3 letter abbreviation and colour. PRP-compatible
circle/square markers and continuous-coverage requirements are optional.
OnCall is built in. Assign qualifications in the employee/competency matrix;
changes save immediately. Native PC: double-click a cell, or select a competency
above and an employee below, then press Space. Web: use the checkboxes.

Salsy → PRP retrieval and CSV exports include competencies and employee assignments.
Both Salsy desktop clients and both PRP clients can export/import a standalone
`salsy-competencies` version 1 JSON file (UTF-8, at most 8 MiB). Import adds
qualifications and assignments, keeps existing metadata, shifts and demand,
and matches employees strictly by ID. Unknown employees are skipped and counted;
conflicting qualification identities are rejected. No employees are created.
Use staff originally retrieved from Salsy to preserve employee IDs. Otherwise,
import the qualification catalogue and assign it manually. Keep exported files
private because they contain employee names and qualifications.

From Salsy 0.88.0, Resource management uses these same competency and employee
IDs. See [Resource management](RESOURCE_MANAGEMENT.md).
