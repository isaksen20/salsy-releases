# Sikkerhets- og feilgjennomgang 13.11.2026

Gjennomgangen bruker midlertidige bedrifter og en lokal testserver. Ingen
produksjonsserver, reelle ansatte, rutere, brannmur eller installerte tjenester
ble endret. Den omfatter innlogging, roller, avdelingsskille, nettgrensesnitt,
EHF-regresjoner, nye personal-/økonomifunksjoner og særlig stempling.

## Bekreftede feil som er rettet

- QR-leseren ventet uten tidsgrense på `video.play()`. Ved hengende videostart
  eller manglende kamerabilder tilbys nå ny oppstart. Avbrutte/mutede spor og
  bakgrunn håndteres, og sent mottatte kameratilganger stoppes etter avbrudd.
  En ny direkte knapp kan starte video etter at kameratilgang allerede er gitt.
- PC-nettklientens automatiske navigasjon kunne lukke en åpen kameraskanner.
  Bakgrunnsoppdateringen venter nå mens stemplingsdialogen er åpen.
- Manuell stempling godtok ikke-eksisterende lokal tid ved sommertid og endret
  i praksis klokkeslettet. UTC-tur/retur kontrolleres nå før lagring.
- To manuelle stemplinger på samme tidspunkt kunne få tilfeldig UUID-rekkefølge.
  Dette avvises før lagring. Historikken beholdes ved avvisning.
- Warehouse Android ventet på nett før lokal utlogging og manglet skjermkontroll
  av forsinkede svar. Privat tilstand ryddes nå straks, og svar fra en tidligere
  skjerm/innlogging forkastes.

## Nye øktregler etter brukerbestilling

Mobilvalg «Forbli innlogget»: absolutt ni timer fra innlogging. Verken aktivitet
eller fornyelse flytter sluttfristen. PC/PC-nett: tretti minutter uten faktisk
brukeraktivitet. Bakgrunnshenting og fornyelse opprettholder ikke inaktiv økt.
Et autentisert aktivitetsendepunkt brukes bare ved brukerinteraksjon; dette er
ikke bevis på fysisk tilstedeværelse. Serveren håndhever fristene uavhengig av
klientens klokke/timere. Tilbaketrekking av konto/passord sperrer fortsatt økter.

Økttoken blir i minnet, ikke i localStorage eller et varig påloggingslager.
Mobilnett har ikke automatisk gjenoppretting av økt etter sidelasting. Safari/OS
kan avslutte en side eller app i bakgrunnen, så ny innlogging kan bli nødvendig.
Serveren kan ikke pålitelig oppdage at en nettleserprosess er drept; en forlatt
serverøkt kan derfor stå i øktlisten fram til sin frist. Aktiv utlogging sperrer
den straks. Widget-legitimasjon på Android er separat og gir ikke hoved-API.

## Kontroller og resultater

- En faktisk Uvicorn-server og Chromium ble prøvd med anonym tilgang til alle
  dokumenterte API-operasjoner, også alternative API-stier, falske tokens og
  forfalskede proxy-/avdelingshoder. Den første runden omfattet 1062 ruteanrop;
  ingen beskyttede data ble hentet. Siste runde inkluderer det nye endepunktet.
- Nettleserkontroll med simulerte kameraavbrudd og faktiske videorammer/QR-leser
  bekrefter avvist/hengende avspilling, manglende bilder, bakgrunn, mute/unmute,
  forsinket tillatelse, avbryt og tillatelse nektet i begge nettklientene.
- Øktkontroll simulerer ni timers mobilbruk og tretti minutters PC-inaktivitet,
  ekte brukerinteraksjon og fornyelse. Native PC prøves med utløpt økt, private
  undervinduer og forsinkede svar. Enhetstester kontrollerer serverfrister.
- Python-avhengigheter kontrollert med pip-audit: ingen kjente sårbarheter i
  kontrollert miljø. Dette er et øyeblikksbilde, ikke en garanti for alle senere
  pakkeversjoner eller operativsystemets komponenter.
- Bandit meldte ingen høye treff. De middels treffene gjelder allerede isolert
  Office-konverterings midlertidige stier, tilsiktet serverbinding og et feiltreff
  på en lokal Treeview kalt «requests», ikke HTTP uten tidsgrense.
- EHF-testenes første feilsvar skyldtes at Java/Saxon ikke var tilgjengelig i
  det innledende kjøremiljøet. Med pakkens Saxon-oppsett besto alle 17 EHF-
  sikkerhetsregresjoner. En eldre testforventning for regnskapsførerdelegering
  ble oppdatert til den allerede vedtatte funksjonen; den gir ikke lederen
  automatisk lesetilgang til lønn.

Endelige logger og pakke-/publiseringsstatus føres i
`artifacts/security-release-0.95.3.json` lokalt. Privat hosting-kode/-pakke og
sikkerhetsrapportenes syntetiske kjøreartefakter publiseres ikke som kildekode.

## Begrensninger og videre kontroll

Dette er en avgrenset kode- og testgjennomgang, ikke en uavhengig penetrasjonstest.
Ingen fysisk iPhone/iPad, Android, ARM-maskin eller systemd-omstart ble testet.
Kamerafeil er reprodusert ved kontrollerte feiltilstander i Chromium; dette gir
ikke bevis for at alle Safari-/iOS-kombinasjoner virker. Test installert 0.95.3
på den aktuelle iPhonen, særlig etter skjermlås og bytte mellom apper.

En statisk NFC-/QR-kode kan kopieres. Innlogging, tilgang og kode må stemme, men
koden er ikke et sikkert bevis på fysisk oppmøte. Stempling endrer ikke lønn
uten lederens begrunnede godkjenning. Tilbakevendende klokkeslett ved overgang
til vintertid trenger fortsatt manuell kontroll; automatisk lønnstrekk på selve
omstillingsdagen er sperret.

Safari-bakgrunn: [WebKit om medieopptak og mute/unmute](https://webkit.org/blog/7763/a-closer-look-into-webrtc/).
Videostart: [Apples veiledning for video i Safari](https://developer.apple.com/documentation/webkit/delivering-video-content-for-safari).
Disse kildene beskriver nettleserkravene, ikke en bekreftelse på fysisk testing.
