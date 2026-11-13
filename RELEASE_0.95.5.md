# Salsy 0.95.5 – Dagens minioppgaver på mobil

Mobilnettklienten på `/app/` og Salsy Android 0.35.4 viser dagens tildelte
minioppgaver over kalenderen. Navn, valgfrie tider og beskrivelse vises i
kronologisk rekkefølge, med oppgaver uten starttid nederst. Listen gjelder
dagens norske dato og beholdes ved bytte av måned. Den skjules når dagen ikke
har oppgaver eller modulen er deaktivert. Eksisterende kalenderdetaljer beholdes.
PC og PC-nettklienten har samme visning som før. Data hentes fra det felles,
rettighetskontrollerte kalender-API-et. Privat Hosting Manager følger samme server.

English: Today’s assigned mini tasks above the mobile calendar, matching Android
0.35.4. Names, optional times and descriptions are chronological. Norwegian today
is independent of the browsed month; no list is shown when empty/disabled.
Existing desktop calendars, permissions and company isolation are retained.


Androids **Oppdater kalender** henter ferske data, slik at nye tildelinger fra
leder ikke blir liggende skjult bak mellomlagrede kalenderdata. Ingen nye
rettigheter eller endringer i lønnsberegning er innført.

Oppdater server og Android-appen, start serveren på nytt og last mobilnettklienten
på nytt. Server for amd64 og ARM64 samt PC-klient 0.95.5 følger med. Bruksanvisning
og personalverktøyveiledning er oppdatert. Ved bruk av privat Hosting Manager
installeres matchende server og privat pakke i samme APT-kommando; privat pakke
publiseres ikke på GitHub. Ufullstendige tariffmaler og skyggeregnskap beholder
samme status.

Kontrollert med syntetiske data: 24 regresjonstester, 6 Android-brotester,
Java-kontroll av sortering/dato, pakkede PC-/nettleserflyter og privat to-instans-GUI.
ARM64 er testet i QEMU. APK-en er bygget, signert og kontrollert; fysisk Android
enhet og faktisk systemd-oppstart er ikke testet.

Android refresh now fetches current calendar assignments. Upgrade the server
and Android, restart the server and reload mobile web. Matching private Manager
remains local. ARM64 was tested in QEMU; no physical Android or systemd boot test.
