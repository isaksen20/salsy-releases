# Salsy 0.88.0 – Ressursstyring, Kompetanse og Mine oppgaver

Ny ledermodul i både PC-klienten og PC-nettklienten, koblet til det nye
Kompetanse-registeret og de samme serverkontrollene. Salsy Android 0.34.0 gir
ansatte Mine oppgaver. PRP 0.2.27 tar med kompetanser fra Salsy.

## Ressursstyring

Aktiver **Ressursstyring og Mine oppgaver** i **Innstillinger → Tilleggsmoduler**.
Leder med skiftplantilgang får en tidslinje med ansatte, ufargede vaktrammer og
annenhver rad grå. Velg dato mellom pilene; rull til døgnet før og etter.
Oppgaver har navn, dato, faste start-/sluttider, detaljer, kompetansekrav og
prioritet 1–10. Oppgavevinduet har oppretting, redigering, aktivering og sletting.
Dette er daterte enkeltoppgaver; gjenbrukbart oppgavebibliotek kommer senere.
Prioriteten vises, men gjør ingen automatisk fordeling.

Dra oppgaver fra den nedre ruten til en ansatt, mellom ansatte eller tilbake
til oppgaveruten. Tidspunktet endres ikke av dragging. Kompetanse, overlapp,
godkjent fravær, GS-arbeidstid og betalt hvile/deldagsfri kontrolleres på serveren.
Alle avkryssede kompetanser kreves; uten avkryssing er det ingen kompetansekrav.
Vakter åpner de samme handlingene som i kalenderen.

Utenfor vakten tilbys **Avbryt**, **Utvid vakt automatisk** eller
**Endre start/slutt manuelt**. Før lagring vises opprinnelige og foreslåtte tider.
Vakt og tildeling lagres samlet, med revisjonskontroll og kalenderens beskyttelse
av blant annet ekstra timer, beredskap og fraværsgrunnlag. Vakten kan ikke
forkortes av utvidelsen. Sammenhengende fortsettelse over midnatt støttes.
Dette endrer skiftplanen og kan påvirke lønnsgrunnlaget; det oppretter ingen
separat overtidsregistrering automatisk.

**Mine oppgaver** viser bare innlogget ansatts egne oppgaver i PC, PC-nett,
mobilnett og Android. Periodevelgeren støtter inntil 31 dager. Endringer i vakter
eller kompetanse etter tildeling gir varsel ved berørte oppgaver. Deaktivering
skjuler modulen og sperrer API-et uten å slette data. Avdelinger er adskilt.
Les [Ressursstyring](RESOURCE_MANAGEMENT.md) for detaljer på norsk og engelsk.

## Kompetanse og PRP

Aktiver **Kompetanse** i Innstillinger for å lage kompetanser med fullt navn,
2–3 bokstavers forkortelse, farge, ring/firkant i skiftplan og eventuell
sammenhengende dekning. Tildel i ansattmatrisen. Ressursstyring bruker samme
kompetanser; det er ikke et nytt separat register.

Salsy → PRP tar med katalog og ansattens kompetanser. Begge Salsy PC-klienter
og begge PRP-klienter har JSON-import/-eksport av kompetanse. Ansatte matches
med samme ansatt-ID; ukjente ansatte hoppes over og telles. Importen er additiv,
beholder eksisterende data og avviser navnekollisjoner.
Se [Kompetanse](COMPETENCIES.md) og [PRP-veiledningen](SALSY_PRP.md).

## Salsy Kasse – første offentlige testpakker

Kasse 0.1.2 for Linux og Android følger med, med frakoblet demo, touchvennlige
vareknapper, kurv, parkert kvittering, ordrehenting og A4/58/80 mm kvitterings-PDF.
Android er tilpasset nettbrett/kasseskjermer på 10 tommer eller mer.
**Dette er kun en testutgave: ingen ekte betalinger eller endringer i lager,
fakturaer eller regnskap.** Kortterminal og øvrige produksjonskrav gjenstår.
Se [Kasse-veiledningen](SALSY_KASSE.md) før testing.

## Oppgradering og kontroll

Ta sikkerhetskopi. Installer server/PC **0.88.0** over eksisterende pakker,
start serveren på nytt og last nettklientene på nytt. Oppdater Salsy Android til
**0.34.0** og frittstående PRP til **0.2.27**. Warehouse Android **0.11.2** er
uendret. Signerte APK-er bruker den eksisterende offisielle utgivelsesnøkkelen.
Serveren finnes for Debian 13 amd64 og arm64; PC og PRP er amd64.
ARM64 krever 64-bits OS. Oppdatert PDF-bruksanvisning, guider, dependency-fix,
versjonsmanifest og SHA-256-summer følger med.

Ressursflytene er prøvd i faktisk PC-GUI, PC-nett og mobilnett med syntetiske data,
inkludert drag, avbryt, automatisk/manuell utvidelse, kompetanse, kalender og
innsynsskille. Ferdige offentlige og private pakker, eksisterende kalender-/
lønnsflyter og ARM64 under QEMU er kontrollert. Privat Hosting Manager
0.88.0+hosting.1 er bygget og testet, men publiseres ikke.
Fysisk Android/iPhone/ARM-enhet og virkelig OS/systemd-oppstart er ikke testet.

Tidligere Reise og Utlegg-funksjoner beholdes. Automatiske reisesatser gjelder
fortsatt vanlige innenlandsreiser i Norge i 2026 inntil 28 døgn; øvrige tilfeller
krever separat behandling. **Begge luftfartsavtalene og øvrige ufullstendige
avtaler beholder ufullstendig-status**; lokale valg er ikke full sentral dekning.
Drift uten tariffavtale er fortsatt mulig. A-melding, betaling og direkte
myndighetsinnsending er ikke automatisert. Regnskap er fortsatt i kontrollmodus.

## English

Salsy 0.88.0 adds optional Resource management in native PC and PC web, with
fixed-time dated tasks, competency requirements, priorities and vertical
allocation between employees. Outside a shift, cancel or explicitly extend
the shift automatically or with manual times. Calendar validation is shared;
shift changes and assignment commit atomically. Tasks keep their clock times.
Linked employees see only their own tasks in native PC, PC web, mobile web and
Android 0.34.0. A reusable task library will follow later.

The Competencies module and PRP 0.2.27 share qualification catalogues, colours,
plan markers and stable employee IDs, including JSON import/export.
Salsy Kasse 0.1.2 is included as an early Android/Linux test edition with an
offline demo, tablet-oriented layout, parked baskets, order retrieval and PDF
receipts. It performs no real payments and changes no stock/invoice/accounting
data. Terminal integration and production requirements remain outstanding.

Back up, upgrade server/PC, restart/reload and update Android/PRP. Warehouse
Android 0.11.2 is unchanged. Native/browser flows, packaged public/private
runtimes and ARM64/QEMU checks passed with synthetic data. No physical mobile/
ARM device or real OS boot was tested. Aviation agreements remain incomplete;
source code and private hosting installers remain private.
