## Sikkerhetsoppdatering

- Retter avdelingsskillet ved tolkning av innloggingsheadere. Feilen krevde en innlogget avdelingsleder og kunne eksponere brukermetadata og øktoversikt for andre avdelinger, inkludert mulighet til å avslutte fremmede økter. Serveren bruker nå én Bearer-parser og kontrollerer at avdeling og autentisert konto stemmer.
- Widget-endepunktene krever samme standardiserte Bearer-format. Widgetnøkler gir fortsatt bare avgrenset mobiltilgang.
- dnspython oppdateres til 2.9.0 i server og PC-klient (CVE-2026-114605).
- Medfølgende Caddy bygges som **v2.11.7-salsy.2**, med x/net 0.62.0 og nødvendige Go-avhengigheter (GO-2026-6860 / GO-2026-6866). Standardmodulene og Go 1.26.10 beholdes. Nye binær-/låsefilhash er kontrollert for amd64 og ARM64.

### Resultat av lokale inntrengningsforsøk

En isolert testserver med syntetiske firma-/avdelingsdata ble startet. 762 anonyme forespørsler mot alle API-operasjoner og deres eldre adresser ga ingen beskyttede data eller godkjente endringer uten innlogging. De eneste 200-svarene var offentlig helse-/versjonsinformasjon. Mobil-, PC- og Warehouse-nettgrensesnittene krevde innlogging også med oppdiktede nettlesertokener. Øvrige tester dekket falske proxyheadere, selvoppgradering, andre ansattes ID-er, avgrensede PRP-/widgettokener, avsluttede økter, stiforsøk, store forespørsler, CORS, passordgjetting og faktisk HTTPS-proxy.

Python-avhengighetsskann hadde ingen kjente funn etter oppdatering. Caddys modul-/binærskann viser fortsatt varselet om avviklet OpenPGP (GO-2026-5932); kildekodens import-/kallgraf inneholder ingen berørte OpenPGP-pakker eller kall. Dette er dokumentert i **SECURITY_REVIEW_2026-10-31.md**, som følger server-/PC-pakken, og i oppdatert PDF-bruksanvisning. Dette er en lokal gjennomgang, ikke et bevis mot alle angrep eller en kontroll av produksjonens øvrige tjenester.

### Oppgradering

Installer **både server og PC-klient 0.82.1**. Nettklientene følger serverpakken. **Start Salsy-serveren og den aktuelle Salsy-administrerte Caddy-tjenesten på nytt** etter oppgraderingen. En konfigurasjons-reload erstatter ikke en allerede kjørende proxybinær. **Ny Caddyfile eller nytt sertifikat trengs ikke.** Ikke endre andre Caddy-, Apache- eller Mailcow-tjenester.

Privat Hosting Manager **0.82.1+hosting.1** bygges og testes lokalt; privat kode og pakke publiseres ikke. Android 0.32.0, Warehouse Android 0.11.2 og frittstående PRP 0.2.24 er uendret. ARM64 kontrolleres under QEMU; fysisk ARM, fysiske telefoner og faktisk systemd-oppstart inngår ikke i denne testen.

### English

Security release fixing authenticated cross-department account/session exposure caused by inconsistent Bearer parsing. Widget credentials now use the same explicit scheme. DNS/proxy dependencies are updated. Local HTTP, Chromium and HTTPS tests did not obtain protected company data without valid authentication. Install both server and PC 0.82.1 and restart the applicable server and Salsy-managed proxy processes; existing Caddyfiles and certificates remain valid. Private Hosting Manager is retained locally. See the bundled bilingual security report for scope and limitations.
