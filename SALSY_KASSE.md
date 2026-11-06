# Salsy Kasse – testutgave / test edition

Android 0.1.2 · Linux 0.1.2

Separat app for Android og Linux (Debian 13, CPython 3.13). Tilkoblet bruk krever
Salsy Server 0.86.1 eller nyere. Den frakoblede demoen trenger ingen server. Store knapper, varekatalog, søk, handlekurv og PDF-utskrift.
**Kun testing: ingen ekte betalinger, lagerendringer, fakturaer eller regnskapsposter.**
Alle testkvitteringer merkes TEST og har en egen nummerserie i valgt avdeling.

## Android på nettbrett og kasseskjermer

Android-utgaven er laget for nettbrett og kasseskjermer på **10 tommer eller
større**. Bruk helst liggende skjerm for et oppsett som ligner Linux-utgaven:

- Til venstre: søk, store vareknapper i rutenett og blaing i varekatalogen.
- Til høyre: handlekurv, sum nederst i kurven og store **Kort**/**Kontant**-knapper.
  Under dem ligger **Korriger** og **Parker**.
- Øverst: bedriftslogo (Salsy som standard), terminalstatus og **Parkert kvittering**.
  Menyknappen åpner kvitteringer, papirformat, logo og innstillinger.
- Varelisten og handlekurven rulles hver for seg. Betjeningsfeltet kan også
  rulles ved stor skrift, skjermtastatur eller lite tilgjengelig vindu.

Oppsettet bruker plassen appvinduet faktisk har: fra 840 dp bredde vises
varene og kassen ved siden av hverandre. Dette brukes også fra 600 dp i korte
vinduer slik at handlekurven fortsatt får plass. I smalere vinduer eller stående
skjerm vises panelene over hverandre. Antall varekolonner tilpasses bredden.
Skjermrotasjon og endring av vindusstørrelse beholder handlekurv, søketekst
og sist beregnede total; de starter ikke en ny betaling.
Demo-knappen ligger fortsatt nederst på innloggingsskjermen. Samme kassevisning
brukes i demo og ved tilkobling til server.

## Prøv demo uten server

Nederst på innloggingsskjermen: trykk **Prøv demo – uten server**. Ingen
brukerkonto, passord, klientkode, tilkoblingsfil eller nettforbindelse trengs.

Demobutikken har 12 oppdiktede varer og tjenester, for eksempel kaffe,
mineralvann, hansker, mikrofiberkluter, bilvask, dekkskift og arbeidstimer.
Alle navn, priser og MVA-beløp i demoen er fiktive illustrasjoner.

1. Søk eller trykk på vareknappene for å legge varer og tjenester i kurven.
2. Velg Korriger for å endre antall eller fjerne en linje. Summen beregnes automatisk.
3. Velg Kort eller Kontant, og bekreft simulert betaling.
   Ved kontantbetaling kan du legge inn et høyere mottatt beløp og se veksel.
4. Etter betalingen vises en demokvittering med linjer, total, illustrert MVA,
   simulert betalingsmåte og veksel. Velg Nytt salg for å fortsette.
5. Du kan vise tidligere demokvitteringer eller skrive ut/lagre PDF med
   A4, 58 mm eller 80 mm. Alle kvitteringer er tydelig merket DEMO og er ikke
   gyldig dokumentasjon på salg. PDF-filer du velger å lagre, beholdes på disken.
6. Avslutt demo før vanlig innlogging. På Android ligger Avslutt demo under
   Innstillinger. Når demoen avsluttes, slettes demokjøpene fra minnet.

Demoen kontakter ingen server eller terminal. Den skriver ikke demodata til
bedriftens lager, regnskap, fakturaer eller lagrede innloggingsoppsett. Vanlig
innlogging bruker fortsatt Salsys beregninger og tilgangskontroll; demoens
lokale eksempelberegninger brukes kun til fiktive data og overføres aldri dit.

## Koble til og bruk

1. Installer server- og PC-oppdateringen (0.86.1), og start serveren igjen. Offentlig server og
   privat Hosting Manager bruker samme kasselogikk.
2. Leder/admin åpner Brukere og tilganger i PC-klient, PC-nettklient eller server.
   Gi brukeren «Salsy Kasse – bruke testkasse og egne testkvitteringer».
   «Se alle testkvitteringer» er en separat administrativ tilgang. Vanlige ansatte
   får ingen kasserettigheter automatisk. Oppsettadministratoren har tilgang.
3. Eksporter klientens tilkoblingsfil fra serveren. Åpne Salsy Kasse, velg filen,
   skriv brukernavn, passord og klientkode. Kode skjules etter første vellykkede
   innlogging. Passord lagres ikke; Android lagrer oppsett med Android Keystore.
   Lokal sertifikatprofil støttes; sertifikatkontroll slås ikke av.
4. Velg avdeling hvis bedriften har flere. Kun én avdeling kan brukes om gangen;
   varer, kvitteringer og rettigheter følger serverens avdelingskontroll.
5. Søk på varenavn, varenummer eller eksisterende lagerkode. En USB/Bluetooth-
   skanner som oppfører seg som tastatur kan skrive koden i søkefeltet. Kamera-
   og dedikert skannerintegrasjon er ikke med i denne første utgaven.
6. Trykk på vareknappene. Velg Korriger og bruk +/− eller Fjern for å endre antall.
   Summen oppdateres automatisk fra serveren, og kontrolleres ved betaling. Produktpris er lagret ekskl. MVA;
   vareknappene viser inkl. MVA. Den viste inklusivprisen avrundes til øre før
   den ganges med antall; MVA fordeles fra dette linjebeløpet. Er bedriften ikke MVA-registrert, brukes 0 %.
7. Velg Kort eller Kontant, og bekreft testbetaling. Testkontant har mottatt
   beløp og veksel. Simulert kort krever eksakt total. Ingen kortdata samles inn.
   Ved usikkert nettverksresultat: trykk Kort eller Kontant igjen mens appen fortsatt er åpen for å gjenta samme
   forespørsel. Serveren hindrer dobbeltregistrering med samme forespørselsnøkkel.
8. Velg A4, 58 mm eller 80 mm og skriv ut testkvitteringen. «Kvitteringer» viser
   siste 100 testkvitteringer; egne for ansatte, alle for kassens administrator.
   Kvitteringene er varige testdata og kan ikke redigeres eller slettes i appen.

## Parkering, logo og ordre

**Parker** lagrer gjeldende handlekurv med et navn. Da kan en annen kunde betjenes.
Trykk **Parkert kvittering** øverst for å hente kurven tilbake. Gjeldende kurv må
først være tom. Priser og total kontrolleres på nytt ved henting/betaling.
Parkering lagres kun i minnet for den aktuelle innloggingen; utlogging eller
lukking sletter parkerte kurver. Dette er ubetalte handlekurver, ikke utstedte
kvitteringer. Parkeringsdata følger aldri med til en annen avdeling eller konto.

I menyen kan du velge en bedriftslogo som PNG (maks 512 kB og 2048 × 2048 piksler).
Logoen lagres i kassens lokale oppsett. «Bruk Salsy-logo» gjenoppretter standarden.
En logo valgt inne i demoen beholdes bare til demoen avsluttes.

**Hent ordre** søker på ordrenummer eller kunde og henter en vanlig lagerordre
eller en direkteordre fra valgt avdeling. Parker eller fullfør gjeldende kurv
først. Antall (også delmengder, for eksempel 1,5 time), varelinjer og ordregrunnlag
beholdes. Ordrelinjer kan ikke redigeres i kassen. Tøm/fjern ordren i innstillinger
for å starte et annet salg. En hentet ordre kan parkeres og hentes igjen.

Serveren krever kassetilgang og kontrollerer ordretilhørighet, priser og antall.
Fakturerte, kansellerte eller allerede testbetalte ordre utelates/avvises. Samme
betalingsforsøk kan gjentas uten en ny testkvittering. En vanlig ordre bruker
lagret ordrepris; en direkteordre som ikke har lagret pris, bruker dagens
produktpris, slik den eksisterende direkteordremodellen gjør.

**Betalingen er fortsatt simulert.** Originalordren merkes ikke som faktisk
betalt, og fakturering, lager og regnskap endres ikke. Referansen til ordren
lagres på testkvitteringen. En gjennomført simulering utelater ordren fra nye
testbetalinger, men er ikke oppgjør for en faktisk kundebestilling.
Demoen har to fiktive ordre, inkludert en med 1,5 arbeidstime.

## Utskrift

Linux lagrer PDF, kan sende til standard CUPS-skriver med `lp`, eller åpne PDF i
standardprogrammet. Velg riktig skriver, rullbredde og skalering i CUPS. A4 er
vanlig papir; 58/80 mm-PDF har faktisk rullbredde og tilpasset lengde. Installer
produsentens Linux-driver hvis skriveren krever det. PDF kan alltid lagres.

Android bruker systemets utskriftsdialog med «Lagre som PDF» og installerte
utskriftstjenester. USB/Bluetooth-kvitteringsskrivere krever en passende
utskriftstjeneste fra skriverleverandøren. Direkte ESC/POS, kassaskuff og
produsentspesifikke Bluetooth-/USB-drivere gjenstår. Velg alle sider i dialogen.
Breddevalget bestemmer PDF-formatet; skriverdriveren bestemmer fysisk utskrift.
Faktiske skrivere og Android-maskinvare er ikke verifisert ennå.

## Kortterminal

Leverandørnøytral protokoll er klargjort i `salary_server.pos_terminal` med start,
status og avbryt. Ingen leverandør eller terminal er valgt; betaling mot faktisk
terminal er derfor sperret på serveren og kan ikke aktiveres fra appen.
En senere adapter må bekrefte beløp, valuta og referanse fra en autentisert
leverandørrespons, håndtere ukjent resultat, avstemming, avbrudd og tilbakebetaling.
En knapp i klienten kan aldri bekrefte et reelt kortkjøp. Ikke lagre kortnummer,
PIN eller CVV. Terminalmodell, avtale og integrasjonstest kommer senere.

## Før bruk som virkelig kasse

Dette er **ikke et produkterklært kassasystem**. Produksjonsbetaling er ikke en
bryter bedriften kan slå på. Før reell bruk må kravene kartlegges og ferdigstilles,
blant annet elektronisk journal med nødvendige kontroller og SAF-T Cash Register,
X-/Z-rapporter og dagsoppgjør, kassapunkt/operatør, kvitterings-/kopi-/returflyt,
betalingsavstemming, retting/annullering og eventuelt integrert kassaskuff.
Nødvendig systembeskrivelse, testgrunnlag og produkterklæring må også på plass.
Testhistorikken her erstatter ingen av disse kravene og er ingen lovpålagt journal.

Primærkilder kontrollert 02.11.2026:
- [Skatteetaten: Spørsmål og svar om kassasystemer](https://www.skatteetaten.no/bedrift-og-organisasjon/starte-og-drive/rutiner-regnskap-og-kassasystem/kassasystem/sporsmal-og-svar-om-nye-kassasystemer/)
- [Altinn: Kontantsalg og kassasystem](https://info.altinn.no/starte-og-drive/regnskap-og-revisjon/regnskap/kontantsalg-og-kassasystem)
- [Skatteetaten: Kassasystemer med produkterklæring](https://www.skatteetaten.no/bedrift-og-organisasjon/starte-og-drive/rutiner-regnskap-og-kassasystem/kassasystem/liste)
- [Kassasystemlova §§ 3–5](https://lovdata.no/lov/2015-06-19-58)

## English

Standalone Android and Linux touch-friendly **test register**. Connected use requires
Salsy Server 0.86.1. The offline demo does not require a server.

Android 0.1.2 targets **10-inch and larger tablets / checkout displays**.
Landscape is recommended: searchable product tiles on the left, basket with
total and separate Card/Cash and Correct/Park buttons on the right. The top bar
shows a configurable company logo, terminal status and parked receipts.
The panels stack in narrow portrait windows; wide or short tablet windows use
the two-panel checkout. Catalogue, basket
and checkout controls scroll independently when needed. Resizing or rotating
keeps the basket, search and last quote; it does not initiate a payment.
The bottom sign-in demo button and both offline and connected workflows remain
available. Linux 0.1.2 uses the same checkout workflow.

Select **Try demo – no server** at the bottom of the sign-in screen to try 12
fictional products and services, basket editing, simulated card/cash payment,
change, receipt history and DEMO PDFs (A4/58/80 mm). No credentials or network
connection are needed. No actual payment or server operation is performed.
Demo history is held only in memory and clears on exit. Connection settings
remain unchanged. Explicitly saved demo PDFs remain on disk.

For connected use: Import a server connection profile and sign in with your account
and client code. A manager grants the explicit Salsy Kasse permission through
the same Users and permissions form in desktop, desktop web or server. Passwords
are never saved. Select one department; catalogue and receipts remain isolated.

Search names, product numbers or registered barcode/QR values. Keyboard-style
scanners work with the search field. Add products, use Correct to adjust quantities, and simulate Card or Cash.
Totals update automatically. Park temporarily stores the current unpaid basket
for this sign-in session; parked baskets clear when signing out or closing.
Load order imports ordinary warehouse orders or direct orders from the selected
department, preserving quantities and the server-owned price basis. Already
invoiced or test-paid orders are rejected; test payments never settle the real
order or change invoicing, stock or bookkeeping. A local company PNG logo can be
selected in settings (512 kB / 2048 × 2048 px maximum). All financial calculations use the server.
Printed PDFs support A4, 58 mm and 80 mm. Linux uses PDF/CUPS; Android uses the
system print service or Save as PDF. Printer-specific integrations are pending.

No real payments, stock changes or accounting entries are made. Receipts are
permanent TEST snapshots. A terminal adapter interface is prepared, but a real
provider, compliance work and the Norwegian product declaration are still needed
before production use. This build cannot be switched into production mode.
