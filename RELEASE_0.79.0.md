# Salsy 0.79.0 – felles tariffbibliotek i Salsy og PRP

Velg blant **11 kildebelagte tariffavtaler**. Organisasjonene står i parentes,
og kildeutgave, lenke til originaldokumentet, kontrolldato og avgrensninger vises.

- **Dekk og mekanikere:** Biloverenskomsten (NHO/NBF – Fellesforbundet) og
  Bilavtalen (Virke – Fellesforbundet).
- **Lager:** Grossistavtalen (NHO Service og Handel – Fellesforbundet) og
  Grossistoverenskomsten (Virke – Fellesforbundet).
- **Butikk:** Landsoverenskomsten (Virke – HK Norge), Handelsoverenskomsten
  (NHO Service og Handel – HK Norge) og Butikkoverenskomsten (NHO – HK Norge).
  Sistnevnte gjelder et annet avtaleområde enn vanlig detaljhandel.
- **Flere bransjer:** Industrioverenskomstens VO-del fra både NHO/Norsk Industri
  og Virke, Renholdsoverenskomsten (NHO Service og Handel – Norsk
  Arbeidsmandsforbund) og den eksisterende Flyoverenskomsten (NHO Luftfart –
  Fellesforbundet).

I **PC og PC-nett → Tariffavtale → Avtaler → Velg tariffmal** kan leder lese
kilden og åpne et **inaktivt avtaleutkast**. Kontroller og rediger datoer,
ansatte, grenser, tillegg og lokale vilkår før aktivering. Utkastet har dagarbeid
som utgangspunkt; det overskriver ikke eksisterende avtaler. Utvalgte
grunnregler og HKs ordinære prosentvinduer følger med, men minstelønn,
UB/skift, særskilte helligdagsvilkår, avrunding og andre spesialregler er ikke
fullt automatisert. Tariffovertid holdes adskilt fra kontrollen av lovovertid.

I **PRP → Regler og tariff** finnes **44 avtalevarianter og Egne regler**.
Velg riktig norm for dagarbeid, toskift, søndag/turnus eller helkontinuerlig
arbeid. Frittstående PRP og PRP-nett bruker samme bibliotek. Malene endrer ikke
importerte Salsy-avtaler/dispensasjoner og gir ikke automatisk dispensasjon fra
vaktlengde eller hvile. Den frittstående appen trenger ikke nett eller innlogging
for biblioteket. Kildedokumenter åpnes i nettleseren.

**Kontroller at avtalen, satsene og lokale avtaler er oppdaterte før bruk. Er
malen utdatert, rediger reglene selv frem til utvikleren oppdaterer malen.**
Flere offentlige kilder har fortsatt grunntekst 2024–2026 med nyere protokoller
ved siden av. Disse merkes med faktisk kildeutgave. Kontrollert-datoen er
27.10.2026; det gjøres ingen automatisk livekontroll hos tariffpartene.
Programoppdateringer endrer ikke egne lagrede avtaler, historiske registreringer
eller planer automatisk.

Retter dessuten en feil i forhåndsvisning av PRP-import etter avdelingsendringen:
kopiering av lagringsvisningen kunne gi en rekursjonsfeil. Forhåndsvisningen
bruker nå en separat minnekopi og lagrer ikke før selve importen.

Versjoner: Server/PC **0.79.0**, frittstående PRP **0.2.24**.
Android **0.31.3** og Warehouse Android **0.11.2** er uendrede installasjonsfiler.
Oppdater server og PC-klient sammen. Installer DEB-pakkene over eksisterende
pakker etter sikkerhetskopiering, og start programmene på nytt.

Kontrollert med 69 relevante automatiserte tester, native PC og PRP, nettbasert
PC og PRP, faktisk oppstart fra ferdige installasjonspakker, ARM64 under QEMU,
pakkerevisjon og sammenligning av serverkoden på begge arkitekturer. Ingen
fysisk Raspberry Pi eller Android-enhet ble brukt i denne gjennomgangen.
Den private serveradministrasjonen følger samme motor og beholdes kun lokalt.

Se **TARIFFMALER.md**, **SALSY_PRP.md** og den oppdaterte PDF-bruksanvisningen.
Brukerstøtte: **support@salsy.eu**.

## English

Adds a shared catalogue of 11 dated, source-backed collective agreements for
tyre/vehicle workshops, warehousing, retail, industry, cleaning and aviation.
Organization names distinguish alternatives. Desktop and desktop web can open
inactive, editable daytime agreement drafts. Standalone PRP and PRP web share
44 agreement variants plus custom rules. These contain selected starting rules,
not complete automatic implementation of every agreement provision.

Check editions, later settlement protocols and local terms before use. Edit
outdated templates yourself until the developer updates them. Saved agreements
and projects are never silently replaced. Also fixes recursive copying in PRP
import preview, preserving department isolation and preview-only behavior.
Android installers are unchanged. Source code and private Hosting Manager
installers remain private.
