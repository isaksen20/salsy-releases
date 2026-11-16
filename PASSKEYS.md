# Passnøkler i Salsy

Fra Server/PC **0.96.2** støtter nettklientene passnøkler (WebAuthn): mobilnett
på `/app/`, PC-nett på `/app/salsy/`, regnskapsførersiden og Warehouse-nett på
`/app/warehouse/`. Telefonen bekrefter med fingeravtrykk, ansikt eller skjermkode.
Salsy kan kreve bekreftet bruker, men kan ikke kreve at telefonen velger biometri
fremfor PIN. Passordinnlogging er fortsatt tilgjengelig.

## Server og nettadresse

Bruk bedriftens faste HTTPS-adresse med gyldig sertifikat og domenenavn.
Serveren bruker adressen som er konfigurert i **Server / porter** og
**Domene / offentlig HTTPS**. Samme adresse gjelder i vanlig server og privat
serveradministrasjon. Bruk den valgte offentlige porten i nettadressen.

Serveren godtar ikke et annet domene eller en annen port som kommer fra
nettleseren, Host- eller proxyheadere. Nettadressen som åpnes, må stemme med
serverens konfigurasjon. Har bedriften satt opp Apache eller en annen proxy,
må den offentlige adressen også være riktig konfigurert i Salsy. Etter endring
av nettadressen må serveren startes på nytt.

Innlogging via ren IP-adresse støtter ikke passnøkler. Vanlig passordinnlogging
beholdes. Lokal utvikling på `http://localhost:port` er et eget nettleserunntak;
HTTP på bedriftens domene er ikke tilstrekkelig. En støttet og oppdatert
nettleser, aktiv skjermlås og en tilgjengelig passnøkkelleverandør kreves.

## Aktivere

1. Logg inn med brukernavn, passord og klientkode. Fullfør påkrevd passordbytte
   og godta gjeldende vilkår først.
2. Åpne **Innstillinger → Passnøkler**. Regnskapsfører bruker **Passnøkler**
   blant knappene øverst på sin egen side.
3. Gi nøkkelen et navn, for eksempel «Min telefon». Bekreft med nåværende
   passord og den 16-sifrede klientkoden.
4. Trykk **Aktiver passnøkkel**, og følg telefonens dialog.
5. Etter bekreftelse står nøkkelen i listen. Kontoen kan ha flere nøkler.

Navnet vises bare i Salsy; passnøkkelleverandøren kan bruke eget visningsnavn.
Telefonen kan lagre og synkronisere nøkkelen gjennom sin passordbehandler.
Dette styres av telefonen og brukerens egne innstillinger.

## Logge inn

Skriv inn brukernavn og klientkode, eller bruk det som allerede er husket.
Trykk **Logg inn med passnøkkel** og bekreft på telefonen. Passordfeltet kan stå
tomt. Velg riktig konto hvis telefonen viser flere passnøkler for domenet.
Samme nøkkel kan brukes på de støttede nettklientene på samme serveradresse.
Kontoens vanlige tilganger og avdelingsgrenser gjelder fortsatt.

Mobilnettets **Forbli innlogget** gir høyst ni timer. PC-nettklienten logger ut
etter 30 minutters inaktivitet. Innlogging med passnøkkel endrer ikke disse
reglene, krav om vilkår eller muligheten til å avslutte aktive økter.

## Fjerne eller gjenopprette tilgang

**Fjern passnøkkel** sletter bare din valgte nøkkel fra Salsy. Den kan ikke lenger
brukes til ny innlogging. Allerede innloggede økter avsluttes separat. En kopi
hos telefonens passordbehandler kan fortsatt stå i listen der; den kan slettes
separat på telefonen.

Et passordbytte eller en passordreset gjør tidligere passnøkler ugyldige, også
for et påbegynt innloggingsforsøk. Logg inn med det nye passordet og aktiver en
ny nøkkel. Deaktiverte kontoer, deaktiverte ansatte og kontoer som må bytte
midlertidig passord, får ikke logge inn med passnøkkel.

Hvis domenet eller den offentlige porten endres, registrerer du en ny nøkkel på
den nye adressen. Ta vare på vanlig innlogging for gjenoppretting. Nøkkellisten
følger den krypterte sikkerhetskopien; åpne økter og engangsutfordringer lagres
ikke i sikkerhetskopien.

## Linux PC

PC-programmet viser og fjerner de samme nøklene fra **Innstillinger → Konto →
Passnøkler**, eller via **Passnøkler** på regnskapsførersiden. **Åpne nettklienten
for passnøkkel** åpner bedriftens PC-nettklient i systemnettleseren. Biometrisk
bekreftelse skjer der. Dette logger inn nettklienten, ikke Tk-programmet;
PC-programmet beholder passordinnlogging. Ingen passord eller klientkode sendes
i nettadressen.

## Sikkerhet og kontroll

Serveren lagrer offentlig nøkkel og nødvendige kontobindinger i den krypterte
bedriftsfilen. Den mottar ikke biometriske kjennetegn eller privat nøkkel.
Utfordringer er tilfeldige, engangs, tidsbegrenset til to minutter og bundet til
bruker, operasjon og serveradresse. Signatur, nøyaktig nettadresse, RP-domene,
brukerbekreftelse, brukertilstedeværelse og relevante tellere kontrolleres.
Påloggingsforsøk er begrenset. Nøkkelmateriale og passord vises ikke i API-listen
eller endringsloggen.

Implementasjonen bruker Yubicos `python-fido2 2.2.1`:
[server-API](https://developers.yubico.com/python-fido2/API_Documentation/autoapi/fido2/server/index.html),
[kildekode](https://github.com/Yubico/python-fido2).
Plattformbakgrunn: [Apple](https://developer.apple.com/passkeys/) og
[Google](https://developers.google.com/identity/passkeys/supported-environments).

Automatisk kontroll bruker signerte WebAuthn-svar og Chromium med virtuell
CTAP2-autentikator. Fysisk iPhone/iPad, Android og passnøkkelsynkronisering mellom
enheter er ikke testet. En simulator bekrefter protokollflyten, ikke telefonens
biometriske sensor eller valgene i dens passordbehandler.

# English

Server/PC 0.96.2 adds WebAuthn passkeys to mobile web, desktop/accountant web and
Warehouse web. Sign in normally, open Settings → Passkeys (top button for
accountants), confirm your password/client code and register a key. Later enter
your username/client code and select Sign in with a passkey. Biometrics or the
device PIN verify the user; Salsy never receives biometric data or a private key.
Use the exact configured HTTPS domain and port. Password changes/resets invalidate
old keys. Own keys can be removed, and existing sessions managed separately.
Mobile nine-hour and desktop 30-minute idle limits remain. Native Linux manages
keys and opens the browser for web sign-in; it does not import a browser session.
Physical mobile devices and cross-device synchronization have not been tested.
