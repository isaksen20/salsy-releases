# Salsy dependency fix

## Norsk

`dist/Salsy dependency fix.sh` installerer systemavhengighetene til Salsy Server
på Debian 13, både AMD64 og ARM64. Raspberry Pi må bruke et 64-bits operativsystem.
Du trenger internettilgang og administratorrettigheter.
På GitHub heter den samme filen `Salsy-dependency-fix.sh`. Bruk det filnavnet
i kommandoene nedenfor hvis du har lastet den ned derfra.

Høyreklikk filen og velg «Kjør i terminal», eller åpne en terminal i mappen og kjør:

```sh
sh "Salsy dependency fix.sh" --install
```

Oppgi ditt Linux-administratorpassord når du blir spurt. Passordet vises ikke og
lagres ikke av hjelpefilen. På en minimal installasjon uten `sudo` brukes `su`,
som spør etter root-passordet. Når filen startes fra filbehandleren, forsøker den
å åpne en terminal automatisk. Filbehandleren kan kreve at du først gir filen
tillatelse til å kjøres som program.

Filen oppdaterer APT-pakkelisten og installerer avhengighetene, inkludert reparasjon
av manglende avhengigheter etter en avbrutt pakkeinstallasjon. Den tillater ikke
at APT fjerner pakker under reparasjonen. Feil fra APT vises i terminalen.
Python-bibliotekene og Caddy følger med Salsy Server sin DEB-pakke; hjelpefilen
installerer ikke selve Salsy, endrer ikke pakkekilder og kjører ingen `pip`-kommandoer.
Den endrer ikke Salsy sine bedriftsdata, porter eller proxyinnstillinger.
Vanlige installasjonsskript fra Debian-pakkene kan starte systemtjenester.

For kun å kontrollere avhengighetene uten installasjon eller passord:

```sh
sh "Salsy dependency fix.sh" --check
```

Avhengighetene er Python 3.13, `python3-tk`, `libc6` ≥ 2.41, `libgcc-s1`,
`libstdc++6`, `sudo`, `systemd`, `nftables`, `passwd` og `ca-certificates`.
Hjelpefilen gjelder dagens Salsy Server-pakker for Debian 13; den oppgraderer
ikke eldre Debian-utgaver til Debian 13. Samme hjelpefil kan brukes for den
offentlige serveren og den private serveradministrasjonens felles serveravhengigheter.

## English

`dist/Salsy dependency fix.sh` installs Salsy Server's system dependencies on
Debian 13 for AMD64 and ARM64. Raspberry Pi requires a 64-bit operating system.
Internet access and administrator privileges are required.
On GitHub the identical helper is named `Salsy-dependency-fix.sh`; use that
filename in the commands when downloading from GitHub.

Right-click the file and choose “Run in Terminal”, or open a terminal in its
folder and run `sh "Salsy dependency fix.sh" --install`. Enter your Linux
administrator password when prompted; the helper does not display or store it.
On minimal systems without `sudo`, `su` asks for the root password instead.
Use `--check` for a read-only dependency check without administrator privileges.

The helper refreshes APT package lists and installs dependencies, including
repair of missing dependencies after an interrupted package installation.
APT is not allowed to remove packages. Errors remain visible in the terminal.
Salsy itself, its Python libraries, and Caddy are supplied by the Salsy Server
DEB. The helper does not install Salsy, modify APT sources, run pip, or modify
Salsy company data, ports, or proxy configuration. Debian package installation
scripts may start system services. It does not upgrade older Debian releases.
The same helper covers the common server dependencies of both public and
private server editions.
