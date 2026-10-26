# Salsy 0.78.0 – avdelinger og standardpassord ved reset

Bedriften kan opprette **Avdelinger** fra servervinduet eller lederlinjen i
PC-/PC-nettklienten. Velg et navn og en eksisterende aktiv brukerkonto som
avdelingsleder. Kontoen kan være uten ansattilknytning. Avdelingslederen er
underlagt bedriften og får kontroll over egen avdeling. Arbeidsforhold med
eksisterende arbeids-, kontrakts- eller lønnshistorikk beholdes i opprinnelig
avdeling når kontoen får ansvar for en ny.

- **Uten avdelinger fungerer Salsy som før.** Første opprettelse samler gamle
  moduldata i Hovedavdeling. Nye avdelinger får separate data i alle moduler,
  inkludert lønn, lager, fakturering, booking og regnskap.
- Øverste leder og bedriftsadministratorer kan velge avdeling. Tilgang på tvers
  kan også gis uttrykkelig under brukertilganger. **Alle avdelinger** gir en
  samlet oversikt; velg én avdeling for å arbeide med modulene og eksportere
  rapporter. Oversikten lager ikke automatisk en samlet MVA-melding/lønnskjøring.
- Brukernavn, bedriftsidentitet og klientkode er felles. Faktura- og
  kreditnotanumre følger én fortløpende nummerserie for bedriften.
- Avdelingsvalg finnes i PC, PC-nett, mobilnett, Warehouse-nett og innstillingene
  i begge Android-appene. Serveren kontrollerer tilgangen for hver forespørsel.
- **Reset passord** bruker et midlertidig standardpassord valgt av lederen.
  Brukeren må bytte det før andre funksjoner kan åpnes. Oppsettsadministratorens
  valg er reserve; andre administratorers egne valg gjelder bare deres reset.
  Aktive økter og mobilnøkler tilbakekalles ved relevante kontoendringer.
- Warehouse Android tømmer uferdige direkteordre ved utlogging/ny innlogging,
  slik at et utkast ikke følger med til en annen konto.
- Den vanlige serveren tillater én aktiv bedriftsserver per Linux-bruker.
  Flere separate bedriftsservere krever den private Hosting Manager. Gamle
  instansfiler slettes ikke. Avdelinger bruker samme server og trenger ikke
  egne porter eller klientkoder.

**Før du aktiverer avdelinger:** Oppdater serveren og klientene, og ta en
sikkerhetskopi. Første aktivering tar også en kryptert sikkerhetskopi i
`migration-backups` ved datafilen og oppgraderer dataformatet. Etter aktivering
krever datafilen **Server 0.78.0 eller nyere**. Eldre servere avviser filen.
Uten avdelinger beholdes tidligere filformat. Alle avdelinger følger med i
sikkerhetskopiering og gjenoppretting.

Installer nye DEB-filer over eksisterende pakker og start server/klienter på
nytt. Oppdater Android med APK-ene nedenfor. Bruksanvisningen er oppdatert.

Versjoner: Server/PC **0.78.0**, frittstående PRP **0.2.23**,
Salsy Android **0.31.3**, Warehouse Android **0.11.2**.

Kontrollert med 131 relevante automatiserte tester, avdelings- og kontoflyter
i native GUI og nettklienter fra ferdige DEB-pakker, kryptert gjenoppretting,
regnskapskjeder, pakkerevisjon, arkitekturparitet og APK-signaturkontroll.
ARM64-serveren er kjørt under QEMU med reell API-innlogging og avdelingskontroll.
Android-appene er bygget og signert, men ikke prøvd på fysisk telefon i denne
gjennomgangen. Fysisk Raspberry Pi er ikke testet.

Brukerstøtte: **support@salsy.eu**.

## English

Adds optional departments with server-enforced separation of all business
modules. Existing use remains unchanged until departments are explicitly
created. Department heads manage their own department; company administrators
can select departments or view an overview. Existing employment with work or
payroll history is retained in its original department. Overview mode is not
consolidated payroll or VAT reporting; select one department to use its modules.

First activation creates an encrypted pre-migration backup and upgrades the
vault format, requiring Server 0.78.0 or later. Update clients before activation.
Adds configurable temporary reset passwords with mandatory password changes.
All departments are included in company backups. Invoice numbering remains
company-wide. The standard launcher allows one active company server per Linux
user; multiple separate company servers require the private Hosting Manager.

Installers and documentation are public. Application source and the private
Hosting Manager package remain private. ARM64 was verified under QEMU;
physical Android devices and Raspberry Pi hardware were not tested.
