# Tariffberegninger – status 01.11.2026

## Omfang og avgrensning

Målet er komplette beregningsgrunnlag per avtale, inkludert vedlegg,
endringsprotokoller og bedriftens nødvendige lokale valg. Et yrkesnavn,
en kildelenke, ukentlig norm og noen overtidsprosenter er ikke tilstrekkelig.
Regnearket med 100 yrker inneholder ikke selve beregningsreglene.

Omfanget er avklart til **alle økonomiske bestemmelser**, også pensjon/AFP,
forsikringer, etterlønn ved dødsfall, forskuttering og NAV-refusjoner. Alle
hviletidsbestemmelser inngår: daglig/ukentlig hvile, pauser, fridager, lokale
unntak og kompenserende hvile. Ingen av disse områdene kan utelates for å
merke en avtale som komplett. Forutsetninger som krever lokale opplysninger,
forsikringsselskapets premie eller faktiske NAV-vedtak skal angis uttrykkelig;
programmet skal ikke gjette dem.

Arbeidet er **ikke ferdig**. Ingen av de innebygde avtalene er foreløpig merket
som et komplett beregningsgrunnlag. De elleve eksisterende malene beholdes som
uttrykkelig delvise utgangspunkt for å bevare tidligere bruk. Fem nye
kandidater – de tre fra Virke (Kontor/HK, Funksjonær/Parat og Grossist/Parat) og de to
separate luftfartsavtalene for 2026 (Fellesforbundet og HK) holdes
utenfor malvelgeren i både Salsy og PRP. De har fortsatt uavklarte beregninger.
Det skal ikke publiseres en utgivelse som hevder at disse er ferdige avtaler.

**Tariffavtale → Beregningsgrunnlag** i PC og PC-nett viser sentrale områder
som gjenstår per avtale. Listen er en oversikt over ufullstendig støtte, ikke
et samsvarssertifikat eller et løfte om at resten av avtalen er implementert.
PRPs malbeskrivelser har samme avgrensning, både lokalt og på nett.

Luftfartsavtalene prioriteres nå avtale for avtale, med separate kilder,
kontrollsummer, virkningsdatoer og konkrete klausuloversikter. **Tariffdekning og
kilder** i PRP viser samme grunnlag som PC og PC-nett. Nye beregningsvilkår for
matpenger, ytterligere forpleining, ekstraordinær tilkalling og alternative
betalingsgarantier testes separat. Se [luftfartsgjennomgangen](AIRLINE_TARIFF_REVIEW.md).
Nyeste utvidelser er HKs veide skifttimer med fryst månedsoppgjør og egne
etterlønnsregler med kontroll av ansettelsestid, mottakere og samordning.
Fly har i tillegg datostyrte komponentgrunnlag for PL, PLT og akkordavsavn,
med egne prosentgrunnlag for skift og faste tillegg. Årlige fridagsdatoer
kontrolleres nå i både Salsy og PRP, også med uttrykkelige toårsvinduer.
En [konkret testveiledning](TARIFF_TESTING_TODAY.md) viser hva som kan prøves
og hvilke begrensninger som fortsatt gjelder.
Dette har ikke gjort noen hel avtale komplett. Den siste bestillingen er
begge konkrete luftfartsavtalene for 2026 før publisering av 0.83.2; dette kravet er
ikke oppfylt. Tidligere forslag om 50 avtaler i 0.83.1 er erstattet av dette.

## Implementerte utvidelser i felles motor

Overtidstillegg kan nå ha ett av følgende grunnlag:

- Personlig timelønn, som tidligere.
- Fast timegrunnlag fra avtalen.
- Full månedslønn delt på en oppgitt divisor.
- Full årslønn (full månedslønn × 12) delt på en oppgitt divisor.
- Full månedslønn delt på uketimer × 4⅓, med eksakt brøk fremfor en avrundet divisor.
- Flys dokumenterte PL eller PLT, fra separate datostyrte lønnskomponenter.

Divisorer bruker full månedslønn fra den datostyrte lønnstabellen, før
stillingsprosent. Mangler månedslønnen, avvises beregningen med en tydelig
melding. Salsy gjetter ikke årslønn ut fra timelønn. Fast månedslønn og vanlig
lønnstabellomregning endres ikke automatisk.

Som standard endrer et eget grunnlag bare **tillegget**. Valget **Bruk
tariffgrunnlaget også for grunnlønn på overtid** må velges uttrykkelig dersom
avtalen krever dette. Forskyvningstillegg bruker fortsatt personlig timelønn
med mindre **Bruk overtidsgrunnlaget for forskyvningstillegg** velges.

Regningen bruker eksakte brøker og avrunder til øre per lønnslinje. Ved
konkurrerende overtidsprosenttillegg sammenlignes faktisk beløp fra hvert
sitt grunnlag. Høyeste prosent er ikke nødvendigvis høyeste betaling.
Overtidstillegget utbetales fortsatt for overtid som går til timebank.
Avtalegrunnlaget fryses på registreringen; senere avtaleendringer erstatter
ikke den lagrede versjonen. Eksisterende avtaler beholder tidligere standard.

Tidsvinduer kan avgrenses til helligdager, dagen før søndag/helligdag og tiden
etter siste oppsatte vakt. Dette er uttrykkelige filtre, ikke en automatisk
regel om at alle tariffavtaler har samme helligdagsbetaling. Eldre klienter
kan ikke slette slike filtre ved et uhell; de må oppdateres før tidsreglene
redigeres. Felter for nytt beregningsgrunnlag og lokale valg bevares når en
eldre klient utelater dem.

Minstebetaling ved nytt fremmøte og oppavrunding av overtidsbetaling støttes
som uttrykkelige, datostyrte valg. De påvirker betaling, ikke faktisk arbeid,
timebank eller lovovertidskvoter. Sammenhengende ekstraregistreringer, også
over midnatt, deler én avrunding. Leder avklarer nødvendige fakta via
**Hendelser → Avklar tariffbetaling** i PC og PC-nett. Matpenger kan kreve
avklaring av varsel samme dag, mat skaffet av bedriften og allerede betalt
spisetid. Fast matgodtgjørelse blir ikke automatisk skattefri. En egen test
kontrollerer at overtidstillegget ikke får halvert skattetrekk sammen med
ordinær lønn.

## Hvilekontroll som er utvidet

En dispensasjon som reduserer daglig hvile, fjerner ikke lenger kontrollen av
kompenserende hvile. Den opprinnelige hvilegrensen beholdes ved kontrollen av
neste hovedarbeidsperiode. Ved 11 timers norm og 8 timers hvile kreves 14
timer i neste hvileperiode. Gjentatte reduksjoner akkumuleres; senere retting
sletter ikke et tidligere brudd. Salsy viser avviket i arbeidstidsvarsler,
PRP bruker samme kontroll i validering og generering. Eksplisitt «Tillat
regelbrudd» viser fortsatt avvikene. Pauser midt i en arbeidsdag regnes ikke
som kompenserende døgnhvile. Begge sesongskiftene i klokken inngår i
PRPs døgn- og ukeshvile med faktisk forløpt tid, slik serveren allerede gjør.

Avtalt ukentlig kompenserende hvile kan nå registreres som et **hvilevindu**
på en dispensasjon: fra–til dato, samlet sammenhengende hvile og en egen
referanse. Oppgi hele hvilen som skal gis, eksempelvis ordinær hvile pluss
avtalt kompensasjon, ikke bare den tapte delen. Salsy kontrollerer vakter og
ekstraarbeid innen vinduet og viser manglende hvile i Hendelser. PRP bruker
samme tidsgrunnlag i validering og generering og krever at hele vinduet ligger
i planen. Overlappende vinduer for samme ansatte avvises, slik at samme hvile
ikke ukritisk brukes for to særskilte forpliktelser. Vinduet og referansen
følger CSV og import til Salsy. Eldre tomme felt endrer ikke gamle import-ID-er.

Dette er **ikke** full støtte for alle hvilebestemmelser. Automatisk fastsetting
av tariffens kompensasjon og frister, annet passende vern, alle tariffspesifikke
fridags- og pauseordninger og arbeid utenfor PRPs planperiode må fortsatt
modelleres og kontrolleres. [Arbeidstilsynets veiledning om arbeidstid](https://www.arbeidstilsynet.no/arbeidstid-og-organisering/arbeidstid/)
og [arbeidsmiljøloven § 10-8](https://www.arbeidstilsynet.no/regelverk/lover/arbeidsmiljoloven--aml/)
er kontrollkilder; tariffens egne regler må vurderes i tillegg.

## Kontraktsbestemt månedsavregning

Fast månedslønn beholder kalenderdager som standard. To uttrykkelige alternativer
er lagt til: **Kalenderdager uten søndager**, og **Timebasert delmåned og kort
fraværstrekk**. Dette er forskjellige formler; de må ikke brukes om hverandre.
Funksjonæravtalen Virke–Parat § 16.1 bruker dager uten søndager. Kontoroverenskomsten
Virke–HK § 14.3 bruker en egen timeformel for del av måned og langt ulønnet fravær,
men en annen omregning ved korte ulønnede fravær. Protokoller og lokale valg må
fortsatt kontrolleres før en komplett mal kan tilbys.

Ved timebasert månedsavregning angis divisor for del av måned, uketimer for
kort fraværstrekk, grensen for kort fravær i kalenderdager og avrunding av
trekk. Eksempelet fra Kontoroverenskomsten har divisor **37,5 × 4,33 = 162,375**
for del av måned, men **37,5 × 4⅓ = 162,5** for korte fraværstrekk.
Sammenhengende ulønnede perioder vurderes også over månedsskiftet. Timegrunnlaget
kommer fra betalte oppsatte vakter; ekstraarbeid betales separat. Faktiske
deltidsvakter reduseres ikke med stillingsprosent en gang til. Godkjent betalt
fravær beholder vakttimene; ventende fravær trekker ikke lønn.

Eksport, estimat og lønnsslipp bruker den samme månedsberegningen. Brøker er
eksakte og beløpet avrundes til øre per lønnslinje. En delperiode kan ha en
negativ fraværsjustering selv om hele måneden er positiv; en samlet negativ
måned stoppes for avklaring. Ugyldige divisorer kan ikke tvangsaktiveres. De
ufullstendige malene er ikke blitt oppgradert til komplette gjennom disse valgene.

## Valgfrie bedriftsordninger, pauser og fridager

Salsy kan fortsatt brukes **uten tariffavtale**. Pensjon, AFP-premie, forsikring,
etterlønn og NAV-avstemming ligger nå i et eget opplegg for datostyrte
bedriftsordninger. Leder kan registrere leverandørvilkår, satser, grenser,
kontrollert premiegrunnlag, samordning og vedtaksopplysninger selv. Det krever
ikke en tariffmal. Godkjente pensjons-/forsikringsoppgjør kan inngå i
lønnsslippens trekk og naturalytelser. Arbeidsgiverkostnad, mottakerbestemt
etterlønn og NAV-refusjon holdes atskilt fra vanlig kontantlønn.

AFP-premie bruker et kontrollert kumulativt årsgrunnlag med avstemming av
tidligere premie. Etterlønn viser forholdsmessig trekkfri og trekkpliktig del
for dokumenterte mottakere; den avdødes lønnsslipp brukes ikke for dette.
NAV-avstemming følger faktisk forskudd, kontrollert krav og registrerte
refusjoner. Disse beregningene avgjør ikke NAVs vedtak eller leverandørens
pensjons-/forsikringsdekning. Kontrollerte bedriftsopplysninger brukes der
vilkårene ikke kan bestemmes fra avtalen alene.

Registrerte betalte overtidspauser kan gi overtidsbetaling uten at de samme
minuttene belaster lovovertidskvoten, når dokumenterte vilkår for dette er
oppfylt. Pausen inngår allerede i arbeidsintervallet; betaling legges ikke til
to ganger. Ubetalt pause må stemme med lagret matpausetrekk. Egne fridagsregler
for kalenderuker og sammenhengende valgte ukedager brukes i Salsy-varsler og
PRPs generering/kontroll. Ingen av disse funksjonene aktiveres ved å være
installert alene.

Se [bedriftsordninger og hvile](BENEFITS_AND_REST.md) for arbeidsflyt, formler,
kilder og avgrensninger. Full klausulkontroll av de enkelte avtalene, automatisk
rettighetsvurdering og plassering/kontroll av alle tariffbestemte pauser er
fortsatt ikke ferdig. De delvise malene er ikke merket komplette.

## Lokale valg og tvangsaktivering

I PC og PC-nett ligger **Nødvendige lokale valg** i avtaleredigeringen.
Hvert krav viser hvilket beregningsfelt som må avklares, referansen og om
verdien er avklart for bedriften. Verdien legges inn i det vanlige
beregningsfeltet i samme skjema. Nye malutkast krever avklaring av
beregningsmåte, ukentlig norm, overtidsprosent og overtidsgrunnlag.
Leder kan legge til flere nødvendige felt i sine manuelle oppsett.

Uavklarte valg sperrer vanlig aktivering. Bedrifter uten lokale særavtaler kan
likevel krysse av **Aktiv avtale** og **Tvangsaktiver uten ferdige lokale
valg**, og skrive **Begrunnelse for tvangsaktivering**. Valget og begrunnelsen
lagres sammen med avtaleversjonen og følger senere timeregistreringer og
PRP-overføring. Avtalelisten merker denne som **Aktiv · tvangsaktivert**.
Tvangsaktivering betyr ikke at en delvis tariffmal er komplett. Den tillater
heller ikke ugyldige beregningsverdier eller å hoppe over tilgangskontrollen.

## Gjenstående arbeid før nye avtaler regnes som komplette

Hver avtale må gjennomgås for alle relevante arbeidstidsordninger og
arbeidstakergrupper. Blant punktene som fortsatt krever modellering eller
kontroll er lønnssatser og endringsdatoer, lærlinger, UB/skift, samordning og
tak på tillegg, minstebetaling og avrunding, tilkalling, beredskap/utrykning,
varslingsfrister, betalte pauser, matpenger, godtgjørelser, fravær og ferieoppgjør.
Det må lages tester av de konkrete bestemmelsene før avtalen tilbys som komplett.

At motoren støtter en fast sats eller divisor innebærer ikke at hele avtalen
som bruker satsen er lagt inn. Eksempler som er brukt til å kontrollere behovet
for utvidelsen:

- [Fellesoverenskomsten for byggfag 2026–2028](https://www.fellesforbundet.no/globalassets/lonn-og-tariffsaker/fellesoverenskomsten-for-byggfag-2026-2028.pdf), §§ 2-3 og 6-3: eget grunnlag for overtidstillegg.
- [Hovedtariffavtalene i staten 2026–2028](https://www.regjeringen.no/no/dokumenter/hovedtariffavtalene-i-staten-2026-2028/id3168033/?ch=3), § 2: egen omregning av overtid fra årslønn.

## English

This is work in progress. No bundled agreement is currently labelled as a
complete calculation package. The eleven existing templates remain explicitly
partial, while three incomplete Virke candidates and two separate 2026 aviation packages are withheld from the
Salsy and PRP selectors. The calculation-basis page lists outstanding areas.

The shared payroll engine supports personal hourly pay, a fixed contractual
hourly basis, full monthly salary divided by a divisor, and full annual salary
divided by a divisor. Company choices normally block activation until confirmed.
Managers may force activation with an explanation when no local agreements
apply. This is recorded on the agreement version; it does not bypass numerical
validation or make a partial agreement complete. Existing saved versions are
not changed automatically. PC and desktop web use the same API and engine;
standalone and web PRP share the same catalogue and preserve imported rules.

The agreed scope includes every financial provision, including pensions,
insurance, survivor pay and NAV reimbursements, plus all rest and break rules.
Daily compensatory-rest checking and documented dated rest windows are shared
by Salsy and PRP. Windows can cover agreed weekly compensation but do not
automatically determine an agreement's entitlement or deadline. Contractual
monthly salary can use calendar days, days excluding Sundays, or explicit
hours-based partial-month and short unpaid-absence rules. All payroll outputs
use the same engine; none of these extensions makes a partial agreement complete.

## Luftfartsarbeid 01.11.2026

Fly-gruppekontroll for minstesatser/lærlinger/ungarbeidere/sertifikater/NDT II,
distinkte lærlinggrunnlag for overtid/skift og valgfri minstebetaling ved
ordinært skiftfremmøte er utvidet. Forskuttering har separate Fly-/HK-kildevalg,
seksmånedersvilkår, dokumentert årsforbruk og varslingskontroll. Se
[AIRLINE_TARIFF_REVIEW.md](AIRLINE_TARIFF_REVIEW.md) for arbeidsflyt og konkrete
avgrensninger. Dette fullfører ikke hele avtalene.

## Nytt: ordinær Fly PLT og bekreftet betalt hvile

Kontrollert Fly PLT kan nå velges uttrykkelig som datostyrt ordinær månedslønn
eller timelønn. Nye kontroller dekker faste funksjoner, CRS, kategori A, lokal
kompetansemodell og dokumentert ground-handling-praksis. Separate Fly-/HK-vilkår
for faktisk betalt fri etter ekstraarbeid bevarer lønn og reduserer faktisk
arbeidstid uten timebank. Se [oppsett og begrensninger](AIRLINE_ORDINARY_PAY_AND_REST.md).
Begge hele avtaler er fortsatt uferdige; disse delene er ingen full tariffdekning.

## Datostyrt HK-lønn og flere Fly-grupper

PC og PC-nett har nå **Lønnsgrunnlag · HK–NHO Luftfart** med eget kontrollert
minstereferansegrunnlag, selskapsansiennitet, lærling-/skoleløp, fagbrev,
loading supervision og høyere funksjon. Ordinær lønn kan velges uttrykkelig
fra HK-kilden. Eksakt divisor og HK 306 brukes i felles lønnsmotor; faktisk
ulønnet fravær og deltid skaleres ikke dobbelt. Manuell selskapsansiennitet
krever dokumentert månedstall og dato for månedsopptjening.

Fly har egne lokale grupper for lager/ekspeditør, sjåfør, vakt og rengjøring/
kantine, samt dokumentert bevart NDT I fra 2024. NDT II-taket overføres ikke
til den eldre ordningen. De to nye kontrollkildene har separate kontrollsummer.
PRPs dekningsoversikt viser de samme gjenstående områdene. Standalone PRP
krever fortsatt ikke innlogging eller en tariffavtale.

Se [arbeidsflyt og regneeksempler](AIRLINE_ORDINARY_PAY_AND_REST.md).
Dette fullfører ikke alle sentrale bestemmelser i noen av de to avtalene.
Midlertidige Fly-funksjoner, lønnsvern, samlede hvile-/fridagskjeder,
høytidssamordning, permisjonskvoter, reise, alle premie-/medlemsvilkår og
historiske oppgjør krever fortsatt arbeid. Publiseringskravet for 0.83.2 er
fortsatt ikke oppfylt; ingen hel avtale er merket fullført.

Midlertidige funksjoner, HK-deldagsfunksjon, Fly-lønnsvern og dokumentert
sertifikatbevaring er nå utvidet med egne kilde- og arbeidskontroller.
Se [arbeidsflyten](AIRLINE_ORDINARY_PAY_AND_REST.md). Ingen hel avtale er
merket komplett; øvrige sentrale økonomi- og hvilebestemmelser gjenstår.

## Kalenderregler for Fly og HK – lokal utviklingsversjon 01.11.2026

I både PC og PC-nett: **Administrer tillegg → Ny tariffkalender**. Velg én
konkret regel, kontroller sats, beregningsgrunnlag, ansatte og datoer, og oppgi
kilde og lokal praktisering. Bruk automatisk prosenttillegg, 00:00–24:00 og
alle ukedager. Kalenderen avgrenser selv de berørte minuttene. Det er fortsatt
leder som velger hvem regelen gjelder for; kalenderen gir ingen dispensasjon.

Fly § 3.4.4 har egne, gjensidig utelukkende vinduer for 24, 37, 40, 75 og
100 prosent. Jul, nyttår, påske og pinse får eget sammenhengende 100-vindu;
75-vinduet håndterer øvrige sammenhengende søn-/helligdager. Kontroller den
faktiske innføringsdatoen for nattøkningen til 37 prosent (senest 01.09.2026).
Disse reglene erstatter ikke fast gjennomsnittlig skifttillegg eller § 3.3.8
om skifttillegg ved tilknyttet overtid. De to områdene er ikke fullført.

Fly § 3.3.3s kalenderdel gir 100-prosentvinduer. Fly § 3.3.4s standardvalg
**natt til navngitt hellig-/høytidsdag** gir 150 prosent klokken 21–07;
vanlige søndager er ikke med i dette valget. Et separat valg som også tar med
søndag må bygge på dokumentert lokal praktisering. Satsen og om ekstraarbeid
skal klassifiseres som overtid er separate valg. Fridagsvilkår, tidlig
oppstart, nattskift og forberedende arbeid må også kontrolleres.
Kalendervalget finnes i **Tariffavtale → Avtaler → Tidsregler** og i egne
forskyvningsregler. Eksisterende, frosne overtids-/forskyvningsregistreringer
omskrives ikke når leder endrer avtalen.

HK 421.1 bruker sin egen kalender: hele navngitte helligdager og fra klokken
14 på jul-, nyttårs-, påske- og pinseaften. Flys sluttgrense klokken 22 på
siste helligdag gjelder ikke HK-regelen. Fly § 3.4.5s ekstra 100 prosent og
HK 421.2s ekstra 70 prosent har egne regler for helligdager som ikke faller
på søndag. Velg dem bare for ansatte med den avklarte skiftordningen og
nødvendige lokale avtalen. Avspaseringsalternativer er ikke automatisert her.

Fjern gamle overlappende tillegg før nye aktiveres. To regler med samme
kalender for overlappende ansatte og datoer avvises; programmet kan ikke
avgjøre om et gammelt manuelt tillegg har samme formål. Samme kalenders
adskilte dato-/ansattgrupper er tillatt. Vanlige klokkeslettregler og drift
uten tariff er fortsatt tilgjengelig.

Hvis en ubetalt pause påvirker kalenderberegningen, registrer tidspunktet i
**Tariffavtale → Registrerte pauser**. Summen må stemme med vaktenes lagrede
ubetalte pausetrekk for dagen. Programmet stopper beregningen fremfor å
anta om pausen var før eller etter satsendringen. En dag som ikke treffer
kalenderregelen trenger ingen slik avklaring. Kalenderberegningen endrer ikke
arbeidstid eller timebank. Årets navngitte helligdager bruker samme norske
kalender som Salsy og PRP.

Disse delreglene gjør **ikke** noen av de to hele avtalene fullstendige.
Begge 2026-pakkene er fortsatt tilbakeholdt fra ferdigmalvelgeren og 0.83.2.
Ansattes nye reiseregningsflyt begynner etter at begge avtalene er fullført.

### English: separate Fly and HK calendars

Both PC clients offer **Manage allowances → New agreement calendar**. Select
one rule, confirm its percentage, monetary basis, eligible employees and dates,
and document the source and local arrangement. Use an automatic percentage
allowance with 00:00–24:00 and every weekday. Fly ordinary shift bands are
mutually exclusive. The standard Fly150 night rule includes named public
holidays only; ordinary Sundays require a separate documented local choice.
HK421.1 has its own full-holiday/eve-from14 calendar, without Fly's22 ending.
Extra Fly100 and HK70 holiday compensation remain separate eligible-group rules.
These calendar bands are also available for overtime and displacement policies.

Locate unpaid pauses when they affect the calendar calculation. Missing pause
locations block calculation rather than silently choosing a percentage. Exact
duplicate overlapping calendar rules are rejected; older manual allowances must
be reviewed for double payment. Ordinary rules and no-tariff operation remain.
Neither complete2026 aviation agreement is finished or published as0.83.2.

Gjenimport av uendret PRP-plan kjenner igjen både eldre filer uten kalenderfelt
og filer med eksplisitte tomme kalenderstandarder. Et faktisk nytt kalendervalg
beholder egen importidentitet; det fjernes ikke av kompatibilitetskontrollen.

English: Unchanged PRP imports recognize absent and explicit empty calendar
defaults. A real calendar-rule change retains a distinct import identity.
