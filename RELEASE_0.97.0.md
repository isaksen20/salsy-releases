# Salsy 0.97.0 – Stoffkartotek

Ny valgfri modul med sidemenyfane i PC, PC-nett, mobilnett og Salsy Android
0.36.0. Søkbare produktfliser, 24 produktikoner, ni GHS-faremerker og en tredelt
veiviser for PDF, faremerking, påkrevd verneutstyr og produktspesifikke tiltak.
Tiltak og faremerking vises over PDF-sidene. Originalfilen kan lastes ned.
Se [veiledning for Stoffkartotek](STOFFKARTOTEK.md) for oppsett, sikkerhetskrav og plattformforskjeller.

Ansatte har lesetilgang; administrasjon har en egen delegerbar tilgang.
Oppføringer holdes adskilt per avdeling og instans, med arkivering,
konfliktkontroll, kryptert lagring og endringslogg. Ufullstendig tariffdekning
og teststatus for Salsy Kasse er uendret. Privat administrasjonsutgave bygges
lokalt som 0.97.0+hosting.1 og er ikke en offentlig utgivelsesfil.

Et selvstendig illustrert PowerPoint-kurs, **HMS ved bruk av kjemikalier**,
leveres som egen fil for manuell import og tildeling. En separat tekstfil
har 10 prøvespørsmål med tre alternativer og ett riktig svar markert med *.
Kurset blir ikke automatisk tildelt alle ansatte.


## Installering og kursmateriell

Oppdater server og PC til **0.97.0**, start serveren på nytt og last nettklientene
på nytt. Oppdater Salsy Android til **0.36.0**. Aktiver Stoffkartotek under
**Innstillinger → Tilleggsmoduler**. Andre moduler beholder tidligere oppsett.

- [PowerPoint – HMS ved bruk av kjemikalier](https://github.com/isaksen20/salsy-releases/releases/download/v0.97.0/HMS-ved-bruk-av-kjemikalier.pptx)
- [Prøve med fasit for leder](https://github.com/isaksen20/salsy-releases/releases/download/v0.97.0/Prove-HMS-ved-bruk-av-kjemikalier.txt)
- [Importveiledning](https://github.com/isaksen20/salsy-releases/releases/download/v0.97.0/HMS-kjemikalier-LES-MEG.txt)

Kurset importeres via **Kurs → Importer PowerPoint**. Prøven legges inn manuelt;
`*` markerer riktig alternativ og skal ikke vises i ansattprøven. Kurs og prøve
blir ikke automatisk tildelt. Bruksanvisningen er oppdatert med Stoffkartotek.

Testet: PC og mobilnett, faktisk Tk-grensesnitt, PDF-opplasting og isolert
PDF-visning, søk, tilgangs-/avdelingsskille, ferdige DEB-/APK-filer, privat
serveradministrasjon og faktisk import av kursets 30 lysbilder. ARM64 er
kontrollert under QEMU. Fysiske mobil- og ARM-enheter er ikke testet.

English: The optional chemical register adds searchable product tiles, a
three-step SDS/PDF wizard, hazard pictograms and required PPE. Precautions are
shown above the PDF; staff can read while editing requires delegated access.
An independent illustrated course and a separate answer key are included as
optional downloads. Update server/PC and Android, then enable the module in
Settings. Existing incomplete tariff coverage and test-only Checkout status
are unchanged.
