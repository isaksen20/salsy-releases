# Salsy 0.96.1 – Lys og mørk modus

## Android-rettelse 16.11.2026 – Salsy Android 0.35.8

Retter at Kalender ikke åpnet og viste `ModuleNotFoundError: No module named
'salsy_prp'`. Den delte norske helligdagskalenderen manglet i Android-pakken.
Den er nå inkludert, uten PRP-programmet eller planleggingsmotoren. Pakken
kontrolleres ved å kjøre kalenderhjelperen direkte fra APK-ens Python-innhold,
uten prosjektets kildekode tilgjengelig. Installer Android 0.35.8 over tidligere
utgave; server og PC bruker fortsatt 0.96.1. Ingen serveroppdatering kreves for
denne rettelsen.

Velg **Innstillinger → Utseende → Lys modus / Mørk modus** i Salsy PC,
Android, mobilnettklienten på `/app/`, PC-nettklienten på `/app/salsy/`,
Warehouse Android og Warehouse-nettklienten på `/app/warehouse/`.
Regnskapsmodulen følger temaet. Regnskapsfører har et kompakt **Tema**-valg
øverst til høyre sammen med de andre knappene, både på PC og nett.

Valget huskes lokalt på enheten. Nettleserfaner på samme serveradresse deler
valget og oppdateres ved temabytte. Byttet beholder innloggingen. Bilder,
kvitteringer, kursillustrasjoner og eksporterte dokumenter beholder egne farger;
nettleserutskrift bruker lyst underlag. [Veiledning](APPEARANCE.md).

## Salsy Status 0.1.3

- Tannhjul øverst til høyre åpner innstillinger med lys/mørk modus.
- **Test notifikasjoner** kontrollerer varslingsrettigheter og sender et
  lokalt testvarsel på servervarslenes varslingskanal.
- En widget på Androids startskjerm viser servernavn, sist kjente status og
  siste kontroll. Trykk på en server for å åpne den i appen.
- Widgeten støtter rulling og endring av størrelse. Den deler ikke
  innloggingsnøkler eller administrative data med startskjermen.

Bakgrunnskontroll og widgetoppdatering påvirkes av Androids batterisparing,
nettverk og tvangsstopp. Widgeten viser sist kjente status. Fysisk Android,
varslingslevering og startskjerm-widget på fysisk enhet er ikke kontrollert.
[Serverstatus og oppsett](SERVER_STATUS.md).

## Installasjon og versjoner

Oppgrader ved å installere den nye DEB-pakken over den eksisterende. Start
Salsy-serveren på nytt og last nettklientene på nytt. Android-appene installeres
over eksisterende, signert med samme offisielle nøkkel.

| Komponent | Versjon |
| --- | --- |
| Server amd64 / ARM64, PC | 0.96.1 |
| Salsy Android | 0.35.8 |
| Warehouse Android | 0.11.5 |
| Salsy Status | 0.1.3 |
| PRP | 0.2.28 (uendret) |
| Kasse Linux / Android | 0.1.3 (uendret, kun testing) |

Oppdatert generell bruksanvisning og egen regnskapsførerveiledning følger med.
Den private serveradministrasjonen er oppdatert og bygget lokalt; den publiseres
ikke. Tariffavtalene beholder dokumentert, ufullstendig kontrollstatus. Denne
utgivelsen hevder ikke full tariffdekning eller godkjent kassasystem.

## Kontroll

Kontrollert med syntetiske data i Chromium for mobil, PC, regnskap,
regnskapsfører og Warehouse, samt ekte Tk/ttk på Linux. Kontrollene omfatter
lagring, gjentatte temabytter, dialoger, tabeller, kalendere og bevart innlogging.
Android har automatiserte tester og lintkontroll. Serverpakkene for amd64 og
ARM64 kontrolleres for identisk programkode og like avhengighetsversjoner.
Privat administrasjon er kontrollert med separate selskaper, porter, faner og
Start alle. Fysisk ARM-enhet og Android-enheter er ikke testet.

## English

Persistent light/dark appearance is available on native PC, Android, mobile web,
desktop web and Warehouse. Accounting follows the theme; the accountant workspace
has a top-right theme selector. Salsy Status 0.1.3 adds settings, a local
notification test and a resizable server-status home-screen widget. Upgrade and
restart the server, reload web clients and update Android apps. Updated PDF
manuals are included. Tariff coverage remains incomplete; Checkout is test-only.
