# Salsy 1.0.1 – kompakte HMS-faner

HMS-områdene vises som faneknapper, på samme måte som på Ansettelse-siden. Den store loddrette menyen er erstattet med en kompakt fanerekke med tydelig markert aktiv fane.

- PC og PC-nett viser flere korte rader når det trengs.
- Mobilnett og Salsy Android lar fanerekken rulles sideveis.
- Lys og mørk modus følger valgt tema.

Arbeidsflyter, data og tilganger er uendret. Hele HMS-funksjonaliteten fra 1.0.0 følger med.

## Oppdatering

Installer server og PC 1.0.1 over eksisterende installasjon. Start Salsy-serveren på nytt, oppdater Salsy Android til 0.39.1 og last nettklientene på nytt. Ingen ny Caddyfile eller nytt sertifikat kreves for denne oppdateringen. ARM64-serveren har samme funksjoner som amd64.

Warehouse 0.11.9, PRP 0.2.28, Kasse 0.1.3 og Status 0.1.3 følger med i eksisterende utgaver. Den private Hosting Manager 1.0.1+hosting.1 er oppdatert til samme servergrunnlag og beholdes lokalt.

## Kontroll

HMS-flytene er testet i PC-programmet og i nettklientene med syntetiske data. Installasjonspakkene kontrolleres separat, ARM64 under QEMU. Fysisk telefon, Raspberry Pi og faktisk systemd-oppstart er ikke testet i denne runden. Tariffenes dokumenterte kontrollstatus er uendret.
