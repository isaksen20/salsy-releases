# Salsy 0.96.2 – Passnøkler i nettklientene

Mobilnett, PC-nett, regnskapsførersiden og Warehouse-nett støtter **Logg inn med
passnøkkel**. Telefonen bekrefter med fingeravtrykk, ansikt eller skjermkode.
Aktiver under **Innstillinger → Passnøkler** etter vanlig innlogging; bekreft
nåværende passord og klientkode. Regnskapsfører bruker knappen **Passnøkler**
øverst. [Oppsett og begrensninger](PASSKEYS.md).

- Samme serveradresse og konto kan bruke nøkkelen i de støttede nettklientene.
- Tilganger, avdelingsgrenser, vilkår og utlogging håndheves som ved passord.
- Mobil beholder høyst ni timer med «Forbli innlogget»; PC-nett har 30 minutters
  inaktivitet. Passordinnlogging beholdes.
- Nøkler listes og fjernes bare av kontoeieren. Passordbytte/reset gjør gamle
  nøkler ugyldige. Biometriske data og private nøkler sendes ikke til Salsy.
- HTTPS-domene og nøyaktig konfigurert offentlig port kreves. Ingen RP-domener
  utledes fra klientstyrte Host-/proxyheadere. Ren IP-adresse støttes ikke.
- Linux PC viser/fjerner nøklene og åpner nettklienten for biometrisk innlogging.
  Nettleserinnlogging overføres ikke til Tk-programmet.

Oppgrader **server og PC til 0.96.2**, start serveren på nytt og last nettklientene
på nytt. Ingen ny Android-APK er nødvendig: Salsy Android er fortsatt 0.35.8,
Warehouse 0.11.5 og Status 0.1.3. PRP 0.2.28 og Kasse 0.1.3 er uendret.
Oppdaterte PDF-veiledninger følger med. Privat administrasjon bygges og
kontrolleres lokalt mot samme serverversjon, og publiseres ikke.

Kontrollene omfatter ekte signaturer, feil domene/port/konto/klientkode,
brukerbekreftelse, gjenbruk, utløp, passordendring, deaktivering, eierskap,
avdelinger og nøkkelfjerning. Nettlesertest med virtuell CTAP2-enhet dekker
registrering og innlogging i mobil-, PC-, regnskapsfører- og Warehouse-nett.
Linux GUI, eksisterende passordflyter og pakket innhold kontrolleres også.
Fysiske iPhone-/Android-/ARM-enheter og synkronisering mellom telefoner er ikke
testet. Tariffdekningen er fortsatt merket ufullstendig; Kasse er kun for testing.

## English

WebAuthn passkeys are available on mobile, desktop/accountant and Warehouse web.
Enroll after password login and password/client-code confirmation. Sign in using
biometrics or device PIN; password fallback remains. Exact configured HTTPS origin,
permissions, departments, terms and session limits are enforced. Own keys can be
revoked; password changes/resets invalidate old keys. Upgrade/restart Server and
PC 0.96.2 and reload web clients. Native PC manages keys and opens the web client
for browser authentication. Physical mobile/ARM devices have not been tested.
