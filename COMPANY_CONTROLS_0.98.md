# Avtaledokumenter, stemplingsavvik og lønnsgrunnlag i 0.98.0

## Arbeidsavtaler og taushetserklæringer

Under Ansettelse → Kontrakter velger leder ansatt og oppretter **Ny arbeidsavtale** eller **Ny taushetserklæring**. PC-programmet åpner dokumentlisten i et eget vindu. Ansatte finner sine dokumenter under Personalia, også i mobilnett og Android. Tidligere kontraktregistreringer er beholdt separat.

Arbeidsavtalen har egne punkter for arbeidsgivers adresse, arbeidssted, stilling og oppgaver, oppstart, ansettelsesform/varighet/hjemmel, stillingsomfang, prøvetid, arbeidstid, pauser, vaktendringer og overtid, lønn/tillegg/utbetaling, ferie og feriepenger, annet betalt fravær, opphør, opplæring, pensjon/forsikring/andre ytelser med institusjon, tariff og eventuell innleier. Partenes navn og organisasjonsnummer følger den publiserte versjonen. Feltene er fritekst slik at virksomheten kan beskrive sitt faktiske arbeidsforhold, også uten tariff. Oppgi uttrykkelig «ikke aktuelt» når et påkrevd punkt ikke gjelder.

Dette er strukturert avtalehjelp basert på Arbeidstilsynets oversikt og arbeidsmiljøloven §§ 14-5 og 14-6, ikke en automatisk juridisk kontroll av hvert vilkår. Salsy kontrollerer utfylling, men vurderer ikke blant annet lovligheten av midlertidighet, prøvetidens lengde eller alle bransjeunntak. Arbeidsgiver må kontrollere innholdet. Hjemmekontor, arbeid i utlandet og enkelte arbeidsforhold krever tilleggsavtaler. Avtaler over én måned skal normalt være klare senest sju dager etter oppstart; kortere forhold og utleie ved oppstart. Endringer må dokumenteres etter lovens frister.

**Send til signering** låser teksten og partenes identitet til en versjon med SHA-256-kontrollsum. Leder med ansattadministrasjon signerer som arbeidsgiver og den tilknyttede ansatte signerer som arbeidstaker. Begge leser versjonen, krysser av for aksept og bekrefter med sitt personlige kontopassord. Ulike kontoer kreves for partene. Signeringsforsøk begrenses. Passord lagres ikke i dokumentet. Signatursporet viser konto, rolle, tidspunkt og kontrollsum. Dette er autentisert elektronisk aksept i Salsy, **ikke BankID eller en kvalifisert elektronisk signatur**. Dokumenter og signaturspor kan eksporteres til PDF av partene; arbeidsutkast er skjult for ansatte. Endringer etter publisering gjøres i et nytt dokument.

Dokumentet endrer ikke automatisk stillingsprosent, lønnstabell eller arbeidsforholdsregistrering. Registrer avtalte endringer også i de tilsvarende feltene som brukes ved lønnsberegning.

Taushetserklæringen har redigerbar tekst om formål, fortrolige opplysninger, bruk/deling, sikring, hendelser, tilbakelevering og varighet. Faste unntak bevarer blant annet lovlig varsling, kontakt med myndigheter, opplysningsplikt, nødvendig rådgivning og arbeidstakerens alminnelige erfaringer og ferdigheter. Erklæringen oppretter ingen konkurranseklausul. Det finnes ikke én obligatorisk generell standardtekst som passer alle arbeidsforhold; tilpass omfang og rutiner til virksomheten.

Regnskapsførere med rett til å endre lønn/kontrakter kan opprette og publisere dokumenter, men får ikke signere på vegne av arbeidsgiver bare gjennom regnskapsførerrollen.

## Stemplingsavvik og logg

Innstillinger → **Varsler og forklaring ved stemplingsavvik** lar leder aktivere kontrollen og velge antall minutter for sen innstempling og tidlig utstempling. Kontrollen er avslått som standard; begge minutters grenser står på fem. Først når avviket er større enn grensen kreves forklaring. Arbeid over midnatt sammenlignes med sammenhengende vaktsegmenter, ikke med midnatt som slutt dersom vakten fortsetter.

Serveren lagrer stemplingens tidspunkt når QR/NFC registreres, før forklaringen skrives. Forklaringen flytter derfor ikke arbeidstiden. En obligatorisk dialog ber om begrunnelse. En uferdig begrunnelse beholdes som manglende forklaring og kan fullføres senere. Avviket vises hos leder i Hendelser og med forklaring i stemplingsloggen. Godkjenning/avvisning av hendelsen fjerner ikke selve stemplingen og endrer ikke automatisk lønn. Leder må fortsatt vurdere eventuell bruk av stemplingstid til lønn gjennom eksisterende funksjon.

Stempling → **Samlet stemplingslogg** har dato og ansatt/alle ansatte, med flere sider ved store mengder. Vaktboken viser stemplingsintervaller bare til brukere med rett til å administrere vakter. Den alminnelige statusen viser permisjon og foreldrepermisjon uten å opplyse om permisjonen er betalt. Private fraværsnotater publiseres ikke i vaktboken.

## Support og mobilrotasjon

Supportkontakt lagres på serveren og gjelder alle tilkoblede klienter. Administrator/IT med rettigheten **Administrere serverinnstillinger** kan legge inn e-post, telefon og HTTPS-nettside i Innstillinger. Det lokale servervinduet har også en Brukerstøtte-fane. Tomme felt betyr at ingen kontakt er angitt; egen drift omfatter ikke support fra utvikler.

Instanser startet gjennom den private Hosting Manager bruker support@salsy.eu og https://salsy.eu/. Klientene kan ikke overstyre dette med en annen kontakt. Oppsettet følger også instansen ved automatisk oppstart.

Androids Salsy- og Warehouse-aktiviteter håndterer skjermkonfigurasjon uten å starte innloggingsskjermen på nytt. Nettklientene beholder en gyldig økt ved gjenoppretting av siden. Tilbakekalte eller utløpte økter avvises fortsatt. Grensene på ni timer for «Forbli innlogget» på mobil og 30 minutters inaktivitet på PC-nett er beholdt. Faktisk lukking av nettleser/app og OS-prosessdød gir ikke en ny garanti om fortsatt innlogging.

## Stoffkartotek: kontrolliste

**Eksporter hele listen (PDF)** lager en utskriftsvennlig liste over alle oppføringer i valgt avdeling, også arkiverte. Søkefilteret på skjermen begrenser ikke denne listen. Rapporten viser produkt, leverandør, produktkode/UFI, plassering, databladets dato, faremerking og status, med bedrift, avdeling og eksporttid. Rapporten erstatter ikke originaldatabladene; vis eller eksporter dem ved behov.

## Overtidsgrenser

Innstillinger → **Overtidsgrenser** gir et uttrykkelig valg om bedriftens grenser skal brukes ved klassifisering av registrert mertid/overtid. Standard er ni timer daglig og 40 timer per kalenderuke (mandag–søndag). Avslått valg lar tariff/eksisterende innstillinger gjelde. Innstillingen endrer ikke lovens arbeidstids-/hvilekontroll eller tariffens kildetekst og prosentsatser. Avtalte planlagte langvakter behandles fortsatt som ordinær plan; ekstra registrert arbeid vurderes mot grensene og eksisterende tariffvinduer. Allerede lagrede beregningsgrunnlag skrives ikke om ved endring av innstillingen.

## Lønnseksport: én ansatt per side

Velg periode og eventuelt ansatt i Lønnseksport. **PDF – én ansatt per side** lager kontrollgrunnlag med ansattnummer, navn, lønnskode, dato, type, timer, sats, beløp og merknad. Hver ansatt begynner på en egen side; lange ansattoversikter fortsetter på flere sider. Lønn, tillegg og refusjoner summeres separat. Manglende sats merkes og skal avklares før lønnskjøring. PDF-en er lønnsgrunnlag, ikke en lønnsslipp eller en ferdig importfil til et eksternt lønnssystem. Regnskapsfører har samme PDF-valg med sin valgte periode/ansatt. Interne arbeidsnotater og medisinske fraværsopplysninger tas ikke med i regnskapsførerens PDF.

**Lønnskoder** lar lønnsansvarlig/regnskapsfører med endringsrett mappe timelønn, månedslønn, timer dekket av fastlønn, mertid, overtid, tillegg og utlegg. Standardene er lesbare Salsy-koder, ikke en påstått felles norsk nummerserie. Fast månedslønn har egen lønnslinje; planlagte timer skal ikke betales en gang til som timelønn. Avstem kodene med regnskapsførerens mottakersystem.

Eksisterende Excel-oversikt og de opprinnelige detaljkolonnene er beholdt. Lønnstype og lønnskode legges til på slutten (T/U) på detaljarkene. CSV beholder de opprinnelige kolonnene og legger til lønnstype, lønnskode og periode fra/til. Mottakerspesifikke importmaler og større omlegging av Excel er ikke del av denne utgaven.

## Kilder kontrollert 19.11.2026

- Arbeidstilsynet, arbeidsavtale og minimumsinnhold: https://www.arbeidstilsynet.no/lonn-og-ansettelse/arbeidsavtale/
- Arbeidsmiljøloven, særlig §§ 14-5, 14-6, 14-8 og kapittel 2 A: https://www.arbeidstilsynet.no/regelverk/lover/arbeidsmiljoloven--aml/
- Datatilsynet, oppfølging/opplæring, taushet og sikkerhetsrutiner: https://www.datatilsynet.no/rettigheter-og-plikter/virksomhetenes-plikter/informasjonssikkerhet-internkontroll/etablere-internkontroll/oppfolging-og-opplaring/
- Forretningshemmelighetsloven, definisjon og avgrensning: https://lovdata.no/dokument/LTI/lov/2020-03-27-15
- Tripletex, lønnsimportens kolonner (mottakerspesifikke lønnsarter): https://hjelp.tripletex.no/hc/no/articles/4406369218577-L%C3%B8nnsimport-beskrivelse-av-kolonner
- PowerOffice, lønnsgrunnlagsimport og egen SalaryBasis-mal: https://hjelpesenter.poweroffice.no/loennsgrunnlag-import
