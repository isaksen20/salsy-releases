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

Fra 0.97.3 starter siden automatisk passnøkkelbekreftelse når innloggingsbildet
åpnes, dersom denne nettleseren husker både brukernavn/klientkode og en lokalt
aktivert eller tidligere brukt passnøkkel. Det samme skjer når økten utløper.
Etter oppgradering fra eldre versjon bruker du **Logg inn med passnøkkel** én
gang for å huske nøkkelen på enheten. Ingen private nøkler eller økttokener
lagres i dette lokale hintet.

Skriv ellers inn brukernavn og klientkode og trykk **Logg inn med passnøkkel**.
Passordfeltet kan stå tomt. Nettleseren bestemmer om et ekstra trykk kreves;
knappen er tilgjengelig hvis automatisk visning avvises. Avbrudd gir ingen
ny automatisk forespørsel i samme innloggingsbilde. Du kan prøve knappen igjen
eller bruke passord. Egen **Logg ut** åpner innlogging uten å be om passnøkkel
igjen med en gang. Reset av nettappen glemmer også det lokale nøkkelhintet. Velg riktig konto hvis telefonen viser flere passnøkler for domenet.
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

## Android fra Salsy 0.36.3 / Warehouse 0.11.6

Aktivert lokal biometri starter automatisk når appen åpner innlogging, og når
en utløpt eller tilbakekalt økt krever ny innlogging. Android bekrefter hver
ny innlogging; denne funksjonen forlenger ikke en eksisterende økt. Avbryter du,
kan du bruke passord eller starte biometri manuelt. Egen Logg ut utløser ikke
en ny forespørsel umiddelbart. Ingen lagring eller sending av fingeravtrykk
eller ansiktsdata er lagt til. Nettverksfeil og manglende rettigheter behandles
som feil, ikke som en grunn til automatisk gjeninnlogging. Endringer som ikke
ble lagret, sendes ikke automatisk på nytt etter innlogging.

Android-appene sjekker offisiell stabil GitHub-utgivelse ved oppstart og når
Innstillinger åpnes. **Appoppdatering → Se etter oppdateringer** sjekker igjen
(med kort begrensning mot gjentatte forespørsler). Når nyere APK for riktig app
finnes, vises **Last ned oppdatering**. Knappen åpner den direkte offisielle
APK-nedlastingen i nettleseren; brukeren bekrefter installasjonen i Android.
Telefonen kan be om tillatelse til installasjon fra nettleseren. Sjekken sender
ikke Salsy-brukernavn, klientkode, serveradresse eller bedriftsdata til GitHub.
Ingen tilgjengelig nettforbindelse vises som mislykket sjekk, ikke som «oppdatert».
Appens versjon sammenlignes med APK-versjonen, som er forskjellig fra serverens.

Automatic login (English): after local passkey enrollment or first successful
passkey sign-in, remembered account details allow one automatic prompt per
login screen on mobile web, PC/accountant web and Warehouse web. An expired
session starts a fresh authentication ceremony. Explicit sign-out and cancelled
prompts do not loop. Some browsers require a tap; the passkey button and password
remain available. Existing keys need one manual passkey login after upgrading.
Native Android and Warehouse start enabled biometrics on launch/reauthentication.
Session deadlines, forced password changes and server-side revocation remain enforced.
Android Settings shows an official APK download button only for a newer stable
app version. Downloads and installation remain user-confirmed.

Platform references: [WebKit biometric WebAuthn UI](https://webkit.org/blog/11312/meet-face-id-and-touch-id-for-the-web/),
[GitHub release API](https://docs.github.com/en/rest/releases/releases#get-the-latest-release).
