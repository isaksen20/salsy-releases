# Salsy 0.89.0 – PowerPoint-kurs og illustrerte introduksjoner

Salsy Server og PC-klient 0.89.0, Salsy Android 0.35.0.

## Introduksjonskurs uten prøve

Når Kurs er aktivert i bedriftens innstillinger, tildeles det automatisk et
introduksjonskurs til aktive brukere: ni illustrerte lysbilder for ledere og
administratorer og seks for ansatte, med introduksjon til Salsy på mobilen.
Hvert lysbilde har en kort forklaring. Begge kurs finnes på norsk og engelsk
og fullføres **uten prøve**. Kursene følger programmet og kan ikke redigeres.

Også lederkontoer uten ansattilknytning får eget kurs under Mine kurs.
Fullføring beholdes når kursmodulen slås av og på. Kursstatus viser både
ansatte og tildelte brukerkontoer uten ansattilknytning. Avdelinger holdes
adskilt. Nye brukere får introduksjonen når kursoversikten åpnes.

## Importer PowerPoint i PC og PC-nett

Velg **Kurs → Importer PowerPoint**. En PPTX-presentasjon blir et nytt utkast
med ett bilde per lysbilde. Byggeren viser bildene, og leder kan legge til
prøve og publisere/tildele med den eksisterende kursflyten. Standard
minimumstid per lysbilde velges ved import og kan endres etterpå.

Importen tar med skjulte lysbilder. Presentasjonen blir statiske bilder;
animasjoner, video, lyd, lenker og interaktive elementer blir ikke kursfunksjoner.
Grensene er 20 MiB, 100 lysbilder og 24 MiB ferdige lysbildebilder. Eldre PPT må
lagres som PPTX først. Filer med makroer, eksterne koblinger eller innebygde
OLE-objekter avvises. Vanlige diagrammer med innebygde regnearkdata støttes.
Originalfilen beholdes ikke, og mislykket import oppretter ikke et delvis kurs.

Konverteringen bruker LibreOffice Impress og Poppler i en Bubblewrap-sandkasse
uten nettverk, med tids-, minne- og filgrenser. Nye Debian-avhengigheter er
erklært i serverpakken og inkludert i det oppdaterte dependency-fix-verktøyet:
LibreOffice Impress, Poppler, Bubblewrap, util-linux og standardskrifter.
Konvertering krever at operativsystemet tillater Bubblewrap/user namespaces;
det brukes ingen usikret reservekonvertering dersom sandkassen ikke kan starte.

Les [kursveiledningen](COURSES.md) eller den oppdaterte PDF-bruksanvisningen.
Android og mobilnett kan gjennomføre kursene; kursoppretting/import skjer i
PC-klienten eller PC-nettklienten.

## Oppgradering og kontroll

Ta sikkerhetskopi, installer server/PC 0.89.0 over eksisterende Debian-pakker,
start serveren på nytt og last nettklientene på nytt. Oppdater Salsy Android
til den signerte APK-en 0.35.0. Eksisterende offisiell Android-signatur beholdes.
Serveren finnes for Debian 13 amd64 og arm64 (64-bits OS). PC er amd64.
PRP 0.2.27, Warehouse Android 0.11.2 og Kasse 0.1.2 er uendret og følger med.

Faktisk PC-GUI, PC-nett, mobilnett, ekte PPTX-konvertering, prøver og svarvisning
er kontrollert med syntetiske data. Ferdige offentlige pakker og privat
Hosting Manager er kontrollert. ARM64-runtime og kurs-API er prøvd under QEMU.
Fysisk Android-/ARM-utstyr, Safari/iPad og virkelig systemd-oppstart er ikke
testet. PPTX-konvertering er kjørt på AMD64; ARM-versjonen av LibreOffice/
Poppler er ikke prøvd. Privat Hosting Manager 0.89.0+hosting.1 er bygget og
testet, men publiseres ikke.

Tariffavtalene beholder korrekt ufullstendig-status, også begge luftfartsavtalene.
Kasse er fortsatt kun en testutgave uten ekte betalinger eller endringer i
lager/faktura/regnskap. Regnskap er fortsatt i kontrollmodus, og direkte
myndighetsinnsending er ikke implementert. Drift uten tariffavtale beholdes.

## English

Salsy 0.89.0 adds PowerPoint import to native PC and PC web: PPTX slides become
static images in a new editable draft. Add an exam afterwards using the normal
course builder if needed. Hidden slides are included. The import has explicit
file/slide limits, validates embedded content and runs LibreOffice/Poppler in
a network-isolated Bubblewrap sandbox. No unsandboxed fallback is used.

Two bundled illustrated introductions are assigned automatically when courses
are enabled: nine content slides for managers/admins and six mobile introduction
slides for employees, in Norwegian and English. **Neither introduction has an
exam.** Unlinked manager accounts can complete their own introduction, and
completion survives disabling/re-enabling the module. Android 0.35.0 and mobile
web support completion; authoring/import is available in native PC and PC web.

Back up, upgrade server/PC, restart/reload and update Android. PRP, Warehouse and
Kasse versions are unchanged. Native/browser flows, real conversion on AMD64,
packaged public/private runtimes and ARM64 API under QEMU passed. Physical
Android/ARM devices, Safari/iPad, ARM Office conversion and real OS boot were
not tested. Tariff coverage remains incomplete; Kasse is test-only. Salsy source
code and private hosting installers remain private.
