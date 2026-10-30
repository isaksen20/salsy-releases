# Salsy 0.80.0 – QR-/NFC-stempling og plasseringer

Ansatte kan nå stemple inn og ut med **QR-kode**, også i mobilnettappen som
alternativ til NFC på iPhone. **Samme QR-kode eller NFC-brikke brukes til både
inn og ut.** Den ansatte velger handlingen før skanning.

- **PC og PC-nett → Stempling → Plasseringer:** opprett, rediger, aktiver/deaktiver
  eller slett plasseringer. Velg avdeling eller felles plassering for bedriften.
  Avdelingsledere kan endre egne plasseringer; øverste leder/admin kan administrere
  alle. Stednavn er tilgjengelige for leders manuelle etterregistrering.
- **Vis QR / PDF:** koden genereres lokalt på serveren. Hver plassering får en
  tilfeldig stedskode som kan skrives ut. Den inneholder ikke brukerpassord eller
  klientkode. Ingen ekstern QR-tjeneste brukes.
- **Android 0.32.0:** velg QR-kode eller NFC ved inn-/utstempling. Under
  **Innstillinger → Stempelplasseringer** kan leder administrere plasseringer,
  åpne QR/PDF og skrive samme kode til en NFC-brikke. QR-dialogen kan rulles på
  små skjermer.
- **Nettappens kalender:** QR-knapper bruker kamera med lokal jsQR-leser;
  NFC-knapper vises på støttede nettlesere. Dette gjelder både mobilnettappen
  og PC-nettklientens kalender. HTTPS og kameratilgang kreves.
- Ansatte kan stemple på en plassering i en annen avdeling. Stemplingen tilhører
  fortsatt den ansattes avdeling; stedets avdeling registreres separat. Dette
  gir ikke innsyn i andre avdelingers ansatte, lønn eller stemplinger.
- Eksisterende NFC-brikker beholdes når QR først legges til. En kode kan vises
  igjen uten at gamle utskrifter slutter å virke. **Bytt NFC/QR-kode** krever
  bekreftelse og sperrer alle eldre koder for stedet. Sletting sperrer kodene
  og beholder historiske stemplinger, stednavn og avdeling.
- Kamera/NFC-lesing avsluttes etter skanning, ved avbryting og i bakgrunnen.
  Rekkefølge og tidspunkt kontrolleres på serveren. Stempling endrer fortsatt
  ikke automatisk vakter eller lønnsgrunnlag.

En statisk QR-kode kan fotograferes eller deles. Den bekrefter en gyldig kode,
ikke fysisk tilstedeværelse. Geolokasjon inngår ikke i denne utgaven.

Oppdater Server/PC til **0.80.0** og Salsy Android til **0.32.0**.
Frittstående PRP **0.2.24** og Warehouse Android **0.11.2** er uendrede pakker.
Ta backup, installer DEB-pakkene over de eksisterende og start serveren på nytt.
Android-oppdateringen bruker samme offisielle signeringsnøkkel som tidligere.
Den private Hosting Manager følger samme servermotor og beholdes bare lokalt.

Bruksanvisningens kapittel **9.7** og den detaljerte norsk/engelske guiden
**TIME_CLOCK.md**, som følger med server/PC-pakkene, er oppdatert.

Kontrollert med automatiserte API-/tilgangs-/avdelingskontroller, native PC-GUI,
PC-nett og mobilnett med ekte QR-dekoding av simulerte kamerabilder, NFC-hendelser,
PDF-nedlasting, duplikatvern og avbryting. Ferdige pakker, privat tobedrifts-GUI,
ARM64 under QEMU og signert Android-bygg er kontrollert. Ingen fysisk iPhone,
Android-telefon/NFC-brikke eller Raspberry Pi var tilgjengelig for disse testene.

Brukerstøtte: **support@salsy.eu**.

## English

Adds QR clocking, editable department/shared clock locations and locally generated
QR/PDF codes. The same location payload and tag are used for both clock-in and
clock-out; employees choose the action first. Mobile web can use the camera
without Web NFC, and Android adds QR scanning and location management.

Employees may clock across departments; punches stay in the employee's partition
and snapshot the location department without exposing other departments' staff
or payroll. Existing NFC tags keep working when QR is first added. Explicit
rotation revokes earlier codes. Deleting a location revokes its codes and retains
historical punches and labels. Camera/NFC reading stops on completion, cancellation
or backgrounding. The server timestamps punches and checks their sequence.

Static QR codes are copyable and do not prove presence. No geolocation is used.
Web scanning requires trusted HTTPS and camera permission. jsQR 1.4.0 is bundled
with its Apache-2.0 license and verified publisher-package metadata. No external
QR service is contacted. Scheduled shifts remain the payroll source.

Server/PC 0.80.0 and Android 0.32.0 must be updated together. Standalone PRP and
Warehouse Android installers are unchanged. Testing includes simulated camera/NFC
input and QEMU ARM64, but no physical mobile/NFC/Raspberry Pi hardware.
