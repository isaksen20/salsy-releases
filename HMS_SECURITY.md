# HMS 1.0.0 – sikkerhet og personvern ved oppsett

Kontrollgrunnlag 19.11.2026: automatiske funksjons-/tilgangstester, reelle PC-/nettgrensesnitt og kontroll av kompilerte pakker. Dette er utviklerens kontroll, ikke uavhengig sertifisering eller garanti mot alle angrep. Full testprotokoll oppbevares lokalt i prosjektet.

- All lagring følger Salsys eksisterende krypterte bedriftslager. Ordinær HMS er avdelingspartisjonert. Filnedlasting, koblinger og eksport kontrolleres i backend.
- Ordinære avvik og fortrolige varslingssaker er separate. Varslingskanalen er avslått ved installasjon. Bedriften må dokumentere egne rutiner før aktivering.
- Varsling er identifisert og konfidensiell; det finnes ingen anonym innsending. Ikke presenter innlogging, IP-adresse, PDF-vedlegg, serverlogger eller sikkerhetskopier som anonyme.
- Ingen automatisk saksrett for administrator, leder eller HMS-ansvarlig. Mottakere velges uttrykkelig per sak. Endret standardoppsett gir ikke tilgang til gamle saker. Bare en habil eksisterende saksbehandler kan endre sakens mottakere.
- Mottaker bekrefter eget passord og habilitet før innsyn, maksimalt ti minutter per økt og sak. Feilpassord begrenses. Fratredelse fjerner innsyn. Nye mottakere må vurderes etter bedriftens rutine.
- Interne saksnotater og konklusjoner deles ikke med rapportøren. Varslingssaker finnes ikke i vanlig Hendelser, søkbar ordinær endringslogg, generell HMS-eksport eller vanlige pushvarsler. Kontroller den private innboksen regelmessig etter bedriftens rutine.
- Sikker kommunikasjon forutsetter HTTPS på den offentlige adressen, oppdaterte klienter, personlige kontoer og sikret telefon/PC. Bruk ikke delte kontoer til signering eller saksbehandling.
- Tekniske saksrettigheter beskytter ikke mot en angriper som kontrollerer operativsystemet, krypteringsnøkkelen, en mottakerkonto eller sikkerhetskopiene. Driftstilgang og gjenoppretting må begrenses og loggføres etter bedriftens rutine.
- Undersøkelsessvar er pseudonymiserte og holdes utenfor vanlige revisjonskopier. Ingen individuell ledervisning, fritekstsvar, bakgrunnsvariabler eller løpende smågruppefilter tilbys. Gruppe og spørsmål låses ved åpning, samlede resultater ved lukking. Minst fem svar per spørsmål er et produktvern, ikke en garanti for anonymitet eller en universell lovgrense.
- Vedlegg begrenses i størrelse, antall, innhold, oppløsning og samtidige opplastinger. Bilder optimaliseres uten metadata/GPS. PDF valideres gjennom den eksisterende begrensede PDF-behandlingen, men metadata fjernes ikke. Ikke last opp mer personinformasjon enn nødvendig.
- Definer lovlig formål, tilgang, gjennomgang og oppbevaring per kategori. Lukking og arkivering er ikke sletting. Bevaringssperrer og aktive sammenhenger må avklares før sletting.
- Kontrollert sletting fjerner aktive data og tilhørende filer/historikk/revisjonskopier. Eksporter og gamle sikkerhetskopier må håndteres separat. Etter gjenoppretting må senere slettebeslutninger gjennomføres igjen.

Les også HMS.md og de daterte myndighetskildene under Rapporter og oppsett. Ved alvorlig arbeidsulykke erstatter intern registrering aldri nødvendige eksterne varsler.
