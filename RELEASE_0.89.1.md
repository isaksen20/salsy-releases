# Salsy 0.89.1 – større lysbilder og prøveforsøk

- Kurs bruker mer av tilgjengelig skjermflate i PC, PC-nett og mobilnett.
  Fullskjerm skjuler programrammen. Trykk lysbildet for zoom og flytting.
- Android 0.35.1 viser større kursbilder uten den gamle 400 dp-grensen,
  beholder inntil 1600 px og har fullskjerm med knipezoom og panorering.
- Leder velger **Antall prøveforsøk**, standard **2**, i kursbyggeren.
  Antall kan være 1–100 og gjelder den publiserte kursversjonen.
- Etter siste feilslåtte forsøk får ansatte **Du har ikke bestått, kontakt
  din leder**. Egen omstart sperres i server-API-et på tvers av klienter.
- Leder med kurstilgang kan velge **Nullstill kurs** i kursstatusen og gi en
  ny runde. Tidligere forsøk og hvem som nullstilte, beholdes.
- Eldre kursversjoner uten feltet bruker to forsøk og teller tidligere
  fullførte forsøk. Eldre klienter som lagrer uten feltet, beholder kursets
  lagrede grense. Ingen prøve legges til i introduksjonskursene.

Ta sikkerhetskopi, installer server og PC 0.89.1, start serveren på nytt og
last nettklientene på nytt. Installer signert Android 0.35.1. ARM64-serveren
og privat Hosting Manager følger samme servermotor. Private pakker holdes
lokalt. Fysiske Android-/ARM-enheter og Safari/iPad er ikke prøvd; ingen
OS-tjenester eller bedriftsinstallasjoner endres av testene.

PRP, Warehouse og Kasse beholder sine tidligere versjoner. Kasse er fortsatt
en testutgave. Flyoverenskomsten og Luftfartsoverenskomsten (HK) er fortsatt
ufullstendige; denne utgivelsen endrer ikke deres kontrollstatus.

## English

Salsy 0.89.1 enlarges course slides, adds full-screen viewing and image zoom/
pan in PC and web. Android 0.35.1 removes the fixed image-height limit and
adds pinch zoom. Final exams default to two attempts, configurable per
published course version. After all attempts fail, the server blocks
self-reset and asks the learner to contact their manager. Managers may
reset failed courses to grant a new round while retaining attempt/reset
history. Introductions remain exam-free. Back up, upgrade, restart the
server, reload web clients and update Android.

PRP, Warehouse and Kasse retain their previous versions. Kasse remains a test
edition. Both aviation agreements remain incomplete; their review status is
unchanged by this release.
