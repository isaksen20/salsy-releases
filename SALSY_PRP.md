# Salsy PRP – skift- og bemanningsplanlegging

Salsy Personnel Resource Planning er en separat Linux-app. Den fungerer uten Salsy-server, brukerkonto, internett eller innlogging etter at avhengighetene er installert. Den kan i tillegg brukes som nettapp på en Salsy-server som har aktivert PRP. Begge bruker samme Python-motor.

## Kvarter og rekkefølge på ansatte

PRP genererer start og slutt på hele kvarter: **:00, :15, :30 og :45**. Dette gjelder ordinære vakter, OnCall, etterfylling og omfordeling. Nye manuelt registrerte vakter avrundes til nærmeste kvarter før regelkontrollen. Eksempel: **08:00–15:54 blir 08:00–16:00**, altså åtte timer, når dette passer med reglene og timemålet.

Timemål, stillingsprosent, pauser og OnCall-vekting beregnes fortsatt nøyaktig. Avrunding øker ikke norm- eller hvilegrensene. Hvis nærmeste kvarter gir for mange timer, bruker generatoren et kortere lovlig alternativ. Har man 7,9 normtimer tilgjengelig, kan det for eksempel planlegges 7,75 arbeidstimer. Resten vises i pluss/minus; det opprettes ingen vakt med et par ekstra minutter for å fylle resten. Bemanningsbehovets opprinnelige tider beholdes. Ved behov utenfor kvartergrid kan avrundede vakter gi små dekningshull eller ekstra dekning, som fremdeles beregnes fra det faktiske behovet.

Ved ny generering tilpasses eldre, ulåste vakter med minuttider til nærmeste lovlige kvarter eller genereres på nytt. Originalfilen endres først ved lagring. Låste vakter utenfor kvarter må redigeres eller låses opp først; **Generer fra tom** kan erstatte hele planen etter vanlig bekreftelse.

I **Ansatte** velger du en ansatt og bruker **Flytt opp** eller **Flytt ned**. I nettappen ligger knappene på hver ansattrad. Den valgte ansatte beholdes markert i Linux-listen, slik at flere flytt er raske. Rekkefølgen følger planvisningen, PDF, Excel, prosjekt-/CSV-filer og lagrede ansattlister. Husk å lagre etter flytting. Vakttider og tilknytningen mellom ansatt og vakt endres ikke ved flytting.

English: Generated work and OnCall shifts use quarter-hour clock boundaries. Manual shift entries round to the nearest quarter before validation. Contract targets, breaks and OnCall weights remain exact; leftover minutes may remain unallocated. Existing unlocked minute shifts are migrated during generation; locks are never silently moved. Use **Flytt opp/Flytt ned** to reorder employees; the order is retained in projects, staff lists and exports.

## Start den frittstående appen

Last ned `salsy-prp_0.2.19-1_amd64.deb` fra den offisielle GitHub-utgivelsen og installer på Debian 13 med `sudo apt install ./salsy-prp_0.2.19-1_amd64.deb` fra nedlastingsmappen. Pakken inkluderer planleggingsmotoren og trenger ikke Salsy Server installert. Start Salsy PRP fra programmenyen. Python 3.13 og python3-tk er systemavhengigheter som APT installerer ved behov.

I utviklingsmiljøet kan appen også startes med `Salsy-PRP.desktop` eller `./start-prp.sh` i prosjektmappen. Første oppstart oppretter da `.venv-prp` og trenger nett for PRPs avhengigheter, samt python3-venv og python3-tk. Utviklingsfilene følger ikke med den offentlige utgivelsen.

Trykk **Ny → Legg inn antall ansatte → Neste**. Fyll inn fornavn, stillingsprosent og ukentlig timetall for 100 % stilling. Like fornavn er tillatt; hver ansatt har egen intern ID. Under Ansatte kan du endre helgeintervall og første arbeidshelg for hver ansatt. Tomt helgeintervall bruker planens standard. Velg for eksempel hver tredje helg som standard og hver andre eller fjerde helg på enkelte ansatte.

## Hele behovssøyler og kontroll av ledig kapasitet

Vanlige behov **uten kompetansekrav** teller fullt i antall ansatte og kan dekkes av alle. OnCall krever fortsatt egen godkjenning. To samtidige søyler trenger to personer i overlappen: 05:00–11:30 og 05:00–14:30 gir helst nøyaktig disse to vaktene, begge med start 05:00. Vaktene 05:00–11:30 og 11:30–14:30 dekker ikke dette behovet.

Motoren prøver komplette søyler før alternative tider og sammenslåinger. Nødvendig deling/tilpasning brukes når hele søyler ikke kan tildeles innenfor tilgjengelige ressurser og valgte regler. Etterfølgende, ikke-overlappende behov kan fortsatt slås sammen ved knapp bemanning. Samtidige behov summeres og blir aldri én person ved å flytte den andre starten til første vakts slutt. Kompetanse kan kombineres som beskrevet nedenfor, men antall hoder består.

På store planer frigjøres én og to ansattes vakter over hele perioden i egne søk. Dette kan flytte arbeid mellom nabouker og bytte vakter mellom kolleger, mens låser og tidsgrenser beholdes. Forbedringssøket beskytter både helgedekning og samlet dekning. Starter en eksisterende plan, kan ikke et dårligere startforslag erstatte den ved å forbedre litt helg og miste mye hverdag. Etter søk og restnormomfordeling kontrolleres alle ansatte igjen for lovlige, nyttige hele søyler til ingen direkte tillegg finnes. Dette beviser ikke at ingen større global omfordeling kan hjelpe.

**Ukegrenser gjelder kalenderuker, mandag–søndag.** Arbeid før og etter søndag midnatt fordeles på hver sin kalenderuke, også for nattevakter. Én ukes snitt gir en egen normgrense for hver uke; lengre snittperiode fordeler normen over valgte hele uker. Hvile kontrolleres som egne regler. En forhøyet ukesgrense gjennom dispensasjon må gjelde hele den planlagte kalenderuken; en enkelt dispensasjonsdag opphever ikke grensen for resten av uken. PRP endrer ingen av innstillingene automatisk.

## Lagre ansattlisten til neste plan

Åpne **Ansatte → Lagre ansattliste**. Filen `.prp-staff` inneholder navn, stillingsprosent, kompetanser med farger/markering, OnCall-tilgang, individuelle helgeintervaller/ankerdatoer, ukentlig timetall ved 100 % og standard arbeidshelg. Den inneholder ikke vakter, behov, lønn eller innloggingsdata. Opprett neste plan og velg **Ansatte → Åpne ansattliste**. Dette fungerer uten server i Linux, og tilsvarende som nedlasting/opplasting i nettappen.

Innlasting erstatter ansatte og fjerner eksisterende vakter etter bekreftelse. Planperiode, behov og generelle regler beholdes. Kompetanser gjenbrukes etter ID/forkortelse. Personavtaler med ansatte som ikke finnes i listen, fjernes med merknad; de blir aldri gjort gjeldende for alle. Kontroller helgeankere og avtaler før neste generering. Bruk vanlig **Lagre** for å bevare hele prosjektet med behov og tariffregler.

## Generering og helgedekning

**Generer plan** beholder låste vakter og sammenligner nye forslag med en gyldig eksisterende plan. **Generer fra tom** bygger hele perioden på nytt og erstatter også låste vakter etter bekreftelse. Ansatte, behov, kompetanse, regler og dispensasjoner beholdes. Ved avbrutt bekreftelse eller beregningsfeil beholdes den gamle planen. Prosjektfilen overskrives først ved vanlig lagring.

PRP reserverer kapasitet til lørdag/søndag før hverdagene fylles. Kvalifisert helgedekning prioriteres foran samlet dekning og myke ønsker om søyleform eller rene tidlig-/kveldsuker. Nattarbeid regnes etter faktisk tid i helgen. Personens valgte arbeidshelger, kompetanse, låser og aktive tidsregler gjelder fortsatt; helgeprioritering gir ikke tilgang til å jobbe på andre helger enn valgt mønster. Resultatlinjen viser både udekkede persontimer totalt og udekkede helgetimer.

Etterfylling forlenger vakter eller legger til vakter innenfor ledig norm. Deretter kan PRP korte ned en ulåst hverdagsvakt og legge til en ny vakt på en annen dato når det gir større forbedring i kvalifisert dekning. Ingen helgedekning ofres. Hver endring og hele resultatet kontrolleres mot norm, hvile, minimumstid, kompetanse, overlapp og låser; resultatlinjen viser etterfylte og omfordelte timer separat.

Startsøk og etterfylling får mer tid på store planer og unngår gjentatt kontroll av uendrede, umulige kandidater. Store planer kan bruke flere minutter. Søket er tidsbegrenset og garanterer ikke maksimal bemanning eller full dekning. Ledig normtid kan fortsatt være ubrukelig på grunn av tidspunkt, kompetanse, minste oppmøte, helgemønster eller hvile. Kontroller **Dekning og timer** og udekkede linjer før planen brukes.

## Planmatrise og grafisk behovsplanlegger

Planmatrisen er hovedvisningen og fyller det meste av vinduet. Ansatte ligger i rader og datoer i kolonner med tydelige cellelinjer. Rull vannrett og loddrett; navn og datooverskrifter følger med. Knappene **Ansatte**, **Behov**, **Regler og tariff** og **Dekning og timer** over planen åpner egne vinduer. Utseendet bruker hvitt og gråtoner.

Velg **Planperiode** for fra- og til-dato. Du kan skrive DD.MM.ÅÅÅÅ eller bruke kalenderknappen i Linux-appen. Nettleseren bruker sin datovelger.

Åpne **Behov** og velg **Dagvisning** eller **Ukesvisning**. Pilene flytter én dag eller én uke. Ukedagsoverskriftene blir stående når du ruller i klokkeslett. Tidskolonnen er festet til venstresiden, også når du ruller vannrett til senere dager i uken. Klokkeslettene følger tidslinjene ved loddrett rulling. Klikk i tidskolonnen oppretter ikke behov. Klikk en datooverskrift i uken, eller bruk **Velg dato**, for å velge dagen du vil endre.

**Standardbehov** gjelder alle forekomster av denne ukedagen i planperioden uten datounntak. Velg for eksempel en torsdag og legg inn søyler for bemanningen torsdagene skal ha. Velg en bestemt dato og trykk **Unikt behov** for å kopiere ukedagsmalen til et eget datounntak. Endringer gjelder da bare denne datoen. Også et tomt unikt behov beholdes: sletting av siste søyle gir ikke malen tilbake. **Standardbehov** på en unik dato fjerner datounntaket etter bekreftelse og tar i bruk ukedagsmalen igjen. Andre unike datoer beholdes.

**Kopier behov fra …** kopierer tidene, antall personer og begge kompetansekravene fra en annen dato. Velg for eksempel tirsdag, trykk knappen og velg mandag som kilde. Velg om kopien skal bli standard for alle tirsdager eller bare gjelde denne datoen. Eksisterende behov på målet erstattes etter bekreftelse; kildedagen og andre datounntak beholdes. Kopierte søyler har egne ID-er og kan redigeres uavhengig.

Høyreklikk i et **tomt felt på dagen → Kopier fra forrige dag** for en rask kopi. Høyreklikk på onsdag kopierer tirsdagens effektive behov, også når tirsdag er et datounntak. Målet følger sitt gjeldende valg: standardbehov for ukedagen eller bare denne unike datoen. Eksisterende behov erstattes etter bekreftelse. På første dato er valget deaktivert fordi dagen før ligger utenfor planperioden. Dette gjelder dag- og ukesvisning i både Linux- og nettappen.

Behovsvisningen beholdes når du legger til, endrer eller sletter søyler. Uendrede søyler og rulleposisjonen blir stående. Beregning av dekning og udekkede vakter oppdateres separat i bakgrunnen; ved raske endringer brukes bare det nyeste resultatet. I nettappen vises «Oppdaterer dekning …» i oversikten mens dette pågår.

Klikk et tomt klokkeslett for å opprette én behovssøyle. **Én ny søyle betyr én person**; overlappende nye søyler summeres. Tre søyler 08:00–12:00 og to 09:00–15:30 gir behov for fem ansatte mellom 09:00 og 12:00. Dra den svarte øvre eller nedre endekanten for å endre start eller slutt, med 15 minutters intervaller. Høyreklikk en søyle og velg **Rediger** for nøyaktige tider eller **Slett**. I nettleser kan også Enter redigere og Delete slette en fokusert søyle. **Nytt behov** åpner samme skjema og lar deg angi flere personer i én søyle.

Velg kompetanse for nye søyler, eller la valget være **Ingen kompetanse**. OnCall finnes som en egen kompetanse. Arbeidsbehov har minste oppmøtetid fra reglene, normalt tre timer. Både `1530` og `15:30` godtas i tidsfeltene. Slutt før start betyr neste dato. Nattbehov kan legges inn presist i redigeringsvinduet; grafen viser hele søylen på startdatoen og merker slutt neste dag med +1.

Behov fra eldre PRP-prosjekter bevares som datounntak. Deres opprinnelige beregning med største overlappende antall beholdes, slik at gamle planer ikke endrer bemanningskrav ved åpning. Nye grafiske søyler kommer i tillegg. Filene beholder både malene, unike datoer og denne forskjellen.

Ved generering prioriterer PRP at **én søyle blir én hel vakt for én kvalifisert person**. En søyle med antall to trenger to personer. Eksempel: søyler 08:00–14:00 og 10:00–16:00 gir helst disse to vaktene, fremfor én lang og én kort mellomvakt. Kompetanser kan fortsatt kombineres etter bemanningsreglene nedenfor. Samlet dekning, låste vakter og valgte regler kan kreve andre tider, sammenslåing eller deling. Preferansen brukes også i det regelkontrollerte utgangspunktet ved kort søketid.

Behov 08:00–11:00 og 11:30–14:30 kan dekkes av én vakt 08:00–14:30. Det rundes ikke automatisk til sju timer. Innstillingen for største mellomrom styrer hvor lange opphold motoren kan binde sammen.

Kryss av **Tillat splittvakt på valgt dato** på de datoene det skal være tillatt, maksimalt to arbeidsøkter per dato. Uten avkrysning får en ansatt høyst én arbeidsøkt den dagen. Dette valget er knyttet til datoen, også når behovet følger en ukedagsmal.


## Sammenhengende kompetansedekning

Åpne **Kompetanse → Rediger kompetanse → Rediger**, og kryss av **Sammenhengende dekning av én person per søyle** for for eksempel Cargo eller Clean. Det gjelder i både Linux- og nettappen og lagres i prosjekt, CSV og ansattliste. Nye og gamle kompetanser har valget avslått inntil du slår det på.

Generatoren reserverer disse sammenhengende kompetansebehovene før generell bemanning, og lar ikke senere etterfylling bruke opp denne dekningen. Ved for få ansatte kan dette etterlate flere generelle behov udekket.

En søyle Cargo 04:15–15:15 krever da én Cargo-kvalifisert ansatt med en sammenhengende vakt som dekker hele tidsrommet. To halve vakter godkjennes ikke som denne dekningen. To samtidige Clean-søyler 19:00–24:00 krever to ulike kvalifiserte ansatte gjennom hele perioden. Kombinerte kompetanser på en søyle må finnes hos samme person. Ulike kompetanser på forskjellige søyler kan fortsatt dekkes av én person med begge kvalifikasjoner, mens antall hoder beholdes.

Kravet gjelder arbeidssøyler som ikke er lengre enn maksimal vaktlengde etter aktuelle tariffregler og dokumenterte dispensasjoner. Lengre søyler kan deles innenfor tidsreglene. OnCall kan også ha sammenhengende dekning. Hvile, stillingens normtimer, helgerotasjon og låste vakter gjelder fortsatt. Ved minuttider utenfor kvartergrid rundes en sammenhengende søyle utover ved generering; faktiske behov og timemål kontrolleres fortsatt nøyaktig.

Ved for lite kvalifisert kapasitet står kompetansebehovet som **udekket** i **Dekning og timer**, med forkortelse og antall. PDF-en viser en tydelig merknad dersom kompetansebehov er udekket. Ringer og firkanter bygger på samme kontrollerte tildeling som dekningsoversikten; en delt Cargo-søyle får ikke en falsk markering av hel dekning. Excel-arket **Dekning** viser også hvilke kompetanser som mangler. Lagre/generer på nytt for å bruke valget på en eksisterende plan.

English: Enable **Sammenhengende dekning av én person per søyle** in the competency editor to require one qualified employee for the entire column, when within effective maximum shift length. Two simultaneous columns of the same skill require distinct owners. Missing full coverage is reported rather than certified from partial shifts. Generated codes use at most A–F per chronological number group; historical projects remain readable. The shared engine is used by desktop and web.

## Vaktkoder og arbeid over midnatt

Tallet **1–9** beskriver tidsgruppen for vaktstart, fra tidligste gruppe **1** til seneste **9**. Ved én starttid brukes **1**. Med færre enn ni grupper fordeles tallene mellom 1 og 9. Flere enn ni starttider samles i ni kronologiske grupper med nærliggende klokkeslett. Bokstav **A–F** skiller variantene i gruppen: starttid, sluttid og Arbeid/OnCall. Like vakter deler kode. Vakter med samme starttid ligger i samme gruppe. Sluttidene sorteres i faktisk tidsrekkefølge: 23:30 før 00:00 neste dag, deretter 01:00. Eksempel når kl. 16 er seneste gruppe: **9A** 16:00–23:30, **9B** 16:00–00:00 +1 og **9C** 16:00–01:00 +1. 00:00 og 24:00 som sluttid beskriver samme midnatt og får samme kode. Ny generering bruker maksimalt **seks varianter (A–F)** per gruppe, høyst 54 faktiske vakttyper totalt. Hele behovssøyler, registrerte tidsgrenser og normtilpassede tider prioriteres i vaktutvalget. Generatoren kan derfor la behov stå udekket hvis flere varianter kreves. Låste tider endres aldri for å komme under grensen; for mange ulike låste vakter stopper genereringen med forklaring. Gamle prosjekter med A–Z kan fortsatt åpnes og eksporteres uten å endre tider. Ny generering samler variantene på nytt. Ulike tider får aldri samme kode. Gruppene beregnes fra den aktuelle planen.

En vakt **mandag 16:00–01:00** slutter tirsdag og regnes som ni klokketimer før eventuelt pausatrekk. Skriv sluttid tidligere enn starttid for å fortsette inn i neste døgn. Vaktboksen og behovssøylen vises på startdatoen i PRP. **+1** betyr neste dag.

Behovsplanleggeren viser til **02:00 +1** som standard. Du kan dra sluttkanten over midnatt. For senere slutt høyreklikker du søylen, velger **Rediger** og skriver for eksempel **04:15**. Visningen forlenges automatisk til neste halvtimeslinje, her **04:30 +1**, i dag- og ukesvisning. Tidskolonnen blir stående til venstre. Klikk etter midnatt oppretter ikke et nytt behov på feil dato; opprett nye behov på datoen de starter. Timer, hvile og manglende kompetansedekning kontrolleres også over midnatt.

Ved åpning får eldre planer de nye kodene i visningen uten å endre vakttider. Originalfilen endres først ved lagring. PDF/Excel bruker samme koder, og Excel viser også sluttdato. Endrede koder alene oppretter ikke en ny import av samme tidligere genererte plan til Salsy.

Salsy-import deler ordinært nattarbeid i kalenderdager ved midnatt, med samme totale arbeidstid. Planperioden må også omfatte sluttdatoen. Automatisk import av nattevakter med ubetalt matpause støttes foreløpig ikke; importen stopper med forklaring slik at pausen ikke trekkes feil. OnCall beholder startdatoen.

## Kompetanse og bemanning

Trykk **Kompetanse** over planen eller inne i behovsplanleggeren. Vinduet viser ansatte nedover til venstre og kompetansene bortover. Klikk avkrysningene for å registrere hva hver ansatt kan utføre. **Rediger kompetanse** åpner listen der du kan legge til, redigere og slette kompetanser. Hver kompetanse har fullt navn, en unik forkortelse på to eller tre bokstaver og egen søylefarge. OnCall er innebygd; navn, forkortelse og farge kan redigeres, men kompetansen kan ikke slettes.

I **Kompetanse → Rediger kompetanse → Rediger** velger du **Markering i skiftplan**: **Ingen**, **Ring** eller **Firkant**. Markeringen bruker kompetansens eksisterende farge og viser hvem som dekker kompetansebehov i den aktuelle vakten. To samtidige Clean-behov gir høyst to samtidige Clean-oppgaver, også om flere ansatte har kompetansen. Andre kvalifiserte kan dekke vanlig bemanning uten Clean-markering. Vakter uten tidsmessig overlapp med kompetansebehovet markeres ikke. Kompetanselisten viser fremdeles alt den ansatte er kvalifisert for.

Fordelingen beregnes fra behov og eksisterende vakter og holder samme person på oppgaven så lenge det passer. Ved et nødvendig skifte kan flere personer ha markering i løpet av dagen, men antallet samtidige kompetanseoppgaver overstiger ikke behovet. Pek på vakten for oppgave og tidspunkt; Excel-arket **Vakter** har også disse tidene. Manglende dekning fylles ikke med falske markeringer. Kombinerte kompetanser og antall personer kontrolleres fortsatt som før.

Flere markeringer på samme vakt deler omrisset i fargede deler; ring og firkant kan vises sammen. OnCall-bakgrunnen beholdes. **Ingen** er standard. Valget lagres i PRP-/CSV-filer. Kompetanseoppgavene beregnes på nytt ved åpning eller endring, også i eldre planer, uten å endre vakttid eller bemanning. Undervinduer åpnes foran vinduet de tilhører, også redigering fra kompetanselisten og dato-/fargevalg.

Markeringene vises også i ukearkene i Excel og i PDF. Excel beholder vaktinformasjonen som vanlig celletekst, med markeringen og lesbar vaktinformasjon som et bilde over cellen. Ved etterredigering i Excel må bildet fjernes eller eksporten lages på nytt. Arket **Markeringer** forklarer farger og former. Endret markering endrer ikke timer, kompetansedekning eller en tidligere import til Salsy.

## Kompakt utskriftsplan

**PDF** i Linux-appen og PRP-nettappen lager samme plan med navn nedover og datoer bortover. Svake vannrette linjer skiller ansatte, et lyst rutenett skiller dagsrutene, og ukeskillene er litt tydeligere. Opptil seks uker samles på hver side. Lange planer bruker liggende A3 for lesbare koder; mindre planer bruker A4. En vanlig plan får plass på én eller to sider. Flere ansatte, mange kompetanser eller regelmerknader kan kreve flere sider. Ingen navn, vakter eller regelmerknader kuttes for å tvinge planen ned på to sider.

I dagsrutene står korte vaktkoder. Listen **Vaktkoder og tider** viser grunnkodene fra hele planen, med start, slutt og lengde i klokketimer. **O** betyr OnCall, **+1** betyr neste døgn, **x** betyr fri og **\*** betyr låst vakt. Flere koder i én dagsrute viser flere vakter. OnCall-dager beholder valgt bakgrunnsfarge. O-en i for eksempel **9AO** er bare en merking i dagsruten: kodeoversikten viser bare **9A**, uten en ekstra 9AO-rad. Forklaringen beskriver at en ekstra O betyr OnCall etter vakten.

Fra PRP 0.2.17 bruker planrutenettet hele sidebredden, med større skrift på navn og vaktkoder. **Forklaring** og **Vaktkoder og tider** står ved siden av hverandre under planen på siste planside, og gjentas ikke på tidligere sider. En niukersplan får seks uker på første side og tre på andre, med den felles oversikten under på side to. Er det for mange ansatte til at begge oversiktene får plass under, flyttes begge til en felles side etter planen; dette kan gi en tredje side. Ekstremt mange koder eller kompetanser fortsetter på flere sider uten å kuttes.

**Forklaring** viser ring eller firkant i kompetansens farge, med fullt navn og forkortelse. Markeringene følger tildelte kompetanseoppgaver. Har mange kompetanser markering, fortsetter forklaringen i et tydelig merket vedlegg.

Udekte vakter tas ikke med i PDF-planen eller Excel-ukearkene. Manglende årsverk for hele planperioden står øverst på hver PDF-planside og bruker samme beregning som i appen. Detaljene beholdes i Excel-arkene **Vakter** og **Dekning**, og de udekte linjene i selve appen beholdes. Timer, norm og pluss/minus finnes fortsatt i Excel-arket **Oversikt**. Regelbrudd, importmerknader og registrerte dispensasjoner følger PDF-en som vedlegg når de finnes.

English: From PRP 0.2.17, the grid uses the full page width with larger names and shift codes. The legend and complete shift-code key appear side by side only below the final roster page. Nine weeks use six weeks on page one and three on page two. If the two blocks cannot fit below the last staff row, both move to a shared additional page, which may be page three. Earlier-only shift types remain in the complete final key. PDF export uses the same compact roster in the desktop and web apps: people down, dates across, a light grid, up to six weeks per sheet, a shift-code/time key and colored competency-shape legends. Unassigned shifts are omitted; the whole-period staffing shortfall remains in the heading. Large plans and control notes may need extra pages. Detailed staffing and hour calculations remain in Excel.

Høyreklikk en behovssøyle og velg kompetanser. Du kan slå av/på inntil to krav. **Ingen kompetanse** fjerner begge kravene. **Rediger** åpner et skjema med **Kompetanse 1** og **Kompetanse 2**. Forkortelsene står på søylen; med to krav vises begge fargene. En søyle med to kompetanser krever at den som dekker dette kompetansekravet har begge.

Kompetansekrav og antall personer beregnes hver for seg. Eksempel: To samtidige søyler krever henholdsvis A og B. En ansatt med A og B kan oppfylle begge kompetansekravene, men det trengs fortsatt to personer. Den andre personen trenger da ikke kompetanse. Krever begge søylene A, må to forskjellige ansatte ha A. Det samme gjelder en kompetanse som går igjen i to kombinerte krav: én ansatt kan ikke bruke samme kompetanse to ganger samtidig.

Søyler uten kompetanse krever bare antall personer. Udokumenterte kompetanser tildeles ikke automatisk. Manglende riktig kompetanse gir udekte linjer med forkortelsen. En udekt linje uten forkortelse betyr at det mangler en person uten ekstra kompetansekrav. Dekningsoversikten viser både total bemanning og kompetansekrav; overskudd av ukvalifiserte ansatte gjør ikke et kompetansekrav dekket.

Kompetanser, avkrysninger og inntil to krav per søyle lagres i prosjektet og følger CSV-overføringen. Excel har også ark for **Kompetanse** og **Bemanningsbehov**. Eldre OnCall-avkrysninger bevares som OnCall-kompetanse ved åpning. De øvrige kompetansene opprettes og tildeles av planleggeren.

## Regler, snittberegning og tariff

Velg tariffmal eller egne regler. Fyll inn uketimetall ved full stilling. PRP beregner hver ansatts timemål ut fra stillingsprosenten. Ufullstendige uker fordeles på normdagene, som er mandag–fredag som standard. Importen fra Salsy henter prosent fra gyldig kontrakt, deretter lønnsoppsett. Manglende prosent gir et tydelig kontrollvarsel og foreløpig 100 %.

Velg antall hele logiske uker og startuke for snittberegning. En ansatt kan ha ulike timetall i ukene innenfor samme blokk, for eksempel 46 og 25 timer når valgt norm og avtale tillater dette. Når «Tillat regelbrudd» er avslått, overskrides ikke blokkens samlede timemål for å fylle bemanningsbehov. Kontroller også maksimal uke- og vaktlengde; snittberegning alene øker ikke grensene. Oppgi avtalegrunnlag. Slutten av en plan kan være en delvis blokk; PRP viser forventede og planlagte timer i denne delen separat.

**Preferanser** over planmatrisen åpner et eget vindu i Linux og nettappen. Her kan du slå hver myk prioritering av og på: rene tidlig-/kveldsuker, jevn fordeling av tidlig-/kveldsuker, fri midt i arbeidshelguken, fridag mellom tidlig og kveld i arbeidshelguken, samt fri etter arbeidshelg. Velg **Mandag**, **Tirsdag** eller **Mandag eller tirsdag** som ønsket fridag etter helgen. Hovedbryteren **Bruk myke planleggingspreferanser** slår alle disse ønskene av uten å slette enkeltvalgene. Trykk **Lagre preferanser**, og generer på nytt. Valgene lagres i prosjektfilen og følger CSV-overføringen; de endrer ikke vaktene før generering. Alle er aktive som standard, med mandag eller tirsdag som likeverdige valg. Det brukes ved alle helgeintervaller, også individuelle to-, tre- og fireukersintervaller. Tidlig er arbeidsvakt som starter før **12:00**, kveld er start fra **12:00**. OnCall er ikke en tidlig-/kveldsvakt.

PRP forsøker å holde vanlige kalenderuker mandag–søndag rene for én vakttype, fordele tidlig- og kveldsuker over perioden for hver ansatt og unngå gjentatte uker av samme type. Fordelingen tilpasses bemanningsbehov og kompetanse; bare kveldsbehov kan ikke gi tidliguker. Startplanen bruker også preferansen, slik at kort søketid fortsatt kan gi rotasjon.

I uker der den ansatte faktisk arbeider lørdag eller søndag, eller har OnCall som berører helgen, foretrekkes minst én helt fri dag **tirsdag–torsdag**. Tidlig og kveld kan blandes i denne uken, helst med en helt fri kalenderdag mellom vakttypene. Nattarbeid og OnCall inn i en fridag betyr at dagen ikke er helt fri. Midtukepreferansen vurderes bare når alle tre dagene ligger i planperioden. Hvilekravene gjelder i tillegg.

Under **Dekning og timer → Ukemønster** vises antall rene tidliguker, rene kveldsuker, blandede hverdagsuker og uker med arbeidshelg per ansatt. Kategoriene er gjensidig utelukkende; arbeidshelguker vises separat. Også delvise uker ved periodegrensene telles etter vaktene i planen.

Dette er preferanser. Dekning, kompetanser, låste vakter, valgte tidsgrenser, stillingstimer og søketid kan kreve andre løsninger. Blandede uker blir ikke et hardt regelbrudd og stopper ikke eksport. Eksisterende låste vakter endres ikke. Bryteren kan slås av. Den samme motoren og oversikten brukes i Linux og nettappen.

Første innebygde mal er **Flyoverenskomsten 2024–2026**, basert på vedlagt PDF: § 3.1.3 om minstebetaling for arbeidsøkter og Bilag 4 A om 37,5/36,5/35,5/33,6 timer, avhengig av arbeidstidsordning. Tre timer brukes som planleggingsminimum etter brukerens krav; tariffens regel gjelder minstebetaling og åpner for lokal avtale. Malen importerer ikke eksempelplanenes lokale unntak som generelle tariffrettigheter. Gjeldende tariffutgave og lokale avtaler må kontrolleres før bruk.

Kilder: [Flyoverenskomsten 2024–2026](https://www.fellesforbundet.no/globalassets/lonn-og-tariffsaker/tariffavtaler/overenskomster-2024-2026/flyoverenskomsten---nho-luftfart-2024-2026.pdf), [Arbeidstilsynets veiledning om gjennomsnittsberegning](https://www.arbeidstilsynet.no/arbeidstid-og-organisering/arbeidstid/gjennomsnittsberegning/).

## Dispensasjoner avtalt med tillitsvalgt

Under Regler velger du **Ny dispensasjon**. Oppgi navn, gyldige datoer, avtalegrunnlag/referanse, hvilke ansatte den gjelder for og bekreft mottatt dokumentasjon. Endre bare grensene avtalen faktisk omfatter; tomme felt beholder grunnreglene. Du kan endre daglig/ukentlig hvile, maksimal vaktlengde/uke og ordinære dags-/ukesgrenser. Grensene følger med prosjektet og CSV-filen. En dokumentert dispensasjon gjelder bare for valgte ansatte i det valgte tidsrommet. Registreringen er dokumentasjon av en inngått avtale; programmet gir ikke tillatelsen i seg selv.

For en avtalt grense på **12 timer** legger du inn **12** i «Maksimal vaktlengde (timer, tom = uendret)» i Linux-appen. I nettappens felt «Maks vakt/døgn (minutter)» skriver du **720**. Avgrens ansatte og periode. Grunnregelen beholdes på andre datoer og for andre ansatte.

## Tillat regelbrudd

Bryteren **Tillat regelbrudd (vaktlengde, hvile og timetall)** over planen er avslått som standard og lagres per prosjekt. Avslått: både generering og manuelle nye endringer følger tidsgrensene. Påslått: genereringen kan overskride maksimal vakt-/dagslengde, daglig/ukentlig hvile og uke-/stillingstimer for å dekke mer av behovet. Opprinnelige regler og dispensasjoner beholdes, og avvik beregnes mot dem. Automatiske kandidater kan da være inntil 12 timer, eller en høyere grense som allerede er uttrykkelig registrert i reglene/dispensasjonen.

Overlappende vakter/OnCall, manglende OnCall-godkjenning, minste oppmøte, valgt helgerotasjon og valg om splittvakt er fortsatt begrensninger. Manglende kompetansedekning vises som udekt. Antall regelbrudd vises tydelig over planen og etter generering; **Dekning og timer** viser hvem, dato og bruddet. Å slå av bryteren fjerner ikke eksisterende vakter eller deres varsler. Låste tidskonflikter må rettes eller bryteren må aktiveres før ny generering.

Før CSV, Excel eller PDF eksporteres, vises regelbruddene og brukeren må bekrefte eksporten. Avbrytes varselet, opprettes ingen eksportfil. Excel/PDF inneholder regelmerknadene. CSV beholder bryteren, reglene, dispensasjonene og vaktene slik at bruddene kan kontrolleres igjen. Salsy PC og PC-nett viser bruddene i importforhåndsvisningen og krever lederens bekreftelse; godkjenningen og bruddene lagres med importen. Bryteren er et planleggingsvalg og gir ingen godkjenning av en avtale. Bruk oppdaterte Salsy-klienter/server ved import av det nye valget.

## Generering og justering

Før generering er udekte linjer bare en visning av behov som ennå ikke er tildelt. Over matrisen står det tydelig at du må trykke **Generer plan**; etter beregningen vises antall tildelte vakter og ansatte.

Trykk **Generer plan**. Programmet lager først et regelkontrollert utgangspunkt og bruker deretter søkemotoren til å forbedre det. Et tomt eller svakere søkeresultat erstatter ikke et bedre gyldig utgangspunkt. Ved tidsavbrudd kan utgangspunktet returneres som en ufullstendig, tidsbegrenset løsning. Det er ingen garanti om optimal eller full dekning. Genereringen kjører uten å fryse Linux-vinduet. Det brukes en tidsbegrenset søkemotor; store planer kan ta mer tid til forberedelse enn selve søkegrensen. Motoren prioriterer dekning og unngår unødvendig ekstra bemanning. Tidsgrensene håndteres etter bryteren over planen. Lange planer får et utgangspunkt fordelt over alle kalenderuker og optimaliseres i mindre deler. Vakter utenfor aktuell del holdes fast under delberegningen; hvile, kalenderukegrenser og snittblokker kontrolleres fortsatt på tvers av delgrensene. Linux-vinduet viser fremdrift per del. Nettappen viser ventestatus og antall behandlede deler når svaret kommer. Oppdeling er ikke et bevis på global optimalitet. Forberedelse og regelkontroll kommer i tillegg til søketiden, så store planer kan bruke over ett minutt.

Resultatet vises i den store, rullbare planmatrisen med ansatte som rader og datoer som kolonner. Hver vakt er en egen liten knapp. Hold pekeren over for klokkeslett og vaktinformasjon. Vakttyper får én siffer-/bokstavkode i stigende tidsrekkefølge, for eksempel 1A, 1B. Like tidsrom og type gjenbruker koden. **Udekt 1, Udekt 2 …** viser vakter som ikke ble tildelt; delvis dekning merkes ufullstendig. En tidsbegrenset løsning kan være bedre ved ny generering; udekte linjer er ikke et matematisk bevis på at ingen bedre plan finnes.

Klikk en vakt for å åpne redigering. Velg en eksisterende vakttype fra listen for å bytte, eller velg **Egne klokkeslett** og skriv nye tider. Nye tider får egen vaktkode, og like tider gjenbruker koden. **Se alle vakter denne dagen** i nettleseren eller dagsvinduet i Linux gir oversikt og valg for å legge til, slette og låse. Klikk en tom celle for å legge inn en ny vakt. Kryss av **Lås og behold ved ny generering**. Generer på nytt for å tilpasse resten rundt den låste vakten. Hvis en låst vakt bryter tidsreglene mens bryteren er avslått, stoppes genereringen med forklaring. Med bryteren på beholdes tidsavvikene og vises som regelbrudd. Eksisterende prosjekt erstattes ikke av et mislykket søkeresultat. Timer, regelkonflikter, hver gjennomsnittsblokk og udekket bemanning finnes under **Dekning og timer**.

Arbeidstid regnes i lokale klokketimer i denne første versjonen. Arbeid før og etter planperioden, kompenserende hvile, særregler om natt-/søndagsarbeid og alle alternative lov-/tariffgrunnlag er ikke en komplett automatisk lovkontroll. Importerte tariffregler beholdes; motoren bruker relevante arbeidstids-/hvilegrenser. En ferdig plan må gjennomgås og godkjennes av ansvarlig leder og eventuelle tillitsvalgte, særlig ved sommer-/vintertidsendring og periodegrenser.

## OnCall

**Kryss først av OnCall på de aktuelle ansatte i kompetansematrisen.** Valget **Godkjent for OnCall** under Ansatte → Rediger oppdaterer samme kompetanse. Dette er et eksplisitt valg; ingen ansatte godkjennes automatisk. Både generering og manuell registrering følger valget. Eksisterende OnCall fra eldre filer slettes ikke; manglende godkjenning vises som regelkonflikt og stopper generering av låste vakter og import til Salsy til det er rettet. Fjern OnCall-vaktene før en godkjenning tas bort.

Velg **OnCall-farge** over planmatrisen. Dager med OnCall får den valgte fargen, også på arbeidsvakten samme dato. Teksten får automatisk lys eller mørk kontrast. Fargen følger prosjekt/CSV og vises i ukearkene i Excel og PDF.

Velg OnCall-behov eller legg inn en OnCall-vakt. Start etter en arbeidsvakt og slutt neste morgen er mulig. **25 %** er standard tidsvekting: 16 timer OnCall gir fire normtimer. **0 %** gir ingen normtimer, men registreringen beholdes og hvile følger valget under OnCall-regler. Standard for eldre planer er kontroll mot hele beredskapsintervallet. Tidsvekting er ikke automatisk et vedtak om hva som er lovbestemt arbeidstid eller hvile.

### OnCall etter kveldsvakt (fra 0.2.18)

Åpne **OnCall-regler → Rediger OnCall-regler** i Linux, eller **OnCall-regler** i nettappen. Fra 0.2.19 er kveldsvakt uten opphold før OnCall et **fast krav som ikke kan slås av**, også når en eldre fil har lagret det gamle valget som avslått. Velg **Nødvendig kompetanse**, for eksempel De-ice, og velg **Clean** under **Kan ikke ha denne oppgaven samme dag**. En ansatt må fortsatt ha OnCall avkrysset i kompetansematrisen, i tillegg til den knyttede kompetansen. Det er tildelt Clean-arbeid på arbeidsvaktens dato som sperres; ansatte med begge kvalifikasjoner kan ha OnCall når noen andre dekker Clean.

Legg inn OnCall-søyler under **Behov**, med start nøyaktig når kveldsvakten slutter og slutt neste morgen. PRP velger samme person til kveldsvakten og OnCall. **Kveldsvakt starter tidligst** foreslår 12:00 og kan endres. Ved manglende kvalifisert kveldsvakt står beredskapen som udekket. Avkryssingen **Tillat regelbrudd** opphever ikke kompetansekravet, Clean-sperren eller kravet om tilknyttet kveldsvakt. Låst OnCall beholder også den eksisterende kveldsvakten den er knyttet til; brukerens låseavkryssing på kveldsvakten beholdes.

Arbeidsvaktens kode får **O** til slutt, for eksempel **9AO**. Den ordinære vakten og OnCall forblir separate tidsregistreringer, med hver sin klokketid og vekting. Koden og OnCall-fargen vises i Linux, nettappen, PDF og Excel, også hvis beredskapen starter etter midnatt. Prosjekt/CSV og import til Salsy beholder hele oppsettet. Eksisterende import skal ikke opprettes på nytt bare på grunn av kodevisning eller nye standardfelt.

Slå på **Passiv OnCall holdes utenfor hvilekontroll** for dette oppsettet. Valget gjelder bare selve beredskapsregistreringen. Aktivt arbeid/utrykning må registreres separat i Salsy og regnes som arbeid; hvile mellom ordinære arbeidsøkter kontrolleres fortsatt. OnCalls valgte prosent inngår fortsatt i normtimene, også når passiv beredskap holdes utenfor hvilekontrollen. Eldre planer beholder tidligere hvileregler til valget endres. Valget er en planleggingsinnstilling og fastslår ikke at en vaktordning er lovlig; bruk gjeldende tariff/lokal avtale. Se [Arbeidstilsynets veiledning om beredskapsvakt](https://www.arbeidstilsynet.no/arbeidstid-og-organisering/arbeidstid/beredskapsvakt-utenfor-arbeidsstedet/).

English: **OnCall rules** in desktop and web can link passive standby to a required qualification and an immediately preceding evening shift. Staff must opt into OnCall and hold the linked qualification. The excluded duty (e.g. Clean) applies to assigned work on the evening shift's date, not possession of that qualification. Standby remains uncovered if no eligible evening duty exists. From 0.2.19, an immediately preceding evening shift is mandatory and legacy false flags cannot disable it. Attached work codes gain **O**, e.g. **9AO**; work and standby retain separate times and accounting. Locked standby preserves its existing supporting evening duty. Optional rest exclusion covers passive standby only: call-outs are recorded separately as active work, and work-to-work rest checks remain. Weighted standby hours still count toward the contracted norm. Legacy projects keep their previous rest settings. Project/CSV, Salsy import, PDF and Excel preserve these rules and labels.

I Salsy skilles OnCalls betalingsprosent fra PRPs tidsvekting. Nye betalingsfelt foreslår 25 %, eksisterende lagrede satser endres ikke. Importerte OnCall-registreringer får betalingsprosent 25 og planens separate tidsvekting; kontroller betalingsprosent i Salsy før lønn.

## Salsy-tilkobling og nettapp

I Salsy gir leder brukeren rettigheten **Salsy PRP – hente ansatte og planleggingsregler** under Brukere og tilganger. Den er ikke standard for ansatte. I PRP velger du **Hent fra Salsy**, HTTPS-adresse, brukernavn og passord. Klientkode brukes ikke. PRP får en særskilt avgrenset økt som ikke kan brukes til vanlige personal-, lønns- eller administrasjons-API-er. Passord lagres ikke; Linux-appen avslutter økten etter hentingen. Vanlig sertifikatkontroll beholdes.

Bare fornavn, stillingsprosent og tekniske identifikatorer på ansatte hentes, sammen med tariff- og dispensasjonsregler. Eldre fulle navn bevares i Salsy; fornavn må kontrolleres ved import til PRP. Nye ansatte i Salsy har fornavn, valgfritt mellomnavn og etternavn.

For nettappen aktiverer leder **Salsy PRP-nettapp** i Innstillinger. Åpne `https://serveradresse:port/app/prp/`. PRP-tilgang kreves i tillegg til modulbryteren. Deaktivering fjerner menyvalget og stenger PRPs nett-API-er, men frittstående PRP og eksport av grunnlag fortsetter å virke. Nettprosjekter lagres ved nedlasting av prosjekt/CSV; de lagres ikke automatisk på Salsy-serveren. Lagre før du lukker siden.

## CSV, Excel og PDF

**Lagre** skriver en lokal `.prp`-prosjektfil (JSON) med alt innhold. **CSV → Salsy** skriver en standard UTF-8 CSV med BOM, versjon og posttyper. Hver post har et JSON-datafelt som bevarer nøstede tariffregler, dispensasjoner, ID-er og låsing uten tap. Dette er et overføringsformat, ikke et vanlig lønnsark. Rediger planer i appen. CSV skal ikke håndredigeres som en enkel vakttabell.

**Excel** har ansattoversikt, alle vakter, ukeark, dekningsmangler og regler. **PDF** har planmatrise, felles vaktkodeoversikt, forklaring og regelgrunnlag. Udekte linjer beholdes i Excel og vises ikke i PDF. CSV/prosjektfiler kan åpnes igjen i PRP.

I Salsy PC og PC-nett kan leder velge **Importer PRP-plan** under Skiftplan eller Ansettelse. Velg CSV/prosjektfil, koble hver PRP-ansatt til riktig aktiv ansatt i Salsy og kontroller forhåndsvisningen. Importen oppretter skiftplaner og OnCall samt dokumenterte dispensasjoner samlet. Udekte linjer vises i forhåndsvisningen og blir ikke feilaktig tildelt ansatte. Overlapp med eksisterende arbeid/dispensasjoner stopper hele importen. Import av samme fil med samme kobling gjentas ikke. Nattevakter uten ubetalt pause deles ved midnatt til Salsys datoformat. Nattevakter med ubetalt pause stoppes før import, slik at pausen ikke trekkes to ganger. Import med pause forutsetter 30 minutter og grense 5,5 timer. Flytt/avklar eksisterende planer før en revidert PRP-plan importeres; det gjøres ingen skjult overskriving av tidligere kalenderdata.

Salsys import krever normal lederinnlogging med tilgang til skiftplan, og kan ikke utføres med en begrenset PRP-økt. Salsys kryptering og historikk brukes når importen lagres. Lokale PRP-/CSV-/Excel-/PDF-filer er ukrypterte og må oppbevares som bedriftens øvrige planleggingsfiler.


### Etterfylling av ledig kapasitet i PRP

Etter hovedsøket kontrollerer PRP om flere registrerte behov kan dekkes ved å legge til vakter eller forlenge ulåste vakter. Resttimer mot stillingens normtid kan brukes i hele kvarter. En forlengelse krever ikke en ny minimumsvakt; en ny arbeidsvakt må fortsatt oppfylle minste oppmøtetid. Kompetanse, overlapp, normperioder, pauser, helgerotasjon, hvile og valgte grenser kontrolleres. Låste vakter endres ikke. Timer legges ikke til bare for å fylle norm uten å forbedre dekningen av et registrert behov.

En gyldig eksisterende plan inngår også som utgangspunkt ved ny generering, slik at et kort søk ikke kaster bort en bedre kontrollert plan. Resultatlinjen viser «etterfylt … timer» i Linux og PRP-nettappen. Tallet er vektet normtid, inkludert OnCall-prosent; det kan være forskjellig fra forbedringen i udekkede persontimer.

Etterfyllingen er tidsbegrenset. Ledig normtid er ikke automatisk disponibel arbeidstid: minste vakt, hvile, ukesgrenser, OnCall og arbeidshelger kan hindre flere vakter. Gjennomsnittsperioden bestemmer om timer kan flyttes mellom uker. Ubrukte normtimer flyttes ikke automatisk til en annen periode. En delvis plan markeres fortsatt tydelig, og det gis ingen garanti for globalt optimal fordeling. Ved ny generering brukes den gyldige planen videre. Bruk samme funksjon i Linux og nettappen.


### Stillingsprosent på udekkede linjer

Hver virtuell linje merkes for eksempel **Udekt 1 (50 %)**. Prosenten gjelder alle de viste vaktene på linjen gjennom hele planperioden, beregnet mot normtiden ved 100 % stilling med valgte uketimer og normdager. Det er samme beregning i Linux, nettappen, Excel og PDF. OnCall bruker den valgte prosentvekten, og ubetalt pause trekkes etter planens regler. Kompetanseforkortelser vises etter prosenttallet.

Korte restbehov vises med faktisk sluttid; de forlenges ikke kunstig ut over behovet for å oppfylle minste vaktlengde. Minimumsregelen gjelder fortsatt ved tildeling av nye arbeidsvakter. Hvis perioden ikke inneholder noen av de valgte normdagene, vises «– %» i stedet for en misvisende prosent. Prosenten er et planleggingsestimat for den virtuelle linjen; kompetansekrav og hvile kan kreve en annen faktisk bemanning.

Etter arbeidshelg forsøker rotasjonspreferansen å gi helt fri mandag eller tirsdag. OnCall og nattevakt som går inn i dagen gjør at dagen ikke regnes som helt fri. Dette er et ønske, ikke et absolutt forbud: dekning, låste vakter og valgte regler kan kreve arbeid begge dager. Preferansen gjelder i både Linux-appen og nettappen og styres fra det egne Preferanser-vinduet.

## Fri etter arbeidshelg og samlet manglende årsverk

Når **Preferanser → Prioriter fridag etter arbeidshelg** er satt til **Mandag** eller **Tirsdag**, veier den valgte dagen nå tydelig tyngre enn andre myke rotasjonsønsker og søyleform. Dekning, kompetanse, låser og arbeidstidsregler beholdes. Sluttberegningen forsøker i tillegg kontrollerte bytter av hele arbeidsdager mellom ansatte. Slike bytter bevarer hver ansatts normtimer i hver snittperiode og kan ikke svekke kvalifisert dekning på noe tidspunkt. Ønsket er fortsatt en preferanse, slik at krevende bemanning eller låste vakter kan hindre fridagen.

Øverst til høyre over planmatrisen står **Mangler årsverk: 3,84**, for eksempel. Tallet summerer de udekkede linjene én gang og deler deres vektede normtid på normtiden for én full stilling gjennom planperioden. Det er altså manglende heltidsstillinger for perioden, ikke et fast årlig timetall. OnCall og pauser bruker samme beregning som de udekkede linjene. Det er forskjellig fra ansattes ubrukte normtid. Tallet oppdateres ved generering og redigering av behov, vakter, regler og periode; mens behov beregnes vises beregner. Ingen normdager i perioden gir en strek fremfor et misvisende tall. Beregningen deles av Linux og nettappen.

English: PDF shift-code keys list base work codes only, e.g. 9A. The grid retains 9AO, and the legend explains the O suffix. Standby time records remain separate.
