# Salsy 0.85.2 – Reise og Utlegg for ansattkontoer

Retter PC-nettklientens brukerskjema, som deaktiverte **Reise og Utlegg** for
rollen **Ansatt** og kunne fjerne en eksisterende tilgang ved lagring.
Skjemaet bruker nå samme rettighetsgrunnlag og standardvalg som PC-klienten
og serveren. Nye ansattkontoer får tilgang til egne reiser og utlegg som
standard. Leder kan gi eller fjerne tilgangen uten å endre kontorollen.
En bevisst fjernet tilgang aktiveres ikke automatisk igjen.

## Gi tilgang til en eksisterende ansatt

1. Åpne **Ansettelse → Brukere og tilganger**.
2. Velg kontoen og **Endre valgt konto** i PC-klienten eller **Rediger** i nettklienten.
3. Behold rollen **Ansatt**, velg riktig ansattkobling og kryss av
   **Reise og Utlegg – egne krav og kvitteringer**.
4. Lagre. Den ansatte må logge inn på nytt etter rettighetsendringen.

Modulen må også være aktivert i Innstillinger. **Økonomisk ansvar** er fortsatt
en egen, uttrykkelig tildelt rettighet for attestering; den kreves ikke for å
registrere egne reiser og utlegg. Avdelingsskille, tilgangsgrenser og sperren
mot egenattestering beholdes.

## Pakker og oppgradering

- Server og PC-klient: **0.85.2**, med server for Debian 13 amd64 og arm64.
- Salsy Android **0.33.1**, Warehouse Android **0.11.2** og frittstående PRP
  **0.2.26** følger som uendrede installasjonsfiler fra 0.85.1.
- Oppdatert PDF-bruksanvisning og Reise og Utlegg-veiledning følger med.
  Dependency-fix-hjelperen, øvrige veiledninger, manifest og SHA-256-summer er med.
- Privat Hosting Manager **0.85.2+hosting.1** er bygget og kontrollert for samme
  serverversjon, men publiseres ikke offentlig.

Ta sikkerhetskopi. Installer ny server- og PC-DEB over eksisterende pakker med
`sudo apt install ./FILNAVN.deb`. Start serveren på nytt og last nettklienten
på nytt. Android-appene trenger ingen ny APK fra denne utgivelsen.
ARM64 krever 64-bits Debian 13 eller Raspberry Pi OS basert på trixie.
PC og PRP er amd64. Disse pakkene støtter ikke Debian 12 eller 32-bits ARM.

## Kontroll og begrensninger

Feilen ble gjenskapt i en nettleser før rettelsen. Oppretting, bevaring,
fjerning og ny tildeling av ansattens tilgang samt innlogging til egne utlegg
er kontrollert i PC-nettklienten. PC-klientens oppretting og redigering er
også kontrollert, både fra kilde og ferdige pakker. 67 relevante kilde-/API-,
meny- og private tilgangstester og tre endelige private pakketester bestod.
Privat pakket GUI med to bedrifter, Start alle og separate porter/API er prøvd.
Faktisk dpkg-utpakking i en midlertidig rot og kontrollsummer er kontrollert.

Servernes AMD64/ARM64-applikasjon og nettressurser er identiske, og kompilerte
moduler samsvarer med kilden. ARM64-versjonskontroll og runtime-selvtest er
kjørt under QEMU. Fysisk Android/iPhone/ARM-enhet og reell OS/systemd-oppstart
er ikke testet i denne rettelsen. Ingen lønns- eller reisesatser er endret.

Reiseberegningens avgrensninger fra 0.85.1 gjelder fortsatt: automatikk for
vanlige innenlandsreiser i Norge i 2026 inntil 28 døgn; andre land/år og
særtilfeller krever separat behandling. A-melding og betaling er fortsatt
manuell. Se **TRAVEL_EXPENSES.md** for vilkår og øvrige begrensninger.
Tariffavtalene, inkludert de to luftfartsavtalene, beholder ufullstendig-status.
Drift uten tariffavtale er fortsatt mulig.

## English

Salsy 0.85.2 fixes the desktop web account editor, which disabled Travel and
Expenses for Employee accounts and could remove existing grants on save.
The editor now uses the same employee role limits and default permissions as
the native PC client and server. Managers can grant or revoke access while
keeping the Employee role. Deliberate revocations remain in place.

Open Employment → Users and permissions, edit the account, link the correct
employee and select **Travel and Expenses – own claims and receipts**. Save
and sign in again. The module must be enabled in Settings. Financial
responsibility is separate and not required for personal claims.

Back up, upgrade server and desktop to 0.85.2, restart the server and reload
web clients. Android 0.33.1, Warehouse Android 0.11.2 and PRP 0.2.26 are
unchanged. Source and packaged native/browser workflows, private hosting GUI,
package integrity and ARM64 runtime under QEMU were checked. No physical
mobile/ARM device or actual OS boot was tested. Travel scope and incomplete
tariff coverage remain as documented in 0.85.1. Application source and private
hosting installers stay private.
