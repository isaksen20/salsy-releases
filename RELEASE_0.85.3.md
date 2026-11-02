# Salsy 0.85.3 – store kvitteringsbilder og gjentatt overnattingssted

Server/PC **0.85.3** og Salsy Android **0.33.2** gjør registrering av kvitteringer
og reiseregninger enklere i PC-klient, PC-nett, mobilnett og Android.

## Kvitteringsbilder tilpasses automatisk

PNG/JPEG-kvitteringer over 5 MiB tilpasses lokalt før opplasting og lagres som
JPEG på maksimalt 5 MiB. Originalfilen endres ikke. Rotasjon håndteres ved
konvertering, og gjennomsiktige bilder får hvit bakgrunn. Bilder som allerede
passer i grensen, beholdes uendret. Kontroller at tekst og beløp er leselige.
Ved konvertering støttes bilder inntil 50 MiB og 60 millioner bildepunkter.

**PDF-kvitteringer beholdes byte for byte**, med eksisterende grense på 5 MiB.
PDF-filer konverteres eller komprimeres ikke. PC-tilpasningen kjøres i bakgrunnen.
Android bruker samme bildeforberedelse i den delte visningen for kamera og filvalg.

Retter også en feil der reisekvitteringer ble rammet av den generelle grensen
på 256 KiB for JSON. Opplastingsruten har nå samme 8 MiB JSON-grense som andre
bilagsruter, slik at et godkjent dokument på 5 MiB får plass etter base64-koding.
Øvrige generelle forespørsler beholder sin eksisterende grense.

## Bruk samme overnattingssted på flere døgn

Etter første overnattingsdøgn kan du krysse av
**Bruk på resterende overnattinger (type, navn og adresse)**.

- Overnattingstype, navn og adresse kopieres til øvrige foreslåtte overnattingsdøgn.
- Måltidsvalg og privat nattillegg beholdes per døgn og må kontrolleres individuelt.
- En dagtidsrest ved hjemreise fylles ikke automatisk med overnatting.
- Alle døgn kan fortsatt redigeres. Kopieringsvalget er en utfyllingshjelp og
  lagres ikke som en lønnsregel.

I PC-klienten er etterfølgende overnattingsdøgn forhåndsutfylt når de åpnes.
I nett/Android fylles de ut med en gang. Endres første sted etter kopiering i
nett/Android, kryss av på nytt for å kopiere den nye verdien.

## Oppgradering og kontroll

Ta sikkerhetskopi. Installer ny server- og PC-DEB over eksisterende pakker med
`sudo apt install ./FILNAVN.deb`, start serveren på nytt og last nettklienten
på nytt. Oppdater Salsy Android med **salsy-android-0.33.2.apk**. Den offisielle
Android-signaturen beholdes. Frittstående PRP **0.2.26** og Warehouse Android
**0.11.2** er uendrede fra 0.85.2.

Serveren finnes for Debian 13 amd64 og arm64; ARM64 krever 64-bits OS, for
eksempel Debian 13 eller Raspberry Pi OS basert på trixie. PC og PRP er amd64.
Oppdatert PDF-bruksanvisning, reiseveiledning, øvrige godkjente veiledninger,
dependency-fix-hjelper, versjonsmanifest og SHA-256-summer følger utgivelsen.
Privat Hosting Manager **0.85.3+hosting.1** er bygget og kontrollert for samme
serverversjon, men publiseres ikke offentlig.

Tester dekker bildekonvertering, rotasjon og gjennomsiktighet, uendrede PDF-er,
PDF-opplasting nær 5 MiB med gjenåpning av kryptert lagring, tilgangsskille,
forespørselsgrenser, kopiering av hotellopplysninger og bevaring av døgnets
måltidsvalg. Arbeidsflytene er prøvd i faktisk PC-, PC-nett- og mobilnettgrensesnitt
med syntetiske data, fra både kilde og ferdige pakker. Privat pakket GUI,
arkitektur-/kildesamsvar, Android-signatur og faktisk dpkg-utpakking er kontrollert.
ARM64-runtime er kontrollert under QEMU. Fysisk Android/iPhone/ARM-enhet og reell
OS/systemd-oppstart er ikke testet i denne utgivelsen.

Lønns-, diett- og skattesatser er ikke endret. Reiseberegningens avgrensninger
fra 0.85.1 gjelder fortsatt: vanlige innenlandsreiser i Norge i 2026 inntil
28 døgn; andre land/år og særtilfeller krever separat behandling. A-melding og
betaling er fortsatt manuell. Tariffavtalene, inkludert begge luftfartsavtalene,
beholder ufullstendig-status. Drift uten tariffavtale er fortsatt mulig.

## English

Salsy 0.85.3 and Android 0.33.2 automatically resize large PNG/JPEG receipt
photos locally and convert them to JPEG within the 5 MiB upload limit. Small
images and original source files remain unchanged. PDFs remain byte-exact,
with the existing 5 MiB limit. Conversion accepts inputs up to 50 MiB and
60 megapixels. Check readability. The travel receipt JSON limit is fixed to
allow valid documents after base64 encoding; general request limits are retained.

Select **Use for remaining overnight stays (type, name and address)** after
entering the first accommodation. Only lodging details are copied; meals and
night allowances stay individual, and daytime return remainders are excluded.
All fields remain editable. No financial calculation or rate is changed.

Back up, upgrade server and PC, restart/reload, and update Salsy Android to
0.33.2. PRP 0.2.26 and Warehouse Android 0.11.2 are unchanged. Synthetic native,
desktop/mobile browser, compiled package, private hosting and ARM64 runtime
checks were performed. No physical mobile/ARM device or actual OS boot was
tested. Travel limitations and incomplete tariff coverage remain documented.
Application source and private hosting installers stay private.
