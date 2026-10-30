## Vaktbok med tre dager, permisjon og permittering

- PC-klienten og PC-nettklienten på `/app/salsy/` viser tre dager ved siden av hverandre: I går, I dag og I morgen. Pilene flytter én dag; andre datovinduer viser datoene. Dato kan skrives eller velges i kalenderen.
- Dobbeltklikk eller høyreklikk en ansatt, eller trykk på arbeidstiden i nettklienten, for kalenderens dagsvindu. Her brukes de samme rettighetene og handlingene som i kalenderen, inkludert forskjøvet vakt, redigering, sletting og fravær. Vanlige ansatte får bare åpne egne kalenderdetaljer.
- Statuser omfatter På jobb, Fri, Borte, Permittert og eksisterende ferie-, fraværs-, permisjons-, GS-, avspaserings- og OnCall-statuser. På jobb viser planlagt arbeidstid, ikke bekreftet innstempling. Private merknader og barnets navn vises ikke for kolleger.
- Leder kan registrere permittering som et datointervall og må velge Med lønn eller Uten lønn for hver periode. Permisjon med og uten lønn er tilgjengelig fra vaktbokens dagsvindu.
- Ubetalt permisjon og ubetalt permittering reduserer planlagte betalte vakttimer og tilhørende timetillegg i den felles lønnsmotoren. Ved fast månedslønn brukes eksisterende fordeling etter kalenderdager. Overlapp gir ikke dobbelt trekk. Betalt permittering beholder lønnsgrunnlaget.
- Arbeidsgiverperiodens lengde og delvis permittering beregnes ikke automatisk. Leder må registrere betalte og ubetalte perioder hver for seg. Ingen automatisk innsending til NAV/a-melding. Historiske lønnsslipper beholdes.

Installer både server og PC-klient 0.82.0. Nettklienten oppdateres med serveren; start serveren på nytt og last nettsiden på nytt etter oppgradering. Android 0.32.0, Warehouse 0.11.2 og den frittstående PRP-appen 0.2.24 er uendret.

Bruksanvisningens kapittel 3.4 og den medfølgende tospråklige `ROSTER.md` er oppdatert. Serveren finnes for Debian 13 amd64 og ARM64. Den private Hosting Manager 0.82.0+hosting.1 bygges og testes lokalt og publiseres ikke.

## Validation / English

Shared-server tests cover the three-day window, department isolation, private-note exclusion, calendar permissions, explicit pay selection, hourly and fixed-monthly payroll, supplements, changes/deletion, paid/unpaid leave and furlough. Native Tk and Chromium tests exercise navigation, shared calendar actions, furlough registration and translated web headings. Existing payroll, payslip, department, menu and displaced-shift checks remain in the validation set. Installers are checked for source-free packaging and matching server code across architectures. ARM64 is tested under QEMU; no physical Raspberry Pi or actual systemd reboot is tested for this release.

A roster's At work status means scheduled work. Furlough pay is explicitly selected by the manager for each whole-date period; employer-period duration and partial furlough are not automated.
