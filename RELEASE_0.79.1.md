# Salsy 0.79.1 – sikkerhetskopi til to lagringsplasser

Serverens **Sikkerhetskopi**-fane har nå en valgfri **Ekstra lagringsmappe**.
Velg for eksempel én lokal mappe og én mappe på montert nettverkslagring,
lagre innstillingene og trykk **Ta sikkerhetskopi nå**.

- Samme komplette, krypterte øyeblikksbilde og filnavn lagres i begge mapper.
  Hver fil kan gjenopprettes alene med serveradministratorens innlogging fra
  tidspunktet kopien ble tatt. Kryptering og backupformat er beholdt.
- Hver mappe viser eget tidspunkt, filbane og eventuell feil. En feil i én
  lagringsplass hindrer ikke at den andre forsøkes og sletter ikke en god kopi.
- Automatisk backup bruker egen 24-timersplan per mappe. Etter en feil forsøkes
  bare mapper som fortsatt mangler kopi, tidligst etter ti minutter. Manuell
  backup forsøker begge valgte mapper.
- Tidligere innstillinger med én mappe beholdes. Tøm det ekstra feltet og lagre
  for å gå tilbake til én lagringsplass. Gamle kopier slettes ikke.
- Backupfanen kan rulles. GUI, konsoll og automatisk systemtjeneste bruker samme
  backupmotor. Den private serveradministrasjonen følger samme endring og
  distribueres fortsatt bare lokalt.

Nettverksdisken må være montert i Linux og skrivbar for brukeren som kjører
serveren eller systemtjenesten. Salsy monterer ikke disker eller lagrer
nettverkspassord. Kontrollér at riktig lagringsmedium er montert; en skrivbar
lokal mappe som blir stående på et tomt monteringspunkt, kan ellers motta en
lokal kopi. En manglende mappe opprettes ikke automatisk.

PDF-bruksanvisningens kapittel **2.10** er oppdatert. Den detaljerte norsk/engelske
veiledningen **BACKUPS.md** følger med serverpakken.

Versjoner: Server/PC **0.79.1**. Frittstående PRP **0.2.24**, Android **0.31.3**
og Warehouse Android **0.11.2** er uendrede installasjonsfiler.
Installer serverpakken for riktig arkitektur over eksisterende pakke, og start
serveren på nytt. Eksisterende bedriftsdata og backupfiler følger ikke med i
installasjonspakkene og overskrives ikke av dem.

Kontrollert med 91 relevante automatiserte tester, gjenoppretting fra begge
kopier, simulerte lagringsfeil og faktisk oppstart/backup fra ferdige pakker.
Den private pakkens to bedriftsfaner og ARM64-systemtjenesten under QEMU er
også kontrollert. Ingen fysisk NAS eller Raspberry Pi ble brukt i testene.
Kildekode og private installasjonspakker holdes fortsatt private.

Brukerstøtte: **support@salsy.eu**.

## English

Adds an optional second server backup destination, including mounted network
storage. Both folders receive the same complete encrypted snapshot and filename;
either file can be restored independently. Encryption and archive format stay
the same. Each destination has its own status, daily clock and failure handling.
A destination failure does not prevent attempting the other or delete its good
copy. Automatic retries only cover destinations still due, after ten minutes;
manual backup always attempts both. Existing one-folder settings are preserved.

The backup tab is scrollable. GUI, console and system-service operation share
the same implementation, also used by the private hosting administration.
Mount shares first and grant write access to the server's Linux user. Salsy
does not mount network storage or store network credentials. Verify the right
filesystem is mounted; a writable local directory at an unmounted mountpoint
can otherwise receive the copy locally. The manual and bundled bilingual
backup guide explain setup and restore. PRP and Android installers are unchanged.
Testing used temporary folders and simulated storage failures, plus QEMU for
ARM64; no physical NAS or Raspberry Pi was available.
