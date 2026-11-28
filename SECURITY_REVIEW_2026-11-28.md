# Sikkerhetsgjennomgang 28.11.2026

Gjennomgangen omfatter serverkode, tilgangskontroll, økter, passnøkler,
avdelingsskille, opplastinger, de siste QR-/lagerendringene og medfølgende
Python-/HTTPS-avhengigheter. Funksjonelle og angriperlignende tester bruker
midlertidige bedrifter med syntetiske data.

## Test av demoserver uten pålogging

Etter uttrykkelig tillatelse ble `https://demo.salsy.eu:7443/app/salsy/`
testet uten bruk av tidligere oppgitte brukernavn, passord eller klientkode.
Det ble ikke forsøkt passordgjetting, filopplasting, dataskriving, belastning
eller tjenestenekt mot demoserveren. TLS-sertifikatet ble kontrollert normalt.

- 30 avgrensede HTTP-kontroller prøvde anonym tilgang, oppdiktede tokens,
  usignert JWT, falske proxy-/avdelingshoder og noen ugyldige filstier.
- En fersk Chromium-profil prøvde kalender, brukere, regnskapsfører og
  innstillinger med oppdiktet token i nettleserlagringen. Alle viste innlogging.
  Tre direkte API-oppslag i samme profil fikk 401.
- Innloggingsside, tjenesteinformasjon og helsestatus er offentlige. At selve
  HTML-siden kan lastes, gir ikke tilgang til bedriftens data.

Det ble ikke oppnådd autentisert tilgang eller hentet beskyttede data i disse
forsøkene. Offentlig versjonsinformasjon oppga 1.1.14 under kontrollen.
Resultatet utelukker ikke andre angrepsmåter.

## Rettelser

### Store opplastinger ble lest før autentisering

Mottaksvernet tillot enkelte store JSON-/base64-opplastinger før kontrollen av
innlogging inne i API-et. Dette gjaldt blant annet KSA/PPTX, stoffkartotek,
kvitteringer og personalvedlegg. Mange samtidige eller langsomme forespørsler
kunne derfor binde minne og tilkoblinger uten gyldig innlogging.

Rekkefølgen er bekreftet lokalt med et par byte testinnhold; det ble ikke
gjennomført et faktisk minneutmatting- eller nedetidsangrep. Dette er en
tilgjengelighetssvakhet, ikke en påvist måte å lese eller endre data på.

Den felles serveren kontrollerer nå aktiv økt og konto før store kropper leses.
Den vanlige kontrollen av rettigheter, avdeling, passordbytte og vilkår beholdes
etterpå. Store opplastinger deler en begrenset kapasitet: to vanlige eller én
av de største kursimportene. Det gir høyst 64 MiB innkommende, bufret nyttelast
innen dette budsjettet; JSON-/base64-behandling og andre forespørsler kommer i
tillegg, så dette er ikke et tak på hele prosessens minne.

Ved opptatt kapasitet returneres 429 med Retry-After. Ufullførte store
forespørsler har 90 sekunders mottaksfrist, andre 30 sekunder. Kapasiteten
frigjøres også ved feil eller avbrudd. GET/OPTIONS og offentlig PRP-innlogging
arver ikke lenger store importgrenser.

### dnspython

De tidligere pakkene inneholdt dnspython 2.9.0. Leverandøren beskriver
minne-/CPU-utmatting ved parsing av angriperkontrollerte DNS-sonetekster i
[GHSA-vvf4-9x63-8xvv / CVE-2026-128089](https://github.com/rthalley/dnspython/security/advisories/GHSA-vvf4-9x63-8xvv).
Minste versjon og medfølgende pakke er oppdatert til 2.9.2 for server og PC,
inkludert ARM64-serveren. Salsy bruker DNS indirekte gjennom e-postvalidering;
en vei fra Salsy-API-et til den aktuelle soneparseren er ikke påvist.

### HTTPS-komponenten Caddy

Den medfølgende Caddy-utgaven bygges med rettet Go-verktøykjede og egne,
kontrollsumlåste avhengigheter. Kontrollen fant nye treff i Go net/http,
OpenTelemetry og klauspost/compress. Den rettede utgaven bruker Go 1.26.11,
OpenTelemetry 1.47.0 og compress 1.20.2. Tidligere sikkerhetsoppdateringer til
go-chi og x/net beholdes. Begge prosessorarkitekturer bygges og kontrolleres.

Kilder: [Go net/http](https://pkg.go.dev/vuln/GO-2026-6859),
[OpenTelemetry baggage](https://pkg.go.dev/vuln/GO-2026-6975),
[OpenTelemetry attributter](https://pkg.go.dev/vuln/GO-2026-6974),
[compress](https://pkg.go.dev/vuln/GO-2026-6865).
Disse treffene er ikke forsøkt utnyttet mot demoen.

Et kjent varsel gjenstår på modul-/binærnivå for den foreldede
[x/crypto/openpgp-pakken](https://pkg.go.dev/vuln/GO-2026-5932) i Caddys
avhengighetstre. Kildebasert analyse av det samme kontrollsumlåste bygggrunnlaget
finner ingen kall fra Caddys startpunkt til disse funksjonene. Dette er ikke
merket som en rettet pakke eller undertrykt i skanneren. Oppstrøms avhengigheter
og denne vurderingen må følges opp ved senere oppdateringer.

## Kontroller og resultater

- Lokal Uvicorn og Chromium: 26 samlede kontroller besto. Den anonyme
  gjennomgangen omfattet 1 416 ruteanrop, inkludert kompatibilitetsstier.
  Ingen beskyttede data ble hentet. Falske tokens/proxyhoder, avdelingsskille,
  PRP-/widgetbegrensning, utlogging, stier og CORS ble også kontrollert.
- Den brede regresjonsrunden besto 209 av 210 tester. Den ene feilen var en
  eldre forventning om to samtidige KSA-importer uten kapasitetsavvisning.
  Testen kontrollerer nå 429/Retry-After og at nytt forsøk med samme nøkkel
  gir samme kurs uten duplikater. Alle 38 tester i import-/mottaksrunden besto
  etter denne tilpasningen, inkludert en ny kontroll av tidsavbrudd.
- Bank-/PowerOffice-/oppdateringskontroller: 65 tester besto i første runde.
  Én EHF-test krevde Java/Saxon i testmiljøet; med disse tilgjengelige besto
  også den. De 17 egne EHF-sikkerhetsregresjonene besto i den brede runden.
- Pip-audit fant ett kjent treff før oppdateringen og ingen etterpå i de 49
  medfølgende serveravhengighetene. Faktiske runtime-versjoner er like for
  AMD64/ARM64 og samsvarer for avhengigheter som deles med PC-pakken.
- Go-kildeanalyse av det rettede, låste Caddy-bygggrunnlaget fant ingen kjente
  sårbarheter i kalte kodebaner. OpenPGP-forbeholdet over beholdes. Begge
  binærfiler ble reprodusert med identiske, låste SHA-256-kontrollsummer.
- Fem tester av bygglås og faktisk HTTPS-proxy besto, inkludert kontroll av
  TLS-sertifikat og overskriving av forfalsket klientadresse.
- Den lokale jsQR-filen og lisensen samsvarer med registrerte SHA-256-verdier.
  [Leverandørens advisory-side](https://github.com/cozmo/jsQR/security/advisories)
  viste ingen publiserte varsler ved kontrollen. Leste QR-verdier brukes som
  data mot validerte API-er og vises som tekst; de kjøres ikke som skript eller
  åpnes automatisk som en vilkårlig nettadresse i de gjennomgåtte skannerne.
- De faktiske kompilerte installasjonspakkene besto 69 regresjonstester.
  Kursfil med bilder/prøve ble eksportert, importert og redigert via både
  native PC og Chromium mot det rettede API-et. Server-GUI ble prøvd med
  oppsett, start/stopp, omstart og sikkerhetskopi under drift.
- Privat faneutgave ble bygget som 1.1.17+hosting.1 med eksakt avhengighet av
  server 1.1.17. Syv tilgangstester og tre pakketester besto. Faktisk GUI med
  to testbedrifter bekreftet kryptert tilknytning, hostingadministrator,
  separate data/porter, Start alle, fanebytte, avvist krysstilgang og avslutning.
- ARM64-pakkens kompilerte mottaksvern og dnspython 2.9.2 ble kjørt i QEMU,
  og den nye ARM64-Caddy-binærfilen startet med korrekt versjon.
- Den brede native PC-kontrollen gjennomførte menyrunden, men hang senere i
  skrivebordets X11/XIM-tekstinntasting. Kallstakken viste venting i XCreateIC.
  Med XMODIFIERS=@im=none kun i testprosessen besto resten av kontrollen:
  HTTPS-innlogging for leder/ansatt, personalia, vakter, fravær, lønn, PDF/CSV,
  brukeropprettelse og nullstilling. Ingen produksjonsinnstilling ble endret.
- Bandit ga ingen høye treff, seks middels og 21 lave. De middels treffene
  gjelder faste stier inne i isolert Office-konvertering, tilsiktet
  serverbinding og oppdateringsoppslag mot en fast HTTPS-adresse. De er
  gjennomgått; scannerens tall er ikke en full sikkerhetsvurdering.

Kjøredata og detaljerte logger ligger lokalt i `build/security-20261128/`.

Rettelsene leveres som 1.1.17 for server/PC, samt tilhørende privat faneutgave.
Offentlige filer distribueres via GitHub; privat pakke distribueres bare via
den avtalte SMB-mappen. Publiseringsstatus og kontrollsummer føres i
`artifacts/security-review-2026-11-28.json` lokalt. Ingen oppdatering installeres
på demoen av denne gjennomgangen. Android-versjonen er uendret; mottaksvernet
gjelder også Android når den tilkoblede serveren oppdateres.

## Omfang og begrensninger

Dette er en avgrenset kode- og testgjennomgang, ikke en uavhengig
penetrasjonstest eller garanti mot innbrudd. Operativsystem, ruter, brannmur,
fysiske mobiltelefoner, skrivere og hele nettverket er ikke sikkerhetsrevidert.
Avhengighetskontrollen omfatter medfølgende server-/PC-Python og Caddy, ikke en
full revisjon av Androids biblioteker eller operativsystemets pakker. Systemd-
installasjon og omstart på fysisk ARM-maskin er ikke prøvd; ARM-kjøring bruker QEMU.
EHF-, bank- og PowerOffice-testene bruker kontrollerte leverandørsvar; de er
ikke reelle fakturasendinger, bankoppdrag eller overføringer av lønnsdata.
Demoens data og konfigurasjon er ikke endret. En lokalt rettet pakke endrer
ikke en allerede installert demoserver før den oppdateres.
Ved installasjon av den rettede pakken må både Salsy-server og tilhørende
Caddy-/HTTPS-tjeneste startes på nytt; konfigurasjonsreload alene bytter ikke
den kjørende Caddy-binærfilen. Rettelsene krever ingen endring av Caddyfile.

Statiske QR-/NFC-koder kan fortsatt kopieres. Innlogging og tilgang kontrolleres,
men koden alene er ikke bevis på fysisk tilstedeværelse. Logo i QR-koden endrer
ikke denne egenskapen.

Privat Hosting Manager deler servermotor og rettelser med offentlig server.
Privat kode, installasjonspakke, syntetiske kjøredata og testverktøy skal ikke
publiseres som offentlig kildekode.

## English

No authenticated access was obtained in the bounded, credential-free demo
checks. Large uploads now authenticate before body buffering, share an upload
budget and enforce body-read deadlines. Python and HTTPS build dependencies
are updated. These checks are limited in scope; installed servers must be
updated separately, and this review does not establish that all attacks are
impossible.
