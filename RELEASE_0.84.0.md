# Salsy 0.84.0 – tariffarbeid, oppgjør og PRP-kontroller

Dette er en delutgivelse av arbeidet som foreligger. **Flyoverenskomsten
(NHO Luftfart–Fellesforbundet) og Luftfartsoverenskomsten (NHO Luftfart–HK)
er fortsatt ufullstendige.** Egne kilder, utgaver, virkningsdatoer og konkret
gjenstående dekning vises i både Salsy og PRP. Kontrollerte enkeltregler betyr
ikke at hele avtalen er støttet. Ingen avtale erklæres komplett i denne utgaven.

- Tariffarbeidet omfatter egne lønnsgrunnlag, kvalifikasjoner og funksjonsytelser,
  overtids- og skiftvinduer, pauser, betalt hvile, fridager og pensjons- og
  forsikringsordninger. Fly- og HK-reglene holdes adskilt.
- Leder får kildebestemte tariffoppgjør med dokumentasjon, forhåndsberegning og
  bekreftelse: blant annet oppgavegodtgjørelser, reisetid og utgifter,
  velferds-/omsorgspermisjon, militærtjeneste, fond, fleksitid, tilfeldig skift,
  HK-fridager og generelle 2026-etterbetalinger. Oppgjør må velges og kontrolleres;
  de blir ikke alle aktivert automatisk når man velger en tariffavtale.
- Prosentbasert fagforeningstrekk har egne Fly/HK-vilkår, prioriteringer,
  delvis trekk og beskyttet trekkliste. Pensjonsinformasjon kan knyttes til
  en registrert ordning eller et dokumentert eksternt oppsett.
- Lagring fryser beregningsgrunnlaget. Kildeendringer, dobbeltregistrering og
  annullering av oppgjør som inngår i utstedte lønnsslipper kontrolleres.
  Betalt fri skilles fra faktisk arbeid; forsikringsdekning blir ikke lønn.
- PRP kan bruke en direkte tilstøtende plan som skrivebeskyttet kontrollgrunnlag
  for hvile og fridager. Planvilkår, kunngjøring og HK-dispensasjon har egne
  dokumentasjonsfelt. Kontrollvakter eksporteres ikke som nye vakter.
- PC og PC-nett bruker samme serverberegninger. Drift uten tariffavtale,
  lokale valg og begrunnet tvangsaktivering er beholdt. Tvangsaktivering
  innebærer ingen bekreftelse på full tariffdekning.

**Gjenstår:** Blant annet enkelte lønns-/ansiennitets- og arbeidstakergrupper,
fullstendig ferieoppgjør, historiske minstelønns-/gruppekorreksjoner,
helligdagsgodtgjørelse til avspasering og resterende kombinasjoner av
arbeidstid, hvile, pauser og fridagsrettigheter. Leverandørvilkår og faktiske
bedriftsavtaler må dokumenteres særskilt. Brukeren må kontrollere områder som
ikke er automatisert. Se [detaljert tariffstatus](AIRLINE_TARIFF_REVIEW.md).
Dette er ikke en ny modul for ansattes innsending av reiseregninger.

**Versjoner:** Server og PC 0.84.0, frittstående PRP 0.2.26. Android 0.32.0 og
Warehouse Android 0.11.2 følger som uendrede, signerte installasjonsfiler.
Server finnes for Debian 13 AMD64 og ARM64. Sikkerhetsrettelsene fra 0.82.1
og visningsforbedringene fra 0.82.2 er beholdt.

**Oppgradering:** Ta sikkerhetskopi. Installer ny server-DEB over eksisterende
pakke, og oppdater PC-klienten. Start serveren på nytt og last nettklienten
på nytt for oppdatert `/app/salsy/` og `/app/prp/`. Ingen ny Caddyfile eller
nytt sertifikat kreves for denne utgivelsen. Privat Hosting Manager følger
0.84.0 og oppbevares bare lokalt; den er ikke en offentlig nedlasting.

Bruksanvisning, PRP-veiledning, tariffstatus, SHA-256-kontrollsummer og
**Salsy-dependency-fix.sh** følger med. Hjelpefilen kan kontrollere og installere
systemavhengigheter for Debian 13; les DEPENDENCY_FIX.md før bruk. Den installerer
ikke Salsy og endrer ikke bedriftens data, porter eller proxyoppsett.

**Kontroll og begrensninger:** Kilde- og pakkebaserte beregnings-/API-tester,
faktiske PC- og nettleserflyter, privat serveradministrasjon, kildefil-/nøkkel-
kontroll og Debian-pakkekontroll brukes før publisering. ARM64 kontrolleres med
QEMU. Fysisk Raspberry Pi/Android og faktisk systemd-oppstart er ikke testet.

English: Partial release 0.84.0 (standalone PRP 0.2.26). Source-specific aviation
payroll settlements, deductions, pension information and planning controls are
included in desktop and desktop web. Both aviation agreements remain incomplete;
review the sources, remaining coverage, company evidence and local choices before
use. No-tariff operation remains available. Android installers are unchanged.
Back up, upgrade the server and PC DEBs, restart the server and reload web clients.
No new proxy configuration or certificate is required. Hosting Manager stays private.
