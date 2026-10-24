# Salsy 0.77.20 – sikkerhetsoppdatering

Anbefalt oppdatering for Salsy Server og PC-klienten. Frittstående Salsy PRP
oppdateres til 0.2.20. Begge Android-installasjonsfilene er uendret.

- Hindrer delegerte brukeradministratorer i å gi seg selv større tilgang eller
  overta kontoer med større rettigheter gjennom passordreset.
- Oppdaterer Pillow til 13.0.0 og certifi til 2026.10.23.
- Oppdaterer medfølgende Caddy til Salsy-bygget `v2.11.7-salsy.1`, med Go 1.26.10,
  chi 5.4.0 og x/net 0.60.0. Standardmoduler og tredjepartslisenser beholdes.
- Retter GUI-trådfeil ved lasting av stemplinger og lønnsestimat i PC-klienten.
  Lønnsberegningene er uendret.

Ta sikkerhetskopi og installer riktig DEB over eksisterende versjon. Start alle
Salsy-serverinstanser og PC-klienter på nytt etter oppdateringen. **Start også
Salsys egen HTTPS-proxy på nytt**, slik at oppdatert Caddy tas i bruk. Andre
tjenester som Apache og Mailcow skal beholdes.

Les [sikkerhetsinformasjonen](https://github.com/isaksen20/salsy-releases/releases/download/v0.77.20/SECURITY_UPDATE_0.77.20.md)
og [bruksanvisningen (PDF)](https://github.com/isaksen20/salsy-releases/releases/download/v0.77.20/Salsy-bruksanvisning.pdf).
Installasjonsfiler, dependency-fix-hjelper, veiledninger og sjekksummer følger med.
Dependency-fix-hjelperen erstatter ikke bibliotekene inne i gamle Salsy-DEB-er.

Salsy bruker ikke PHP. PHP-tjenester som eventuelt kjører på samme maskin må
oppdateres separat. Gjennomgangen erstatter ikke en uavhengig penetrasjonstest.

Testet med API-/rettighetstester, web- og native GUI-tester, pakketesting, kjøring
av ARM64-serveren under QEMU og sårbarhetskontroll av medfølgende biblioteker.
Installasjonsfilene er offentlige; Salsys kildekode forblir privat.

## English

Recommended security update for Server/PC 0.77.20 and standalone PRP 0.2.20.
Prevents delegated account administrators from exceeding their permissions,
updates bundled security dependencies, and fixes desktop GUI thread access.
Android installers and payroll calculations are unchanged. Back up, upgrade the
DEBs, and restart Salsy instances, clients and Salsy's own HTTPS proxy.
