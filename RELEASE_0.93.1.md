# Salsy 0.93.1 – Regnskapsfører

- Egen regnskapsførerrolle uten ansattilknytning, med samme portal i PC og PC-nett.
- Tomt tilgangsvalg ved oppretting/ny regnskapsførerrolle bruker standardtilgangene,
  kontrollert mot oppretterens tildelingsrett. Eksisterende fratakelser respekteres.
- Finansrapporter, lønnsgrunnlag, timer for én eller alle ansatte og lønnsslipper.
- Timelønn ved periodeslutt i ansatt-/timeoversikt og lønnsgrunnlag, også i CSV/Excel.
- Fra-/til-dato med gjeldende måned som standard; full eksport til CSV og Excel.
- Regnskapsfører kan laste opp PDF-lønnsslipp på den enkelte ansatte. Samme
  filvalidering, avdelingskontroll, krypterte lagring og duplikatregler som leder.
- Øvrige registreringer er lesbare/eksporterbare; rollen kan ikke endre lønn,
  timer, fakturaer eller bokføring. HR-/medisinske opplysninger er utelatt.
- Feil ved henting av rapport/tilganger vises etter innlogging, med ny prøve og
  utlogging tilgjengelig. Rapportfeil skal ikke kaste regnskapsføreren til innlogging.
- Leder/admin med brukeradministrasjon kan opprette og administrere regnskapsførere
  uten Økonomisk ansvar. Dette gir ikke lederen økonomiinnsyn, større
  administratorrettigheter eller tilgang til flere avdelinger.
- Tilgang på tvers av avdelinger krever eget valg. Felles API/beregningsmotor
  i offentlig server og privat Hosting Manager.

Les ACCOUNTANT.md for oppsett, rapportavgrensninger og dokumenthåndtering.
Timer er lønnsgrunnlag fra planer/godkjente ekstratimer, ikke verifisert oppmøte.
Skyggeregnskap og øvrige tidligere begrensninger videreføres.


Oppdater server og PC-klient til 0.93.1. Restart serveren og last
PC-nettklienten på nytt. Velg Regnskapsfører under Ansettelse → Brukere og
tilganger, eller i serverens Brukere-fane. PDF-opplasting har grense 5 MiB.

Salsy Android 0.35.1, Warehouse Android 0.11.2, PRP 0.2.27 og Kasse 0.1.2
videreføres uendret. Oppdatert PDF-bruksanvisning, regnskapsførerveiledning,
øvrige veiledninger, vilkår, kontrollsummer og dependency-fix følger utgivelsen.
Kasse er fortsatt kun for testing uten ekte betalinger. Tariffavtalenes
ufullstendig-status og tidligere dokumenterte begrensninger beholdes.

PC/nett og ferdige AMD64-pakker er testet med syntetiske data. ARM64 er testet
under QEMU; ingen fysisk ARM- eller mobilenhet eller ekte systemd-oppstart er
testet i denne utgivelsen. Privat Hosting Manager 0.93.1+hosting.1 er bygget og
kontrollert lokalt og publiseres ikke. Kildekoden forblir privat.
