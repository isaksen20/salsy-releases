# Salsy 0.77.21 – brukere på serveren og tvunget passordbytte

Serveren har en ny **Brukere**-fane. Opprett en konto med eller uten tilknytning
til en ansatt, velg rolle og tilganger, og knytt kontoen til en ansatt senere.
Tilganger håndheves på serveren; delegerte administratorer kan bare administrere
kontoer innenfor sine egne rettigheter. Oppsettsadministratoren er beskyttet.

- Kontoer opprettet i servervinduet får et midlertidig passord som ikke må følge
  de vanlige passordreglene. Før resten av appen åpnes må brukeren velge et annet
  passord med 8–256 tegn, små/store bokstaver, tall og spesialtegn.
- Passordbyttet støttes i PC, PC-nett, mobilnett, begge Android-appene og PRP.
  Øktene avsluttes ved passord-/tilgangsendringer. Kontoer uten ansattilknytning
  får ikke tilgang til andre ansattes personlige opplysninger.
- Eksisterende kontoer og passord beholdes. I PC og PC-nett kan administrator
  også velge «Må bytte passord ved neste innlogging» når en bruker opprettes.
- Flere instanser i den vanlige serverutgaven forklares som egne servere for
  avdelinger. Ingen ny felles avdelingsmodell er innført.
- Brukerstøtte: **support@salsy.eu**. Bruksanvisningen er oppdatert.

Versjoner: Server/PC **0.77.21**, frittstående PRP **0.2.21**,
Salsy Android **0.31.2**, Warehouse Android **0.11.1**.
Sikkerhetsrettelsene fra 0.77.20 er beholdt.

Ta sikkerhetskopi og installer nye DEB-filer over eksisterende pakker.
Oppdater klientene før midlertidige kontoer tas i bruk. Start serverinstanser og
klienter på nytt. Android-appene oppgraderes med APK-ene nedenfor.

Kontrollert med 123 relevante automatiserte tester, egne native/nettbaserte
førstegangspålogginger, GUI-integrasjon fra ferdige DEB-pakker, ARM64-kjøring
under QEMU, pakkerevisjon og APK-signaturkontroll. Android er bygget og signert;
passordskjermen er ikke prøvd på fysisk telefon i denne gjennomgangen.

## English

Adds server-side user administration with optional employee links and explicit
permissions. Temporary passwords require a different, compliant password before
application data can be accessed. The flow is supported by desktop, desktop web,
mobile web, both Android applications and PRP. Existing accounts remain unchanged.
Update clients before using temporary accounts. Support: support@salsy.eu.

Installers and documentation are public. Application source and the private
hosting administration package are not published.
