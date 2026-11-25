# Lys og mørk modus i Salsy

Fra Server/PC 0.96.1, Salsy Android 0.35.7 og Warehouse Android 0.11.5 kan
brukeren velge **Lys modus** eller **Mørk modus** under **Innstillinger →
Utseende**. Valget trenger ingen leder- eller administratortilgang. Det gjelder
utseendet på denne enheten, ikke innstillinger for bedriften.

- Salsy Android: åpne menyen, velg **Innstillinger**, og velg tema.
- Mobilnettet `/app/`: åpne **Innstillinger → Utseende → Tema**.
- PC-nettklienten `/app/salsy/`: bruk samme valg under **Innstillinger**.
  Regnskapsmodulen følger temaet. Regnskapsførerens egne sider har et eget
  **Tema**-valg øverst til høyre med samme valg, uten å åpne lederens innstillinger.
- Salsy PC: **Innstillinger → Utseende**. Regnskapsfører har valget på sin
  egen side. Byttet bruker den samme innloggingen og endrer ingen rapportdata.
- Warehouse Android og `/app/warehouse/`: velg **Innstillinger → Utseende**.

Standard er lys modus. Valget huskes lokalt etter lukking og omstart. Det
synkroniseres ikke gjennom en brukerkonto eller til andre enheter.
Nettklientene på samme serveradresse deler nettleserens temavalg; åpne faner
oppdateres også når et tema endres i en annen fane. Ulike domener/porter har
separate valg. Dersom nettleseren blokkerer lokal lagring, virker byttet i den
åpne fanen, men kan ikke nødvendigvis huskes etter ny lasting.

Temaet omfatter hovedsider, skjemaer, tabeller, kalendere og dialoger, samt
reise- og utleggsvisningen. Farger som beskriver status beholdes som farger.
Kursbilder, bilder av kvitteringer, logoer og dokumenter får ikke inverterte
farger. PDF-er, Excel-filer og eksporterte data endres ikke av temavalget.
Utskrift fra nettleseren bruker lyst underlag. Nettleserens og operativsystemets
egne filvelgere og andre systemvinduer styres også av systemets innstillinger.

# English

Choose **Settings → Appearance → Light mode / Dark mode**. The accountant
workspace has its own appearance selector; the accounting module follows the
same theme. Available on Salsy Android, desktop PC, `/app/`, `/app/salsy/`,
Warehouse Android and `/app/warehouse/`. The choice is local to the device;
same-origin browser tabs share it. Switching does not change login, business
configuration, calculations or exports. Authored images and documents retain
their original colours. Browser print styles keep a light background.


Fra Server/PC 1.1.11 og Android 1.0.1 vises Salsy-logoen med gjennomsiktig bakgrunn og tynn hvit kontur rundt bokstavene og symbolet. Originalfargene beholdes, også i mørk modus. Serveroppdateringen gjelder både `/app/`, `/app/salsy/` og regnskapsførerens sider.

Since Server/PC 1.1.11 and Android 1.0.1, the Salsy logo retains its original colours on a transparent background, with a thin white outline in both themes.
