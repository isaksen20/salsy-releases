# Kurs i Salsy 0.89.1 / Android 0.35.1

Oppdater serveren først, deretter PC- og Android-klientene. Nettappen følger serveren.
Kurs er av som standard. Aktiver **Innstillinger → Tilleggsmoduler → Aktiver Kurs**.
Modulvalg krever samme rettighet som Oppgaver (`manage_tasks`). Å opprette, publisere,
tildele og lese alle ansattes status krever `manage_courses`; administrator med
standardrettigheter får dette automatisk. Tilpassede lederkontoer må få rettigheten
under Brukere og tilganger. Deaktivering skjuler modulen og sperrer kurs-API-et,
men sletter ingen kurs, bilder, tildelinger eller resultater.

## Større lysbilder og prøveforsøk (0.89.1)

Kursvisningen bruker tilgjengelig bredde og høyde, med kompakt topp- og bunnlinje.
En side med bare ett bilde får størst mulig plass uten å kuttes. Velg
**Fullskjerm** for å skjule programrammen. I nettlesere som støtter det, brukes
også nettleserens fullskjerm; ellers fylles nettleservinduet. Avslutt med knappen
eller Esc. Forrige/Neste og minimumstiden virker som før.

Trykk på bildet for **Forstørr lysbildet**: bruk **Zoom inn**, **Zoom ut** og
**Tilpass** og rull/dra i bildet. Dette endrer ikke side eller progresjon.
Android har bildevisning over hele skjermen med knipezoom og dra-funksjon.
Telefonen kan vendes til liggende visning for bedre lesbarhet.

Leder velger **Antall prøveforsøk**, 1–100, i kursbyggeren; standard er **2**.
I PC-dialogen ligger feltet under **Legg til / endre prøve**. Grensen gjelder
sluttprøven, ikke medfølgende introduksjoner uten prøve. Et fullført prøveforsøk
bruker ett forsøk. Pauser og ny innlogging fortsetter samme forsøk.

Etter første ikke-beståtte forsøk kan ansatte starte kurset på nytt dersom det
finnes forsøk igjen. Når alle forsøk er brukt, vises **Du har ikke bestått,
kontakt din leder** og egen nullstilling sperres på serveren, også fra andre
klienter. Leder med `manage_courses` velger ansatt/bruker i kursstatus og trykker
**Nullstill kurs**, bekrefter og gir en ny runde med kursversjonens antall forsøk.
Tidligere forsøk og hvem som nullstilte, beholdes. Beståtte kurs nullstilles ikke.

Allerede publiserte versjoner uten feltet bruker to forsøk som standard, og
tidligere fullførte forsøk teller. Endret grense publiseres som en ny kursversjon;
eksisterende tildelinger følger fortsatt sin opprinnelige versjon. Bedriften kan
nullstille et ikke-bestått eldre kurs for å gi nye forsøk ved oppgraderingen.

## Medfølgende introduksjonskurs (0.89.0)

Når Kurs aktiveres, følger to publiserte introduksjonskurs med:

- **Salsy – introduksjon for ledere:** ni illustrerte lysbilder om ansatte og
  brukere, skiftplan/kalender, hendelser, lønnsgrunnlag, kompetanse/ressursstyring,
  reise/utlegg, modulvalg og gode daglige rutiner.
- **Salsy – introduksjon på mobilen:** seks illustrerte lysbilder om innlogging,
  kalender og meny, QR/NFC-stempling, registreringer, kvitteringer og egne oppgaver.

Begge bruker korte forklaringer og har **ingen prøve**. De fullføres etter siste
lysbilde. Tekst og illustrasjoner finnes på norsk og engelsk og følger valgt
språk. Tegningene er forenklede illustrasjoner, ikke bilder av bedriftsdata.
Moduler og handlinger som nevnes, krever fortsatt riktig tilgang og aktivering.

Leder-/administratorkontoer får lederkurset; ansattkontoer får mobilkurset.
Tildelingen knyttes til brukerkontoen, så en leder uten ansattilknytning kan også
gjennomføre kurset. Nye kontoer får sitt standardkurs når kurslisten åpnes.
Ved rollebytte legges riktig introduksjon til, mens tidligere historikk beholdes.
Tildelinger og fullføring beholdes ved deaktivering/reaktivering og ny innlogging;
kurset opprettes ikke dobbelt ved gjentatte åpninger. Avdelinger har egne data
og modulvalg. Vanlige tildelte kurs beholder eksisterende ansattkobling.

**Mine kurs** vises også for ledere uten ansattilknytning. Ledere med kurstilgang
kan velge ansatt eller brukerkonto i statusruten. Introduksjonskursene kan ikke
endres, publiseres på nytt eller tildeles manuelt. Egne bedriftskurs opprettes
som før. Kursbygging krever fortsatt `manage_courses`, mens et tildelt kurs
kan gjennomføres fra brukerens egen konto uten denne lederrettigheten.

## Importer PowerPoint som kurs

I PC og PC-nettklienten: **Kurs → Importer PowerPoint (.pptx)**.

1. Velg en `.pptx`-fil på maksimalt **20 MiB** med **1–100 lysbilder**.
   Lagre eldre `.ppt` som `.pptx` i PowerPoint/Impress først.
2. Velg kursnavn og felles minimumstid per lysbilde, 0–3600 sekunder.
3. Serveren konverterer presentasjonen til statiske lysbildebilder, og åpner
   en ny, upublisert kladd i kursbyggeren. Originalfilen beholdes ikke.
4. Kontroller alle sider. **Skjulte lysbilder tas også med**; slett dem du ikke
   vil bruke. Skrifter og enkelte PowerPoint-effekter kan gjengis annerledes.
5. Rediger overskrifter, rekkefølge og minimumstid, eller legg til innhold.
   Tekst og figurer inne i et importert bilde redigeres i PowerPoint og
   importeres på nytt; de er ikke separate tekstbokser i Salsy.
6. Legg til avsluttende prøve på vanlig måte hvis ønskelig. Importen lager
   ingen prøve automatisk. Lagre, publiser og tildel som andre bedriftskurs.

Bilder, tekst, bakgrunn og vanlig diagraminnhold gjengis som statiske bilder.
Animasjoner, video, lyd, presentatørnotater og klikkbare handlinger følger ikke
med. Makroer, OLE-/programobjekter, passordbeskyttelse og eksterne koblinger
avvises. Bygg inn nødvendige bilder og fjern eksterne lenker før import.
Vanlige innebygde XLSX-data til diagrammer kontrolleres separat.

Konverterte bilder begrenses til 1600 piksler på lengste side, **1 MiB per bilde**
og **24 MiB samlet**. Ved store presentasjoner: del filen i flere kurs.
Et avbrutt eller mislykket importforsøk lagrer ikke delvis kurs eller bilder.
Gjenta samme importforespørsel uten å opprette duplikat etter usikkert nettutfall.
Bare ett konverteringsarbeid kjøres om gangen per serverprosess. Native PC bruker
utvidet svartid bare for importen, mens grensesnittet arbeider i bakgrunnen.

### Serveroppsett

DEB-pakken bruker systempakkene `libreoffice-impress`, `poppler-utils`,
`bubblewrap`, `util-linux`, `fonts-dejavu-core` og `fonts-liberation`.
APT installerer disse avhengighetene sammen med serveren. Ved kjøring direkte
fra kildekode må serveransvarlig installere dem selv. Dependency fix inkluderer
dem også. Vanlige kurs og introduksjonene krever ikke at konvertereren kjøres.

LibreOffice og PDF-rendereren kjøres uten nettverk og uten tilgang til
serverens hjemmemappe/vault, i egne midlertidige mapper, med tids-/ressursgrenser.
Makrosikkerhet settes høyt, og makroinnhold avvises før konvertering.
Importen avbrytes hvis Bubblewrap/isoleringsfunksjonene ikke kan brukes; Salsy
faller ikke tilbake til uisolert konvertering. Serveren må tillate uprivilegerte
brukernavnerom. Ikke svekk isoleringen for å få importen til å virke; kontroller
serveroppsettet. Midlertidige originaler, profiler og PDF-er slettes etterpå.

Konverteringsparametere bygger på [LibreOffice sin dokumentasjon](https://help.libreoffice.org/latest/en-GB/text/shared/guide/start_parameters.html).
Isoleringsoppsettet bruker [Bubblewrap sine navnerom og filsystemgrenser](https://github.com/containers/bubblewrap/blob/main/bwrap.xml).

## Lag kurs på PC eller i nettappen

1. Åpne **Kurs → Nytt kurs**, skriv navn og velg felles bakgrunnsfarge eller bilde.
2. Legg til **Tekst og bilde** eller **Spørsmål**. Hver side har overskrift og
   minimumstid i sekunder. Tekstbokser og bilder legges etter hverandre i et fast,
   lesbart oppsett. Det er ikke en fri dra-og-slipp-presentasjonseditor.
3. Bruk **+ Tekstboks**, **+ Bilde** og **+ Svaralternativ** etter behov.
   For hvert svaralternativ velges tekst og om det er riktig. Flere svar kan være
   riktige; alle riktige og ingen gale må velges for at spørsmålet skal gi poeng.
4. Legg til avsluttende prøve, antall spørsmål og prosent for å bestå. Fyll ut
   hvert spørsmål. Antall spørsmål kan økes senere. Introduksjon og resultatside
   genereres automatisk: åtte spørsmål gir ti prøvesider.
5. **Lagre kurs**, deretter **Publiser**. Publisering kontrollerer at alle
   spørsmål har tekst, minst to alternativer og minst ett riktig alternativ.
6. **Tildel ansatte** på PC / **Tildel kurs** i nettappen. Velg én eller flere.
   Den samme publiserte versjonen tildeles ikke dobbelt til samme ansatt.

Lysbilder kan legges til, flyttes, fjernes og redigeres under arbeidet. Husk å
lagre før kursbyggeren lukkes. Lagring har versjonskontroll for å hindre at to
ledere overskriver hverandres endringer. Publisering lager en egen uforanderlig
kursversjon. Eksisterende tildelinger følger den gamle versjonen; publiserte
endringer tildeles som et nytt kursforsøk uten å endre tidligere resultater.

PC-byggeren tar gyldig PNG (maks 1 MiB og 4096 × 4096). Nettbyggeren skalerer opplastede
bilder og konverterer dem til PNG. Bilder lagres kryptert i serverens vault og
leveres kun til leder eller ansatte som har fått et kurs med dette bildet.
Store kurs kan nå API-ets grense på 256 KiB for selve kursbeskrivelsen; bilder
lastes opp separat. Maks 100 lysbilder, 50 prøvespørsmål og 20 alternativer per
spørsmål. Dagens lagring skriver en kryptert snapshot; mange store bilder og
samtidige deltakere krever kapasitetstesting før stor utrulling.

## Gjennomføring

Ansatte finner tildelte kurs i **Kurs** på PC, Android og nett. Android viser
også lederens tildelingsstatus; kursbygging og tildeling gjøres på PC/nett.

- **Forrige** er tilgjengelig uten venting. **Neste** låses til minimumstiden
  er oppfylt. Tiden registreres via korte pulser mens klienten viser kurset;
  lange avbrudd og tid uten forbindelse teller ikke. Dette er et pedagogisk
  tidskrav, ikke bevis for at deltakeren faktisk har lest teksten.
- Spørsmål besvares med avkrysningsbokser. **Svar** står over navigasjonen og
  sender svaret samtidig som neste side åpnes. Innsendte svar kan ikke endres
  i samme forsøk, heller ikke ved å gå tilbake.
- Resultatsiden viser bestått/ikke bestått og antall riktige. Kravet rundes opp:
  80 % av åtte spørsmål krever sju riktige. Øvingsspørsmål på lysbilder teller
  ikke i sluttprøven. Kurs uten sluttprøve fullføres etter siste lysbilde.
- Etter bestått prøve åpner **Se svar** en gjennomgang, én side per spørsmål,
  med avgitte svar og fasit. Fasiten sendes ikke til ansatte før bestått prøve.
- **Avslutt kurs** går tilbake til kurslisten. Ved ikke bestått kan deltakeren
  bruke **Reset kurs** så lenge det er forsøk igjen; hele kurset starter på nytt og gammelt forsøk beholdes.
- Lederen ser ikke startet, startet, bestått eller ikke bestått i kurslisten.
  Nettappen viser også start-/sluttidspunkt. Progresjon lagres hos serveren og
  fortsetter ved ny innlogging eller på en annen klient.

## Kontroll

API-tester dekker rettigheter, bildeskjerming, publiseringskrav, versjonskonflikt,
uendrede tildelte versjoner, minimumstid, lange avbrudd, svarvalidering, poeng,
reset, historikk og skjult fasit. Nettlesertesten bygger et kurs med to spørsmål,
tildeler det, logger inn som ansatt, venter ut tidskravet, består og viser svar.
Android bygges og APK-signaturen kontrolleres. PC-kursbygger og kursvisning er i 0.24.1 testet med ekte Tk via vertsmaskinens Python
(`tests/course_gui_smoke.py`), inkludert nye sider, tekst, lagring, prøvespørsmål,
bakgrunn og tidslåste kontroller. Android/iPhone må fortsatt prøves fysisk.

## Kursstatus per ansatt (PC 0.24.2)

Ledere har en egen rute under kursbyggerlisten: **Kursstatus per ansatt**.
Velg ansatt over ruten for å se alle tildelte kurs med kursnavn og status.
Listen viser Ikke startet, Startet, Bestått eller Ikke bestått. Ansatte uten
tildelinger får en tydelig tommelding. **Oppdater status** henter nye resultater
og beholder valgt ansatt. Dobbeltklikk på andre ansattes kurs viser status;
gjennomføring krever den ansattes egen konto.

## English — PowerPoint and bundled introductions

Server/PC 0.89.0 and Android 0.35.0 include two bilingual illustrated introductions,
with short captions and **no exams**: nine pages for managers and six for mobile
users. Enable Courses to assign the appropriate introduction automatically.
Assignments belong to accounts, including managers without an employee link.
New accounts get their default introduction when the course list is opened.
Disabling/re-enabling preserves progress; role changes add the appropriate course
without deleting earlier history. Department data remains separate.
Bundled courses are immutable; custom courses remain editable and assignable.

In either desktop client, choose **Courses → Import PowerPoint (.pptx)**. Use a
20 MiB or smaller .pptx with 1–100 slides, choose a title/minimum slide time and
open the converted draft. Review all pages, including hidden slides. The course
uses static slide images; animation, video/audio, speaker notes and interactive
actions are excluded. Fonts/effects may differ. Macros, external links and OLE
objects are rejected. Edit text/graphics inside slide images in PowerPoint;
course titles, order, time limits, extra content and a normal Salsy exam can be
added in the builder. Import adds no exam automatically. Save, publish and assign.

The server uses system LibreOffice Impress, Poppler, Bubblewrap, util-linux and
fonts, declared as DEB dependencies. Conversion has no network or access to the
vault/home directory and never falls back to an unisolated process. One import
runs at a time, with bounded time/memory/output; originals and temporary PDF/profile
files are removed. Output is capped at 1600 pixels, 1 MiB per slide and 24 MiB total.
Import commits images and the draft together; failed jobs leave no partial course.

## English: course display and attempt limits (0.89.1)

Slides use the available viewport. Full screen hides application chrome and uses
browser fullscreen when supported; otherwise it fills the browser viewport.
Select an image to zoom and pan without changing course progression. Native PC
and Android include enlarged image viewers; Android also supports pinch zoom.

Courses default to two completed final-exam attempts. Managers can choose 1–100
in the builder. After all attempts fail, the learner sees “You have not passed,
contact your manager”. Server checks prevent self-reset across clients. A user
with manage_courses can reset a failed course from the learner status list,
granting a new round while retaining attempt and reset history. Existing
versions missing the setting default to two and count previous completed attempts.
Changes to a draft do not alter existing published-version assignments.
