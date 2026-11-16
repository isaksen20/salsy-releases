# Salsy 0.96.0 – Serverstatus og IT ansvarlig

Salsy får den separate Android-appen **Salsy Status 0.1.2** for overvåking og
administrasjon av én eller flere servere. PC og PC-nettklienten får en
**Status**-side med feilsøking og søkbar endringslogg. Statusrettigheten kan også
gis til ledere. [Veiledning](SERVER_STATUS.md).

## Appoppdatering 16.11.2026 – Salsy Status 0.1.2

Serverkortene viser nå statusen også med farget omriss: grønt ved normal status,
gult ved treg kontakt eller behov for oppfølging, rødt når serveren ikke kan nås,
er stoppet, låst eller mangler. Rød ramme er 4 dp, mot 2 dp for grønn og gul,
slik at feil synes bedre ved rask rulling. Ikoner og statustekst beholdes.
Bruksanvisningen og nedlastingsoversikten er oppdatert. Installer den nye
signerte Status-APK-en over 0.1.1; server og PC bruker fortsatt 0.96.0.

## Salsy Status på Android

- Legg til en server med HTTPS-adresse, brukernavn, passord og klientkode.
  Vanlige selvstendige servere støttes direkte, uten separat serveradministrasjon.
- Gi serverne egne lokale navn. Oversikten viser statusikon og siste kontroll;
  trykk på et kort for å åpne serverens administrasjonsvalg.
- Grønt betyr normal kontakt. Gult betyr treg kontakt, vellykket nytt forsøk
  eller behov for oppfølging. Rødt betyr utilgjengelig, stoppet, låst eller
  manglende server. Teksten forklarer årsaken; gamle data merkes.
- Se siste sikkerhetskopi, diagnostikk og tilgjengelige serverinnstillinger.
  Med nødvendige rettigheter kan du resette brukerpassord og avslutte økter.
- Tilbakeknappen går til forrige side eller lukker fremste undervindu. Appen
  spør før den lukkes fra serveroversikten.
- Android planlegger bakgrunnskontroll omtrent hvert 15. minutt, med varsling
  ved endret feilstatus. Batterisparing kan forsinke kontrollene. Telefonen må
  være på nett; tvangsstopp stopper overvåking til appen åpnes igjen.

Appen bruker det nye serverikonet med Salsy-logo, avrundede kort og Salsys blå
og turkise farger. Sertifikater må være gyldige; TLS-kontroll omgås ikke.

## IT ansvarlig og tilganger

**IT ansvarlig** opprettes på selve serveren. Velg tilganger ved opprettelse;
ingen administratortilganger velges automatisk. Kontoen kan, men må ikke, være
knyttet til en ansatt. Personlig passordbytte er påkrevd etter midlertidig
passord. Med særskilt rettighet kan kontoen også låse opp og starte serveren
med sitt eget passord. Denne tilgangen tilbakekalles ved relevante kontoendringer.

IT kan se andre ansattes kalendere og sider innenfor sine rettigheter, men
kan bare registrere arbeidstid, vakter og ferie for egen tilknyttet ansatt.
Serverens API håndhever begrensningen. Kontroller valgte tilganger og avdelinger.

Bakgrunnsovervåking bruker en egen tilbakekallbar lesetilgang som ikke kan
utføre administrasjon eller hente brukerloggen. Passord lagres ikke i appen.
Tilgangsnøkler krypteres med Android Keystore; sikkerhetskopi og enhetsoverføring
av appdata er sperret. Administrasjon krever en gyldig vanlig innloggingsøkt.

## Diagnostikk og endringslogg på PC og nett

Status-siden viser serverstatus, sikkerhetskopi og diagnostikk uten å kjøre
vilkårlige systemkommandoer. Endringsloggen kan søkes på bruker, navn, dato,
handling, registreringstype og endrede felter, med sidevis lasting.

Loggen viser hvem som endret hva slags registrering og hvilke felter som ble
endret. Den viser ikke passord, tilgangsnøkler eller dokumentinnhold. Eksisterende
historikk er tilgjengelig; tidligere uregistrerte endringer kan ikke rekonstrueres.
Samlet rapportering av flere servere krever uttrykkelig lokal godkjenning og
beholder den opprinnelige aktøren i loggen. Den private administrasjonspakken
følger serverversjonen, men publiseres ikke.

## Oppgradering og kontroll

Ta sikkerhetskopi. Installer server/PC **0.96.0** over eksisterende pakke,
start serveren på nytt og last nettklientene på nytt. Installer den signerte
**salsy-status-0.1.2.apk** på Android 8 eller nyere. Opprett eller tildel de
nødvendige statusrettighetene før innlogging. Serveren må være oppdatert først.
Oppdatert generell bruksanvisning og regnskapsførerveiledning følger med.

Andre komponenter videreføres: Salsy Android **0.35.6**, Warehouse **0.11.4**,
PRP **0.2.28** og Kasse **0.1.3**. De trenger ingen ny installasjon hvis disse
versjonene allerede brukes. Kasse er fortsatt en testutgave uten reelle betalinger.

API-/tilgangsgrenser, serveropplåsing, PC-/nettvisninger, private serverflyter
og pakkede AMD64-/ARM64-servere er kontrollert med syntetiske data. ARM64 er
kjørt i QEMU. Status-appens 12 automatiske tester og bygg/signaturkontroll har
bestått. Fysisk Android, faktisk varslingslevering, fysisk ARM og systemd-oppstart
er ikke testet. Eksterne proxyer må overvåkes via sine offentlige adresser;
samlerapporten viser den lokale API-tilstanden. Eksisterende begrensninger i
tariffdekning, regnskap, bankintegrasjon og Kasse gjelder fortsatt.

## English

Salsy 0.96.0 adds a permission-controlled Status workspace to native PC and
desktop web, and the separate Android 8+ app **Salsy Status 0.1.2**. Monitor
standalone HTTPS servers using a username, password and client code. Local
server names, green/amber/red status icons, server detail pages, diagnostics,
backup status, authorized password resets and session revocation are included.
The 0.1.2 app update adds matching colored card outlines, with a thicker red
outline for failed/stopped servers. Server and PC remain at 0.96.0.
Back navigation returns to the previous screen; exiting home asks for confirmation.

The server-only IT operator role has explicitly selected permissions and an
optional employee link. Personal server-start access is separately granted.
IT operators may view authorized employee data but register work time and leave
only for their own linked employee. Searchable audit metadata excludes credentials
and document contents. Persistent background status tokens are read-only and
revocable; administrative actions require a normal authenticated session.

Upgrade server and PC, restart the server, reload web clients and install the
signed Status APK. Other app versions remain unchanged. Android schedules
background checks approximately every 15 minutes; network and battery policy
can delay or prevent them. Physical-device notification delivery is not tested.
AMD64 and emulated ARM64 package checks and automated Android UI/logic tests
passed. Source code and private hosting installers remain private.
