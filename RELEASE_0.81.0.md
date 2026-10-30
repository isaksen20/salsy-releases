# Salsy 0.81.0 – forskjøvet vakt og pluss/minus i timebank

Leder/admin kan nå velge **Forskjøvet vakt** fra kalenderens dagsdetaljer eller
høyreklikkmeny i både PC-klienten og PC-nettklienten **/app/salsy/**.

- Velg ny dato (kan være samme dato), start og slutt. `1530` og `15:30` støttes.
- Velg med/uten kompensasjon og om forskjellen i betalt tid skal føres i timebank.
  Både positive og negative forskjeller støttes, inkludert negativ bankbeholdning.
- Forhåndsvis opprinnelig/ny betalt tid, bankføring, tilgjengelig bank etter
  endringen, valgt tariff og kompensasjonsminutter/prosent før lagring.
- Konfigurer forskyvningsregler i **Tariffavtale → Avtaler → Rediger**: bruk
  avtalens overtidssatser eller egne prosenter, velg tid utenfor originalen eller
  hele den nye vakten, avrunding og egne dato-/ukedags-/tids-/helligdagsregler.
  Høyeste passende sats brukes. Manglende oppsett sperrer «med kompensasjon».
- Ingen tariffregel antas ut fra navnet eller kopieres fra Flyoverenskomsten
  til andre avtaler. Leder vurderer varsel, lokalt samtykke og øvrige vilkår.
  Ytelser utenfor prosentreglene må registreres som kontrollerte tillegg.
- Ved ubetalt matpause og kompensasjon må pausens start angis, slik at riktig
  prosent reduseres. Pausetrekk gjelder ikke vakter kortere enn 5,5 timer.
- Original vakt og valgt tariffversjon beholdes. Gjentatt redigering sammenligner
  med originalen og dobbeltteller ikke bank. **Tilbakestill forskyvning** tilbakefører
  vakt, bank og kompensasjon samlet. Historikken beholdes.
- Med bankføring beholdes opprinnelig betalt tid som grunnlønn; uten bankføring
  betales ny betalt tid. Fast månedslønn følger eksisterende månedslønnsberegning.
  Kompensasjonen vises som eget tillegg i estimat, CSV/Excel og generert lønnsslipp.
  Kompensasjon skaper ikke ekstra arbeidstimer eller lovovertid.
- Ny plan, vanlig redigering/sletting eller vaktbytte kan ikke overskrive en aktiv
  forskyvning. Avklar aktive fravær/avspasering, GS, OnCall, vaktbytter og genererte
  lønnsslipper først. Ved datoflytting må tilknyttede tillegg avklares. Splittdager
  med felles matpauseregel må avklares i skiftplanen før forskyvning. Ordinære
  nattevakter må fortsatt deles ved midnatt.
- Avdelingsgrenser, samtidighetskontroll, forsøk på nytt etter nettverksbrudd og
  kryptert backup gjelder også forskyvningene.

Oppdater **Salsy Server og PC til 0.81.0**, og start serveren på nytt.
Ta backup før installasjon. Installer DEB over eksisterende utgave.
**Android 0.32.0, Warehouse Android 0.11.2 og frittstående PRP 0.2.24 er uendrede
installasjonsfiler.** Mobilkalenderen viser gjeldende forskjøvet vakt fra serveren;
selve forskyvningen administreres i PC og PC-nett.

Bruksanvisningen (Kalender) er oppdatert. Norsk/engelsk **DISPLACED_SHIFTS.md**
følger med server- og PC-pakken. Den private Hosting Manager bruker samme motor,
bygges samtidig og beholdes bare lokalt.

Kontrollert med syntetiske data: lønn/bank/kompensasjon, frysing av tariffversjon,
revisjon og gjentakelser, avdelinger, backup/gjenoppretting, estimat/eksport/lønnsslipp,
native PC-GUI og PC-nettets tariff-/kalenderflyt på norsk/engelsk. Ferdige offentlige
pakker, privat tobedrifts-GUI og ARM64 under QEMU kontrolleres også. Fysisk Raspberry
Pi og faktisk systemd-oppstart er ikke testet; denne utgaven endrer ikke mobilbygg.

Brukerstøtte: **support@salsy.eu**.

## English

Adds calendar shift displacement in native PC and PC-web, with a new date/time,
explicit compensation choice, signed time-bank difference, server preview and
restore. Agreement rules are configured explicitly: overtime rates or custom
percentages, outside-original/whole-shift basis, rounding and dated time/day/holiday
windows. The original shift and agreement version are retained. Unsupported
benefits and eligibility conditions require managerial review; no agreement's
rules are automatically presumed for another agreement.

Banking retains original base paid time and credits/debits the difference.
Compensation appears in estimates, CSV/Excel exports and generated payslips without
creating overtime work. An unpaid break requires its start when compensated.
Protected dependencies and immutable generated payslips must be resolved first.
Displacements are department-isolated and included in encrypted backups.

Update Server/PC to 0.81.0. Android, Warehouse and standalone PRP installers are
unchanged. ARM64 is tested in QEMU, not on a physical Raspberry Pi. Actual systemd
boot is not exercised by these tests. Private Hosting Manager remains local.
