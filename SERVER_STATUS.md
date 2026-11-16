# Salsy Status og IT ansvarlig

## Komme i gang

1. Oppdater Salsy Server og PC til 0.96.0 eller nyere.
2. Åpne **Brukere** på selve serveren. Velg **Ny bruker → IT ansvarlig**.
3. Velg tilgangene uttrykkelig. Ingen administratortilganger velges automatisk.
   Kontoen kan knyttes til en ansatt nå eller senere, men trenger ingen ansatt.
4. Gi et midlertidig passord. Brukeren må bytte det ved første innlogging i
   PC, PC-nettklienten eller Salsy Status. Det nye personlige passordet må følge
   Salsys vanlige passordregler.
5. Installer **Salsy Status** på Android 8 eller nyere. Velg et eget navn på
   tilkoblingen, og legg til for eksempel
   `https://salsy.ditt-domene.no:5443/status` og logg inn med brukernavn,
   personlig passord og bedriftens 16-sifrede klientkode.
6. Gi appen lov til å sende varsler. Oversikten viser siste kontroll og siste
   vellykkede kontakt. Trykk på en server for handlingene du har tilgang til.

HTTPS-sertifikatet må kunne valideres av Android. Sertifikatkontroll blir ikke
slått av. Appen følger ikke HTTP-videresendinger med påloggingsdata.

## Serveroversikt i Android-appen

Fra Salsy Status 0.1.1 vises hver server som et eget kort med serverikon,
navn, kontaktstatus og tidspunkt for siste kontroll. Dette gjelder også flere
servere som rapporteres gjennom én adresse. Administrasjonsvalgene åpnes ved å
trykke på serverkortet. **Endre servernavn** gir hvert kort et eget lokalt navn;
bedriftsnavn, domene og andre brukeres navnevalg endres ikke. Navnene beholdes
ved statusoppdateringer og ny innlogging på samme adresse.

- **Grønt:** normal kontakt på første forsøk, under tre sekunder, og normal
  rapportert serverstatus.
- **Gult:** kontakt bruker minst tre sekunder eller lykkes først etter flere
  forsøk. Gult brukes også når serveren krever oppfølging, innlogging må
  fornyes eller siste kontroll er mer enn 30 minutter gammel. Teksten ved
  ikonet forklarer årsaken.
- **Rødt:** kontakt mislykkes, eller en rapportert server er stoppet, låst
  eller mangler fra rapporteringen. Sist kjente data beholdes og merkes.
- **Grått:** ingen kontrollert status ennå.

Statusforespørselen forsøkes opptil tre ganger ved midlertidige nettverksfeil,
HTTP 408/429 eller 5xx. Ventetiden mellom forsøk er 0,5 og 1 sekund. Manglende
tilgang og sertifikatfeil forsøkes ikke på nytt. Administrative endringer
gjentas aldri automatisk. Oppgitt svartid inkluderer eventuelle nye forsøk.
Uten bekreftet internettilgang vises en melding om at siste kjente status
brukes; appen antar ikke at serveren er nede fordi telefonen er uten nett.

Tilbakeknappen lukker det fremste undervinduet, går fra serversiden til
oversikten og spør før appen lukkes fra oversikten. Bakgrunnskontrollene kan
fortsette etter vanlig lukking, innenfor Androids begrensninger.

## Daglige handlinger i Status-appen

1. Trykk på serverkortet i oversikten. Dette åpner serverens side; bare valg
   som kontoen har tilgang til vises. **Oppdater status** kontrollerer denne
   tilkoblingen. **Oppdater nå** på hjemsiden kontrollerer alle tilkoblinger.
2. Velg **Endre servernavn**, skriv et navn og trykk **Lagre navn**. Gjenta for
   hver rapportert server. Navnene er lokale for denne appinstallasjonen.
3. Under **Sikkerhetskopi og serverstatus** ser du siste registrerte kopi og
   eventuelle problemer. **Feilsøking** viser flere tekniske kontroller.
4. Med brukertilgang: velg **Brukere og passord**, velg brukeren og skriv et
   nytt midlertidig passord to ganger. Brukeren må bytte dette ved innlogging.
   Oppsettsadministrator og egen konto er beskyttet mot denne resettingen.
5. Velg **Innloggede enheter** for øktoversikten. Trykk **Avslutt økt** og
   bekreft for å logge ut enheten. Det sletter ikke brukerkontoen.
6. Med innstillingstilgang: åpne **Innstillinger**, velg automatisk
   sikkerhetskopiering av/på og lagre. Lagringsmapper velges på selve serveren;
   mobilvalget oppretter eller monterer ingen lokal disk eller nettverkslagring.
7. Med loggtilgang: åpne **Endringslogg per bruker**, velg dato fra–til og
   eventuelt bruker. Skriv søkeord og trykk **Søk**. Android bruker datoformatet
   ÅÅÅÅ-MM-DD. **Hent flere treff** laster neste side.
8. Under **Tilkobling** kan du velge **Logg inn på nytt** når administrasjonsøkten
   er utløpt. Oppgi passord og klientkode igjen. Kontroller at riktig adresse
   og konto er valgt. Bakgrunnslesetilgangen kan fortsatt være gyldig selv om
   administrasjonsøkten er utløpt.
9. **Statusenheter** viser enheter med bakgrunnslesetilgang. Fjerning stopper
   denne tilgangen og krever ny innlogging/tilkobling på den aktuelle enheten.
10. **Fjern tilkobling** fjerner forbindelsen og alle dens rapporterte serverkort
    fra telefonen. Appen forsøker også å fjerne egen statusenhet på serveren.
    Dersom serveren ikke kan nås eller administrasjonsøkten er utløpt, kan
    statustilgangen fjernes senere fra en annen godkjent administrasjonsøkt.

Trykk tilbake for å lukke et åpent vindu. Fra serverens side kommer du tilbake
til serveroversikten. Før avslutting av appen får du valget **Lukk appen**
eller **Avbryt**. Vanlig lukking er ikke det samme som Androids tvangsstopp.

Ved feil: kontroller først at telefonen er på nett, at serveren er startet,
at adressen og HTTPS-porten stemmer, og at sertifikatet er gyldig. Ved 404 eller
manglende statusendepunkt: kontroller at serveren er minst 0.96.0 og at eventuell
reverse proxy videresender `/status` og underadressene til Salsy. Ved manglende
valg må leder/administrator kontrollere kontotilgangene. Ikke del passord eller
klientkode med andre som del av feilsøkingen.

## Tilganger

- **Se serverstatus og siste sikkerhetskopi** gir Status-fanen i PC og
  `/app/salsy/`, samt tilgang til mobilappen. Denne kan også gis til ledere.
- **Administrere brukere og tilganger** gir brukeroversikt, passordreset og
  avslutting av økter innenfor kontoens eksisterende tilgangsgrenser.
  Oppsettsadministratorens passord og eget passord kan ikke resettes her.
- **Administrere serverinnstillinger** gir valget for automatisk
  sikkerhetskopiering. Sikkerhetskopimappene velges lokalt på serveren.
- **Status – se samlet endringslogg per bruker** gir tilgang til den søkbare
  loggen. Det er en egen tilgang fordi historikken kan avsløre arbeidsprosesser.
- **IT – låse opp og starte serveren lokalt** gir personlig serveroppstart.
  Opplåsingsnøkkelen etableres ved eget passordbytte. Dersom tilgangen legges
  til senere, bytter brukeren passord igjen før lokal oppstart tas i bruk.

IT-ansvarlig kan ha de samme modulrettighetene som administrator. Kalender og
øvrige ansattsider følger de valgte rettighetene og avdelingstilgangen. IT kan
bare registrere arbeidstid, vakter og ferie for sin egen tilknyttede ansatt;
uten ansattilknytning kan kontoen ikke opprette slike personlige registreringer.
Sperren håndheves av API-et, også når noen forsøker direkte API-kall.

IT-kontoer kan bare opprettes eller omgjøres til IT-konto på selve serveren.
Eksisterende kontoer kan få endret tilganger og ansattilknytning i vanlig
brukeradministrasjon. Kontotypen er tydelig merket **IT ansvarlig**.

## Overvåking og varsler

Androids innebygde JobScheduler planlegger en kontroll omtrent hvert 15.
minutt når telefonen har bekreftet internettilgang. Batterisparing, Doze og
andre Android-begrensninger kan utsette kontrollen. En tvangsstoppet app
overvåker ikke før den åpnes igjen. **Oppdater nå** henter status manuelt.
Telefonen kan ikke sende varsel om et serverproblem mens den selv er uten nett.
Dette er derfor ikke en garanti for varsling innen et bestemt antall minutter.

Appen varsler ved utilgjengelig server, unormal status, manglende tidligere
rapporterte servere eller behov for ny statusinnlogging. Automatisk backup som
mangler eller er over 48 timer gammel, backupfeil og lite diskplass gir varsel.
Gjentatte kontroller med samme feil lager ikke nye varsler. Et varsel fjernes
når en ny kontroll viser normal status.

Interaktiv administrasjon bruker en vanlig tidsbegrenset Salsy-økt.
Bakgrunnsovervåking bruker en egen tilbakekallbar **lesetilgang** som overlever
serveromstart. Denne kan ikke brukes til brukeradministrasjon, dokumenter,
brukerloggen eller serverinnstillinger. Telefonen lagrer ikke passordet.
Tilgangsnøkler lagres kryptert med Android Keystore, og Android-sikkerhetskopi
av appdata er slått av. Endrede passord, deaktivering eller endrede tilganger
gjør at statusnøkkelen må fornyes. Statusenheter kan også fjernes uttrykkelig.

## Feilsøking og endringslogg

**Feilsøking** viser API-status, om den krypterte datalagringen er åpen,
ledig diskplass, backupstatus, nettverksmodus/porter og eventuelt utløp for
serverens lokale TLS-sertifikat. Sertifikater som en ekstern reverse proxy
forvalter, må kontrolleres der. Verktøyene kjører ingen vilkårlige
systemkommandoer og endrer ingen innstillinger som del av en kontroll.

**Endringslogg** kan filtreres på bruker, dato fra–til og fritekst. Søket
treffer navn, brukernavn, ISO-dato/norsk dato, handling, registreringstype,
registrerings-ID og navn på endrede felt. PC-nettklienten har også egne
filtre for opprettet/endret/slettet og registreringstype. Flere søkeord må
alle finnes i treffet. Flere treff hentes sidevis.

Loggen viser tidspunkt, bruker, tilknyttet ansatt når dette finnes, handling,
registreringstype og hvilke felt som ble endret. Den viser ikke verdiene før
og etter endringen, passord, tilgangsnøkler eller innhold i vedlegg. Historikk
som allerede er lagret, er tilgjengelig. Det oppstår ikke historikk for
endringer som tidligere versjoner ikke registrerte. Dette er en endringslogg,
ikke en logg over alle sidevisninger eller alle nettverksforespørsler.

## Flere servere via én adresse – privat administrasjon

Den private administrasjonen har knappen **Mobil serverstatus**:

1. Start serverne som skal godkjennes.
2. Velg rapporterende server og brukernavnet på kontoen som skal kunne logge inn
   gjennom denne serveren. Kontoen må være administrator eller IT ansvarlig,
   med statustilgang og ferdig personlig passord.
3. Kryss av serverne som skal inngå, og velg en lokal konto på hver av dem.
   Disse lokale kontoene bestemmer øvre grense for hva den felles innloggingen
   kan gjøre. Kontotilgangene på rapporterende server må også tillate handlingen.
4. Trykk **Godkjenn valgte servere**. Legg bare adressen til rapporterende
   server inn i appen. Appen oppdager oversikten automatisk og bruker vanlig
   servervisning uten særskilte private produktnavn.
5. Bruk samme konto i PC/nettklienten for samme samlede oversikt.

Godkjenningen lagrer kontoreferanser og fingeravtrykk av tilgangene, ikke delte
passord. Endret passord eller kontotilgang krever ny godkjenning lokalt. En
annen konto på rapporterende server får bare sin vanlige lokale serverstatus.
Avslåtte/stoppede servere blir stående i oversikten. Når rapporterende server
eller selve administrasjonsprogrammet stopper, blir også rapporteringen
utilgjengelig. Tilgangen kan fjernes med **Fjern samlet rapportering**.
Ved delegerte handlinger viser endringsloggen både den opprinnelige IT-brukeren
og den lokale kontoen. Du kan søke og filtrere på den opprinnelige brukeren.
Samlet rapportering viser API-tilstanden. For separat kontroll av en offentlig
reverse proxy og DNS kan den offentlige adressen også legges til som egen
tilkobling i appen.

## English overview

Salsy Status is a separate Android 8+ application. Add an HTTPS server origin
or `/status` URL and authenticate with username, password and client code.
Background polling is scheduled approximately every 15 minutes by Android;
battery management and force-stop can delay or prevent checks. Administrative
actions require a normal authenticated session. Persistent background tokens
are read-only and cannot authorize user management or audit access.

The server-only **IT ansvarlig** role has explicitly selected permissions and
an optional employee link. IT operators can inspect other employees' pages
within their permissions but can register work time and leave only for their
own linked employee. Personal startup access uses independent password-wrapped
vault keys, invalidated by password reset or access removal.

PC and desktop web provide the same Status workspace, also assignable to
managers. Diagnostics are read-only; the searchable, paginated audit view shows
actor/time/action/changed fields, never credentials or document contents.
Private multi-server reporting requires explicit local approval and enforces
the intersection of reporting-account and target-account permissions.

Technical references: [Android JobInfo.Builder](https://developer.android.com/reference/android/app/job/JobInfo.Builder),
[Android Keystore](https://developer.android.com/privacy-and-security/keystore),
[notification permission](https://developer.android.com/develop/ui/views/notifications/notification-permission).
