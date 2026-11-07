# Salsy 0.90.0 – del kurs som KSA og fjern tildeling

- Leder kan velge ansatt/bruker og **Fjern tildeling** i kursstatus på PC og
  PC-nett. Tilgangen stoppes, og tidligere forsøk/resultater beholdes i
  serverens historikk. Fjernede introduksjoner tildeles ikke automatisk igjen.
  Ordinære kurs kan tildeles på nytt som en ny tildeling.
- **Eksporter kurs (.ksa)** tar med siste lagrede kursutkast, lysbilder,
  bakgrunn, bilder, prøve/fasit, tidsgrenser, beståttgrense og antall forsøk.
  Ansatte, tildelinger og resultater følger ikke med. KSA er ikke kryptert
  og inneholder fasit: del filene bare med kursholdere.
- **Importer kurs (.ksa)** åpner et nytt upublisert utkast med nye ID-er.
  Kontroller, lagre, publiser og tildel manuelt. PC bruker filvalg/lagring,
  nettleseren bruker opplasting/nedlasting. Begge bruker samme scoped API.
- KSA v1 bruker UTF-8 JSON med innebygde PNG-bilder. Maks 40 MiB per fil,
  24 MiB bilder totalt og 1 MiB per PNG. Ugyldige filer avvises før lagring;
  import skjer samlet og gjentatte nettverksforsøk lager ikke duplikater.

Ta sikkerhetskopi, installer server og PC 0.90.0, start serveren på nytt og
last nettklientene på nytt. AMD64 og ARM64 har samme servermotor/nettklienter.
Privat Hosting Manager 0.90.0+hosting.1 følger serveren og holdes lokalt.
Android 0.35.1, PRP, Warehouse og Kasse beholder sine tidligere versjoner.
Kasse er fortsatt en testutgave. Begge luftfartsavtalene er fortsatt
ufullstendige; kontrollstatus endres ikke av denne utgivelsen.

## English

Salsy 0.90.0 adds assignment removal and portable `.ksa` course exchange in
native PC and PC web. Removal stops access but retains historical attempts
and results. Removed introductions are not automatically reassigned. Exports
contain the latest saved draft, slides, images, exam/answer key, timing and
pass/attempt limits, without learner records. Files are not encrypted and
must only be shared with course administrators. Import creates an independent
unpublished draft for review and manual publication/assignment. Both clients
use the same permission- and department-scoped API. Invalid files are rejected
atomically. Limits: 40 MiB per file, 24 MiB total images, 1 MiB per PNG.

Back up, upgrade server/PC, restart the server and reload web clients. Existing
Android and other app versions are unchanged. Private Hosting Manager remains
private. Aviation tariff coverage remains incomplete; Kasse remains test-only.
