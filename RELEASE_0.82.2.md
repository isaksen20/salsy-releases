Behovsplanleggeren i Salsy PRP er gjort større og mer oversiktlig.

- Nettvinduet fyller nesten hele nettleseren. Den separate Linux-appen åpner et større vindu tilpasset skjermen.
- Alle handlingsknapper er samlet i én kompakt rad øverst. På smale vinduer kan raden rulles sideveis.
- Dato, kompetansevalg og mindre hjelpetekst ligger rett under knappene. Grafen bruker resten av plassen.
- Tidsskalaen tilpasses vinduet for omtrent ti synlige timer. Minste linjeavstand beholdes på svært små skjermer. Klokkeslettet øverst bevares ved endring av størrelse så langt tidslinjens grenser tillater.
- Dagvisningen bruker hele tilgjengelige bredde. Dag-/ukesvisning, fast tidskolonne, kvartersintervaller, nattbehov, kopiering og oppdatering av enkeltsøyler er beholdt.

**Versjoner:** Salsy Server/PC 0.82.2, frittstående PRP 0.2.25. Android 0.32.0 og Warehouse Android 0.11.2 er uendrede pakker. Sikkerhetsrettelsene fra 0.82.1 er beholdt.

**Oppgradering:** Installer ny DEB over eksisterende pakke. Start serveren på nytt for oppdatert PRP-nettapp på `/app/prp/`, og last siden på nytt. Ingen ny Caddyfile eller nytt sertifikat kreves for denne visningsendringen. PRP-prosjekter og beregningsregler bruker samme format og motor. Den private Hosting Manager-pakken følger serverversjonen og distribueres bare lokalt.

**Kontroll:** Faktiske Linux- og nettlesertester dekker vindusstørrelser, tilgjengelige knapper, omtrent ti synlige timer, drahåndtak, nattbehov, kopiering, fast tidskolonne, uendrede søyler/rulleposisjon og PC/PC-nett-import. Ferdigpakkede installasjonsfiler kontrolleres også. ARM64 kontrolleres med QEMU; fysisk Raspberry Pi og faktisk systemd-oppstart er ikke testet i denne oppgaven.

English: PRP has a larger needs planner with a compact single-row toolbar, smaller help text and an adaptive vertical scale showing about ten hours. The web dialog nearly fills the browser; standalone PRP has the corresponding layout. Charts and unaffected bars remain in place during edits. Server/PC 0.82.2 and standalone PRP 0.2.25; planning rules and file formats are unchanged. Upgrade the DEB, restart the server and reload PRP. No new proxy configuration or certificate is needed for this layout update.
