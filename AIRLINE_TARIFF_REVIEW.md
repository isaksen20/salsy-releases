# Luftfartsavtalene – separate oppsett og kildekontroller

Status 01.11.2026: **Ingen av disse avtalene er ferdige beregningspakker.**
De nye 2026-utgavene vises i dekningsoversikten, men holdes utenfor malvelgeren.
Den tidligere, delvise Flyoverenskomsten-malen beholdes som før. Lagrede
avtaler eller lønnsslipper endres ikke ved å åpne oversikten.

## Avtale for avtale

Prioritert rekkefølge er Flyoverenskomsten (NHO Luftfart–Fellesforbundet),
deretter Luftfartsoverenskomsten (NHO Luftfart–HK Norge). Andre avtaler skal
ha samme atskillelse: egen identitet, partsangivelse, kildeutgave, protokoll,
virkningsdatoer, lokale valg og tester. Arbeidstidsvarianter og nye utgaver av
samme avtale skal ikke telles som flere ferdige avtaler.

PC og PC-nett: **Tariffavtale → Beregningsgrunnlag → Vis beregningsgrunnlag**.
Frittstående PRP og PRP-nett: **Regler og tariff → Tariffdekning og kilder**.
Oversikten viser kildeverdier, konkrete bestemmelser, delvis støtte og arbeid
som gjenstår. Kildenotater er på norsk, som avtalene. PC-grensesnittets
veiledning og kontroller finnes også på engelsk.

## Flyoverenskomsten

[Grunntekst 2024–2026](https://www.fellesforbundet.no/globalassets/lonn-og-tariffsaker/tariffavtaler/overenskomster-2024-2026/flyoverenskomsten---nho-luftfart-2024-2026.pdf)
og [meklingsprotokoll 09.06.2026](https://www.fellesforbundet.no/globalassets/blokker/t26/bil/protokoll-mekling-flyoverenskomsten-2026.pdf)
har egne SHA-256-kontrollsummer i gjennomgangsgrunnlaget. Overstrøkne gamle
satser i protokollen brukes ikke som nye satser.

Betalingsmotoren er utvidet med valg for følgende vilkår:

- Matpenger kan starte **fra og med** tidsgrensen. Eldre regler som bruker
  **utover** to timer beholder forskjellen.
- Flys særvilkår for mertid etter kort deltidsvakt eller en full avtalt
  arbeidsdag kan velges særskilt. Relevant full dagslengde må angis.
- Krav om varsel samme dag og fradrag for betalt spisetid er separate valg.
- Ytterligere forpleining etter fem timers overtid avklares separat: mat fra
  bedriften eller et faktisk lokalt avtalt beløp.
- Ekstraordinær, uforutsett tilkalling etter at arbeidsstedet er forlatt
  bekreftes særskilt. Vanlig fortsettelse av vakten er ikke tilkalling.
- Et minimum med egen prosent sammenlignes i **kroner** med faktisk betaling.
  Med 200 kr/time gir to timer med 100 prosent 800 kr. Tre timer med 50 prosent
  gir 900 kr. Tillegget til faktisk betaling er da 100 kr.

Oppavrunding påvirker betalingsgrunnlag, ikke faktisk arbeidstid. Et rent
pengetillegg til garantien får ingen fiktive arbeidstimer. Grunnlønn som er
overført til timebank inngår i sammenligningen uten å utbetales en gang til.

Dette er støtte for angitte beregningsvilkår, ikke en ferdig mal for hele
avtalen. Gjenstående arbeid omfatter blant annet full lønnsutbetaling for alle
grupper, skift-/helligdagskjeder, reise, rettighetsvilkår og samordning. Den konkrete klausuloversikten viser mer.

## Nytt i Fly-oppsettet: PL, PLT og fridagsdatoer

**Tariffavtale → Lønnsgrunnlag · Flyoverenskomsten** i PC og PC-nett beregner
PL/PLT etter §§ 4.2–4.3 fra dokumenterte fulltidssummer. Akkordavsavn på
20 % av PL er 25 % av summen før akkordavsavn; det legges ikke bare 20 % på
den summen. Faste tillegg gir PLT. Ukentlig norm × 4⅓ brukes eksakt ved
omregning til timegrunnlag. Skiftgrunnlag trekker fra akkordavsavn, og
faste prosenttillegg har eget grunnlag. Ordinær lønnsutbetaling endres ikke
av å registrere disse grunnlagene. Velg en kontrollert Fly-lønnsgruppe for kontroll mot 2026-minstesatsene,
lærlingenes halvårsskalaer, ungarbeiderskala, sertifikat-/materialtillegg
og NDT II-tak. Fødselsdato og lønnsansiennitet hentes fra Salsy. Lokale
begynnersatser, læremodell, sertifikater og eventuell bevart lønn dokumenteres
av leder. Kontrollen gjelder til 31.03.2027. Lærlingens skift-/overtidsgrunnlag
er bedriftens begynnerlønn for hjelpearbeider; automatisk overtid krever
fylte 18 år. Vanlig lønn må fortsatt være riktig registrert separat.
Kontrollen er ikke en komplett modell for alle lokale lønnsgrupper,
funksjonstillegg eller etterbetalingsoppgjør.

Datoperiodene overlapper ikke, og lønnsslipper sperrer etterfølgende
annullering. Manuelle prosenttillegg beregnes ved godkjenning fra gjeldende
lønnstabell/valgt grunnlag og beholder kildegrunnlaget i godkjent post.
Generell registersletting kan ikke omgå kontrollene for Fly-grunnlag eller
HKs skiftoppgjør.

Fridagsregelen for 1./17. mai kan registreres som årlige datoer, med ett år
eller en dokumentert lokal toårsordning. Salsy og PRP bruker samme kontroll;
ukjent historikk utenfor PRP-planen regnes ikke som fri. Det er ingen
automatisk antakelse om at en toårsordning er avtalt. Se
[testveiledningen](TARIFF_TESTING_TODAY.md).

## Ordinært skiftfremmøte og historikk

I begge PC-klienter har avtaleredigeringen **Minstebetaling ved ordinært
skiftfremmøte (timer, 0 = av)**. Sett for eksempel tre timer når vilkårene i
Fly § 3.1.3 gjelder. Dokumenter avvikende lokal avtale. Valget er uttrykkelig
og av som standard; det gjelder nye/nyregistrerte vakter. Regelen fryses på
vakten, også som «ingen minstebetaling», slik at senere endring av avtalen
ikke omskriver historisk lønn. En sammenhengende arbeidsøkt over midnatt
behandles samlet. Separate fremmøter behandles hver for seg.

Faktisk tilsluttet ekstraarbeid inngår i samme økt. Et rent betalingspåslag
fyller opp manglende grunnlønn uten å legge til arbeidstimer eller lovovertid.
Fast månedslønn og allerede betalt fravær får ikke et slikt dobbelt tillegg.
Dette er forskjellig fra ekstraordinær tilkalling og dens egen garanti.
Samordning med alle andre tariffbestemte tillegg er fortsatt ikke fullstendig.

## Luftfartsoverenskomsten med HK

[Grunntekst 2024–2026](https://hk.no/shared-files/3350/?Luftfartsoverenskomsten+HK-NHO+Luftfart+2024-2026+web.pdf=)
og [meklingsprotokoll 13.08.2026](https://hk.no/shared-files/20497/?Protokoll-mekling-Luftfartsoverenskomsten-NHO-Luftfart-HK-13082026.pdf=)
har en egen gjennomgang. Den skannede protokollen er kontrollert visuelt.

HKs halvtimeavrunding og nytt fremmøte kan også omfatte **mertid**. Dette
krever egne valg. Mertid registreres ikke som overtid for å oppnå garantien.
Matpengenes vilkår holdes adskilt fra Fly-avtalen.

**Tariffavtale → Veide skifttimer · HK–NHO Luftfart** beregner nå vektede
timer fra den ansattes referanseplan. Velg hele kalendermåneder. Vektene er
egne HK-regler; oppstart mellom 03 og 05 må være en faktisk ny arbeidsøkt.
Én måned er standard. Flere referansemåneder krever at **Dokumentert
gjennomsnitt av referansemåneder** velges uttrykkelig og at bedriftens
grunnlag dokumenteres. En lokal gjennomsnittsordning blir ikke antatt automatisk.
Dette 100-kronersoppsettet gjelder lønnsmåneder fra september 2026. Det brukes
ikke til å omregne skiftoppgjør før vedtakelsen; protokollen har et uttrykkelig
unntak for slik etterbetaling. Tidligere oppgjør krever egen kildekontroll.
Sammenhengende vaktdeler over midnatt skaper ikke en ny oppstart. Velg
faktisk forløpt tid eller dokumentert lokal klokketid. Ved faktisk tid telles
overgangen til/fra sommertid; tvetydige eller manglende lokale endepunkter må
avklares før beregning. Plasser alle ubetalte pauser under **Registrerte pauser**.

Forhåndsvisningen viser tidsdelene og beregnet månedsbeløp. Godkjenn
kontroll av referanseplanen, tidsgrunnlaget og eventuell lokal avtale før
oppgjøret lagres. Oppgjøret får fast beløp og fryst grunnlag for én lønnsmåned.
Det inngår i estimat, eksport og lønnsslipp, uten fiktive arbeidstimer.
Kontroller at samme tillegg ikke allerede ligger som et manuelt tillegg.
Delvis arbeidsforhold og ulønnet fravær krever dokumentert justert beløp.
Senere endringer i disse forholdene sperrer lønn til månedsoppgjøret er avklart.
Referanseplanendringer omskriver ikke et allerede godkjent beløp.
Automatisk videreføring til nye måneder og alle lokale avregningsvarianter
er ikke ferdigkontrollert. Fly-avtalens skiftprosenter brukes ikke i stedet.

I **Pensjon og andre ordninger**, velg etterlønn, tre månedslønner,
tariffgrunnlag og **HK–NHO Luftfart 2026 · punkt 520** for HKs særvilkår.
Oppgjøret krever dødsdato, kontrollert ansettelsesdato, mottakergruppe og
opplysninger om annen ordning, også når utbetalingen derfra er null.
To års ansettelse gjelder ved dødsfallet; lønnsansiennitet fra andre jobber
oppfyller ikke dette kravet. Samboer krever dokumentert felles bopel i minst
seks måneder og registrering i Folkeregisteret. For barn og andre forsørgede
må forsørgelsesforholdet bekreftes. Bedriften må avklare tvilstilfeller.
En annen ordning erstatter HK-beløpet bare når den gir samme eller høyere
utbetaling. Et lavere beløp trekkes ikke vilkårlig fra tremånedersbeløpet.
Mottakerandeler kontrolleres, og samme mottaker kan ikke få en ny full
HK-utbetaling ved å endre oppgjørsperioden. Etterlønn holdes utenfor avdødes
vanlige lønnsslipp. HKs vilkår overføres ikke til Fly-avtalen eller bedriftens
egne ordninger. Dokumentert månedslønn, andre utbetalinger og mottakerforhold
må fortsatt kontrolleres av bedriften.
En registrert refusjon avgjør ikke om den ansatte har rett til forskuttering.

## Forskuttering fra 2027 – separate kildevalg

I **Pensjon og andre ordninger** opprettes en ordning med NAV-forskuttering,
avstemming av NAV-refusjon og tariffgrunnlag. Velg riktig avtale under
**Vilkår for forskuttering**. Fly og HK beholder hver sin kilde og referanse.
**Om forskuttering** forklarer vilkårene i begge PC-klienter.

Oppgjøret krever faktisk saksstart fra 01.01.2027, seks måneders sammenhengende
ansettelse ved saksstart, fortsatt arbeidsforhold, bekreftet NAV-rett og
medvirkning. Ved sykdom kreves sykemelding, opplysninger om andre jobber og
bekreftelse på at arbeidsgiverperioden inngår. Lege utenfor EØS krever
NAV-bekreftelse før forskutteringsperioden starter. Del opp perioder ved
NAV-avslag eller brudd på plikter.

Oppgi dokumentert månedsforbruk, også tidligere forbruk utenfor registeret.
Fire måneder er ikke automatisk 120 dager. Godkjente oppgjør deler samme
kalenderårsgrense på tvers av ordninger. Dokumentert bedre ordning kan ha en
høyere grense. Når grensen nås, kreves siste forskutteringsdag og minst én
kalendermåneds varsel. Nye opplysninger kontrolleres igjen før godkjenning;
et gammelt utkast kan derfor måtte beregnes på nytt.

Avstemmingen lager ikke ny lønnsutbetaling og trekker ikke automatisk feilutbetalt
lønn fra den ansatte. Faktisk lønn, NAV-vedtak, varsel og eventuell tilbakebetaling
må behandles av bedriften. Manglende dokumentasjon kan ikke overstyres ved
vanlig tvangsaktivering. Bedriftens egne ordninger uten tariff beholdes.

## Aktivering, historikk og bruk uten tariff

De nye valgene er av som standard eller beholder tidligere virkemåte.
Leder velger dem i avtaleredigeringen etter kildekontroll. Avtaleversjonen
fryses på timeregistreringen. Fakta avklares i **Hendelser → Avklar tariffbetaling**.
Nødvendige manglende fakta stopper godkjenning og lønn for registreringen.
Genererte lønnsslipper må avklares før tilhørende erklæringer endres.
Eldre klienter kan ikke slette nye bekreftede fakta ved å utelate feltene.

Salsy og PRP kan fortsatt brukes **uten tariffavtale**. Tvangsaktivering av
uavklarte lokale valg er mulig med begrunnelse, men gjør ikke en ufullstendig
sentral avtale til en fullført beregningspakke.

## Publisering

Siste bestilling prioriterer fullført **Flyoverenskomst (NHO Luftfart–
Fellesforbundet)** og **Luftfartsoverenskomst (NHO Luftfart–HK Norge)** før
publisering av **0.83.2**. Dette erstatter tidligere krav om alle 15 før denne
utgivelsen. De øvrige ufullstendige avtalene skal fortsatt merkes tydelig.
Vilkåret er ikke oppfylt. Ingen slik utgivelse er publisert.

```sh
.venv/bin/python tools/check_tariff_release.py --target-version 0.83.2
```

Begge de konkrete 2026-avtalene må være fullført. To andre avtaler eller
arbeidstidsvarianter kan ikke erstatte dem i publiseringskontrollen.

Kommandoen teller avtaler, ikke varianter eller enkeltbestemmelser. Den skriver
status og avslutter med kode 2 når kravet ikke er nådd. Den publiserer ingenting.

## English

The two aviation agreements have separate source editions, checksums,
effective dates and clause reviews. New 2026 packages remain withheld from the
template selector. The coverage window lists partial support and specific
outstanding work; neither agreement is labelled complete. Source notes are
in Norwegian. PC controls and guidance are also available in English.

Optional payment controls distinguish inclusive meal thresholds, part-time
conditions, same-day notice, paid meal-time offsets, further food provision,
extraordinary callouts and differently priced guarantees. A guarantee is
compared in money and never fabricates work or duplicates banked base pay.
HK additional-time guarantees and rounding use separate settings. A separate
weighted-roster workflow supports exact time bands, start qualifications,
unpaid breaks, daylight-saving transitions and reviewed frozen monthly
settlements. Optional HK survivor rules check service at death, recipient
relations, documented six-month cohabitation and equal-or-better schemes;
they never become company or Fly defaults. Documentary facts remain the
company's responsibility. Existing
saved versions retain their previous rules. Working without an agreement
remains supported. The latest request requires both named 2026 aviation agreements to be complete
before publication of 0.83.2. That condition remains unmet. Other incomplete
agreements retain their partial status. Optional ordinary-attendance minimum
pay is frozen on new shifts; it does not invent work or duplicate fixed pay.
Fly wage-group checks cover reviewed minimum and training/certificate components,
not automatic ordinary wage replacement. Separate aviation advance checks
cover documented eligibility, annual months and notice, without duplicate salary
or automatic recovery deductions.

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

## Nye oppgjør og kontroll av tilstøtende planer

### Prosentkontingent, trekkliste og pensjonsinformasjon

Tariffytelser og oppgjør har separate valg **Fly: prosentkontingent og
trekkliste** og **HK: prosentkontingent og trekkliste**. Forbundets faktiske
satser og medlemsmeldinger registreres som dokumenterte bedriftsopplysninger;
ingen sats eller medlemskap gjettes fra tariffvalget. Grunnlaget inkluderer
feriepenger og trekkpliktige utgiftsgodtgjørelser. Ekstraordinære styrehonorarer
og erkjentlighetsgaver holdes uttrykkelig utenfor. Forbund/avdeling med
medlemsforsikring og klubb har separate mottakere og øreavrundede beløp.

Fly kontrollerer satsendring fra 1. januar/1. juli med én kalendermåneds
skriftlig varsel. HK krever en hel lønningsperiode fra satsens ikrafttredelse
og samme kalendermånedsvarsel. Flys lavlønnsfond i trekkprioriteten kopieres
ikke til HK. Første mulige trekk etter medlemsmelding og stopp i påfølgende
lønnsperiode fremgår av oppgjøret. Oppgi tilgjengelig beløp etter prioriterte
trekk. Ved delvis trekk må beløpene til begge mottakere og oppfølging av
restansen dokumenteres; programmet oppretter ingen fiktiv overføring.

**Eksporter trekkliste** finnes i begge PC-grensesnitt. Standard er én hel
kalendermåned for Fly og ett helt kalenderkvartal for HK. Annen periode krever
dokumentert avtale på oppgjørene. Kjente medlemmer som fortsatt er ansatt må
ha oppgjør også ved null lønn. Eksporten inneholder identitet, medlemsnummer,
avdeling, perioder, grunnlag, mottakere, faktisk trukket beløp, restanse og
meldinger. Den er rapportgrunnlag for manuell behandling og inneholder
personopplysninger. Bare tilgang til lønn gir tilgang til eksporten. Samme
kontingentperiode sperres mot dobbel registrering, også som eldre fast trekk.

Pensjonsinformasjon har egne Fly/HK-valg. Fly 9.7 krever lokale parters
gjennomgang i den konkrete tariffperioden, protokoll, vurdering av ytelser for
arbeidstakergruppene og dokumentert oppfølging av drøftede endringer. Begge
avtalene registrerer individuell informasjon om leverandør, faktisk innbetaling
og premiegrunnlag. Registrerte pensjonsordninger må gjelde den ansatte på
informasjonsdatoen; dokumenterte eksterne ordninger kan også brukes. HK får
ikke Flys særskilte gjennomgangskrav. Informasjonsregistreringene endrer ikke
lønn eller pensjonspremie og sperrer ikke senere lønnsberegning bare fordi en
gammel lønnssats er endret. De gjør ikke hele avtalen komplett.

PC og PC-nett har **Tariffavtale → Tariffytelser og oppgjør**. Leder velger
ansatt og en kildebestemmelse, fyller dokumenterte fakta og kontrollerer en
forhåndsberegning før lagring. Samme API og eksakte beregninger brukes i begge
klienter og begge serverutgaver. Et oppgjør er uforanderlig; feil annulleres og
beregnes på nytt. Utstedt lønnsslipp sperrer endring. Historikk og CSV-eksport
beholdes. De nye kontrollene er deler av tariffstøtten, ikke dokumentasjon på at
hele avtalen eller bedriftens oppsett er ferdig.

### Oppgaver, reise og utgifter

Fly har separate oppgjør for prøveflyging394 kr/tur, smuss4,83 kr/time,
toalettarbeid98 kr/fly, flygende mekaniker137 kr/loggtime og vask60 kr/uke.
Oppgaven må svare til kildens vilkår. Ukentlig vask reduseres ikke med
stillingsprosent. Bedriftsvask og dokumentert skatteklassifisering skilles fra
kontantlønn. Kostnadsdekning skal ikke øke feriepengegrunnlaget bare fordi den
er skattepliktig.

Oppgi reisetider i hjemstedets norske tid, også ved utenlandsreise. Fly har
som hovedregel to timer før avgang og én time etter ankomst; HK har én time
på hver side. Dokumenterte Fly-unntak velges uttrykkelig. Ventetid legges inn
som én linje per opphold: `stasjon; ÅÅÅÅ-MM-DD TT:MM; ÅÅÅÅ-MM-DD TT:MM`.
Mer enn seks timer ved samme stasjon holdes utenfor. Registrert ordinær
arbeidsplan sammenlignes med reisen slik at ordinær lønn ikke betales igjen.
HK har maksimalt åtte timer per dag utenfor ordinær arbeidstid, og natt22–06
holdes utenfor ved benyttet soveplass. Flys særregler overføres ikke til HK.
Fridagsreise har forskjellige vilkår. HKs formulering om åtte timer à50 prosent
krever dokumentert samlet betalingsmåte etter selskapets reiseregulativ.

Fly-godtgjørelse etter hjemkomst bruker faktisk forløpt tid: mer enn åtte døgn
gir fire timer PL, mer enn fire uker gir sju timer PL. Alternativ betalt fri
legges til første registrerte ordinære arbeidsdag etter hjemkomst. Reiser av
minst ni måneders varighet krever særskilt grunnlag for utestasjonering.
Forskjøvet arbeid på bestemmelsesstedet registreres separat som faktisk arbeid;
reiseoppgjøret oppretter ikke fiktiv overtid eller timebank.

Dokumenterte utgifter har egne Fly/HK-valg. Bedriften oppgir kostnad, allerede
direkte dekket del og kontrollert trekkfri del med skattereferanse. Trekkpliktig
del og refusjon kommer på hver sin side i lønnsgrunnlaget. Diett krever faktisk
bedriftsavtale og beregning, inkludert måltidsfradrag. Det settes ingen antatt
statlig sats. HKs plikt til læremateriell/prøveutgifter brukes ikke automatisk
som Fly-regel. Ansattes nye reiseregningsmodul er fortsatt utsatt.

### Permisjon, prøveavlegging og plikttjeneste

Velferdspermisjon har avtalens egne årsaker, tidskvoter og dokumentasjonsvilkår.
Ved **Behold ordinær vaktlønn automatisk** oppgis delen av vakten som er fri.
Ubetalte pauser må være plassert. Vakten beholder lønn, mens faktisk arbeidstid
reduseres. Lønn som allerede inngår i vakten medregnes automatisk; feltet for
allerede betalt kontantbeløp står da på null. Kontantjustering uten denne
funksjonen forutsetter at faktisk fravær registreres særskilt. Endring av
kildevakt eller pause krever først annullering av oppgjøret. Samtidig fravær
eller ekstraarbeid kan ikke overlappe faktisk betalt fri.

Ammebetaling er begrenset til én time per dag før barnets ettårsdag.
Foreldrekonferanse er begrenset til to timer. Vilkår for samboer, støttet
behandling, besøk utenfor arbeidstid og akutt hjelp må bekreftes. Omsorgspermisjon
har separat toukersperiode. Fly og HK har egne regler for prøveavlegging;
praksiskandidatens utgifter er ikke automatisk HK-lærlinglønn.

Militærtjeneste bruker dokumentert faktisk lønn, offentlig godtgjørelse og
familietillegg. Førstegangstjeneste: halv lønn, høyst tre måneder, med
familietillegg unntatt fradraget. Senere tjeneste: full lønn, høyst én måned,
inkludert familietillegg i fradraget. Tariffbetalingen krever seks måneders
ansettelse og dokumenterte tjenestevilkår. Tre måneders arbeidsplikt etter
retur gir ingen automatisk adgang til trekk uten gyldig oppgjørsgrunnlag.

Feriepengegrunnlag for ulønnet plikttjeneste vurderes særskilt etter
[ferieloven § 10 nr. 5](https://www.arbeidstilsynet.no/regelverk/lover/ferieloven--feriel/).
Kontrollert sykepengegrunnlag ved permisjonsstart, årets tidligere opptjening
og gjeninntreden eller dokumentert unntak kreves. Dette tilleggsgrunnlaget blir
ikke kontantlønn eller timebank. Senere avklaring for tidligere opptjeningsår
må behandles med kontrollert feriepengegrunnlag/korreksjon på lønnsslippen.

### Helligdager, fleksitid og tilfeldig skift

Fly Bilag 9 har egen gjennomsnittsberegning for tapt ordinær fortjeneste,
referansekvartaler, generelle økninger og samordning med dagpenger. Fullt
arbeidet skift på de særskilt navngitte helligdagene kan gi55,57 kr; denne
bestemmelsen gjelder ikke1./17.mai. Ytelsen gir feriepengeopptjening, men øker
ikke skift-/overtidsgrunnlag. Ansettelsesvilkår og oppsigelsens særregel
behandles separat.

Fleksitidsoppgjør dekker nøyaktig fire uker. Faktisk registrert arbeid og
allerede beregnet overtid må stemme med serverens grunnlag. Bare resterende
prosenttillegg over normen avregnes; faktiske timer og timebank endres ikke.
Klokkeslettsfordeling og fleksitidsavtale må dokumenteres.

Tilfeldig skiftarbeid har egne opprinnelige og faktiske perioder. Kort periode
bruker overtidsprosenter; minst14 dager bruker skiftprosenter fra første dag.
Opprinnelig kort periode som forlenges går over til skiftprosenter fra dag14.
Forkorting til mindre enn14 dager bruker overtidsprosenter. Periodisk
flyoverhaling omfattes ikke. Faktiske ordinære vakter og plasserte ubetalte
pauser kontrolleres før oppgjør; tidligere medregnede tillegg skal trekkes fra.

### Fond, forsikring og planvilkår

2026-verdiene er kontrollert mot Fellesordningens egne kilder:
[AFP 2026](https://www.afp.no/om-oss/aktueltsaker/premie-for-2026/),
[OU-samordningen](https://www.afp.no/bedrift/premie-og-faktura/ou-samordningen/),
[Sliterordningen 2026](https://www.afp.no/globalassets/pdf/informasjonsbrosjyre_sliterordningen_05-02-2026.pdf).
AFP er en arbeidsgiverpremie, ikke ansattlønn. Tilslutning, alder og faktisk
innberettet premiegrunnlag må bekreftes. OU-premie og eventuelt ansattrekk
avstemmes separat. Sliterpremie skal ikke videreføres fra de gamle satsene
etter31.12.2023. Pensjons-/forsikringsleverandøren avgjør medlemskap,
dekning og faktisk ytelse. Tariffvalget alene gir ingen slik bekreftelse.
Fly 17 / 26 G vises som forsikringsdekning, aldri automatisk som lønn til den
ansatte. Kontingent krever rettsgrunnlag/fullmakt og riktig mottaker.

**Kildebestemte planvilkår** velges separat fra overtidsreglene. HK har én
kalendermåneds kunngjøringsfrist, med dokumentert lokalt unntak på minst14 dager,
og minst to timers fritid mellom atskilte vaktdeler. Fly-valget bruker
forhandlingskravet og lovens ordinære toukersfrist. Tidligere faktisk
kunngjøring kan dokumenteres med dato/referanse i skiftplanen. Sen eller
udokumentert kunngjøring vises i Hendelser og må behandles av leder.

I PRP kan **Tilstøtende plan** åpne en plan som grenser direkte til den
nåværende kontrollperioden. Ansatt-ID-er må samsvare; fornavn alene brukes ikke
til kobling. Kontrollvaktene er skrivebeskyttet, påvirker hvile/fridager og
følger PRP/CSV, men importeres ikke som nye Salsy-vakter. Ukjente dager mellom
planer regnes ikke som fri. **Fjern kontrollgrunnlag** fjerner denne koblingen.

### Supplerende kontroller: HK-fridager, dispensasjon og historisk lønn

**HK 210.3** har eget oppgjør for faktisk betalt fri i dokumentert dagtidsordning.
Påskeaften kan erstattes med en annen hel fridag hvis ordinært arbeid på
påskeaften av bedriftsmessige hensyn er registrert. Jul- og nyttårsaften er
én felles årlig rett. Oppgjøret frigir hele dagens ordinære vaktdeler, beholder
vaktlønnen og gir verken ekstra kontantlønn eller timebank. Underlaget kan
ikke endres uten at oppgjøret først avklares. HKs øvrige fridags-/avspaserings-
regler er ikke erstattet av dette valget.

**HK 231.1/3** har egne søknads- og tvistemøtefelt i PC, PC-nett og PRP.
Ansattes kommentarer må være vedlagt søknaden. Ved fremsatt møtekrav
kontrolleres tre virkedager (lørdag teller, søndag og navngitt helligdag teller
ikke) og at møtet er avholdt før iverksettelse. Møte på startdato krever
bekreftet rekkefølge. Dette er saksbehandlingskontroll, ikke en automatisk
innvilgelse fra organisasjon eller myndighet. Valgte HK-planvilkår krever disse
opplysningene ved reduksjon av daglig/ukentlig hvile. Dokumentert annet
passende vern og nødvendige godkjenninger må fortsatt sluttkontrolleres.

**Historiske generelle 2026-tillegg** har egne kildebestemte oppgjør: Fly
6,50 kr per dokumentert ordinær lønnstime for april–juni, HK 6,50 + 4,00 kr
for april–august. Medregnet betaling trekkes fra. Registrert arbeidsforhold må
vare til vedtakelsen; oppgjør kan ikke utbetales før vedtakelsen. Oppgjøret
oppretter ikke arbeidstimer eller timebank og etterberegner ikke unntatte
skift-/overtidstillegg. Minstesatsheving skal ikke summeres som et nytt tillegg
oppå beløpet for samme rettighet. Historiske minstelønns-/gruppekorreksjoner,
HK 302.2 og tidligere års oppgjør krever fortsatt egne kilde- og periodekontroller.

**Militær feriepengeopptjening** skiller mellom tariffbetaling etter seks
måneders ansettelse og ferielovens særskilte opptjening etter tre måneder.
Ved tidligere tjeneste registreres opprinnelig tjenestestart; ansiennitet
vurderes før denne datoen. Etter oppbrukt tariffbetalingskvote kan dokumentert
lovbestemt opptjening registreres uten tariffkontantlønn. Opptjeningskvoten
kontrolleres separat per år; gjeninntreden eller lovens dokumenterte unntak
kreves. Det følger ingen tariffmessig arbeids-/tilbakebetalingsplikt av et
oppgjør som bare registrerer lovbestemt ulønnet opptjening.

Kontrollene ovenfor reduserer de konkrete manglene, men full dekning er fortsatt
ikke dokumentert. Uavklarte sentrale kombinasjoner og beregningsområder skal
ikke flyttes til «lokale valg» for å åpne publiseringssperren.

Reiseoppgjøret sorterer alle ventetidslinjer kronologisk før stasjonsgrensen
anvendes. Samme opphold i en annen innskrivingsrekkefølge skal gi samme dags-
og prosentgrunnlag. En egen test kontrollerer Flys sertifiserte overtid og HKs
åttetimersgrense ved ventetid over midnatt.

Kildebestemte Fly- og HK-plan-/overtidsvalg kan ikke blandes i samme avtale,
og oppgjør kontrolleres mot datostyrt tariffvalg gjennom hele perioden, også
gapet mellom to ansattavtaler. Relevant endring av arbeidsforhold eller
avtalevalg krever avklaring av et allerede beregnet oppgjør. Et senere,
uvedkommende arbeidsforhold gjør ikke alene en historisk opptjening ugyldig.

PRP-import kjenner også igjen eldre filer med eksplisitte, tomme standardfelt
for saksbehandling. En reell HK-saksbehandling med kommentarer eller møtedatoer
beholder egen identitet. Første import og eksakt gjenimport hopper over søket
gjennom historiske filvarianter; kompatibilitetssøket brukes når eksisterende
importer faktisk kan kreve det. Tester kontrollerer både engangsimport,
gjenkjenning og at et reelt nytt valg ikke skjules.
