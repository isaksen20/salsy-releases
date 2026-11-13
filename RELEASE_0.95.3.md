# Salsy 0.95.3 – Stempling, kamera og tryggere innloggingsøkter

QR-stempling i mobilnettleser og PC-nettklient håndterer nå hengende videostart,
avbrutt kamera og retur fra bakgrunnen. Velg **Start kamera på nytt** hvis bildet
ikke starter. En sen kameratillatelse etter avbrudd lukker strømmen i stedet for
å la kameraet bli stående på. PC-nettklientens bakgrunnsoppdatering avbryter ikke
lenger en åpen stemplingsskanner. Kamerabildene behandles lokalt på enheten.

På mobilnett og Android kan **Forbli innlogget (maks 9 timer)** velges ved
innlogging. Økten avsluttes senest ni timer etter innlogging, også ved aktivitet
eller fornyelse. Passordendring, tilbaketrukket tilgang, utlogging og serverstart
kan avslutte den tidligere. Innloggingen lagres ikke som en varig nettlesertoken.
Lukket fane eller avsluttet app krever ny innlogging; vanlig bakgrunn/skjermlås
er ikke utlogging. Hvis operativsystemet avslutter appen, kan ny innlogging kreves.

Salsy PC og PC-nettklient logger ut etter **30 minutter uten brukeraktivitet**.
Bakgrunnshenting og automatisk øktfornyelse forlenger ikke inaktivitetsfristen.
Både server og klient håndhever reglene. Utløpt PC-økt lukker private vinduer og
forkaster gamle svar fra pågående forespørsler. Android Warehouse rydder også
lokalt ved utlogging uten nett og forkaster gamle skjermsvar.

Manuell stempling avviser klokkeslett som ikke finnes ved overgang til
sommertid og to stemplinger på samme tidspunkt. Dermed unngås automatisk
flytting av klokkeslett og tilfeldig rekkefølge på inn/ut. Kalenderens
kronologiske minioppgaver fra 0.95.1 beholdes.

Sikkerhetskontrollen brukte syntetiske data og en lokal server. Forsøk på å
hente beskyttede data uten passord/token ble avvist. Se
[sikkerhetsgjennomgangen](SECURITY_REVIEW_2026-11-13.md) for omfang og begrensninger.
Dette er ingen garanti for at programvaren er feilfri.

Oppdater server og PC til **0.95.3**, start serveren på nytt og last nettsiden
på nytt. Android: **Salsy 0.35.3** og **Warehouse 0.11.3**. Privat Hosting Manager
følger samme server og distribueres bare lokalt. Fysisk iPhone/Android/ARM og
systemd-omstart er ikke testet i denne gjennomgangen.

English: This release improves QR camera recovery and manual clock-entry
validation. Optional mobile sessions last at most nine hours; PC and desktop web
sign out after thirty minutes without user interaction. Background requests do
not extend desktop idle time. Update the server, PC and Android clients, restart
the server and reload browser pages. Physical-device testing remains outstanding.
