# Salsy 0.77.20 – sikkerhetsoppdatering / security update

Oppdater Salsy Server og PC-klienten til 0.77.20. Frittstående Salsy PRP er
oppdatert til 0.2.20. Android-appene er uendret i denne utgivelsen.

## Rettelser

- En innlogget bruker med delegert brukeradministrasjon kunne tildele større
  tilgang enn vedkommende selv hadde. Serveren begrenser nå opprettelse,
  tilgangsendringer, passordreset og deaktivering til administratorens egne
  rettigheter. Vanlige ansattkontoer og uinnloggede brukere hadde ikke denne
  brukeradministrasjonstilgangen. PC og web viser de tilsvarende begrensningene.
- Pillow oppdateres til 13.0.0 og certifi til 2026.10.23 for å ta med publiserte
  sikkerhetsrettelser. ARM64 og amd64 har samme avhengighetsversjoner.
- Medfølgende Caddy 2.11.7 bygges som `v2.11.7-salsy.1` med Go 1.26.10,
  chi 5.4.0 og x/net 0.60.0. Standardmodulene beholdes. Dette er et Salsy-bygg
  med oppdaterte avhengigheter, ikke en ny offisiell Caddy-versjon. Proveniens,
  Go-modullåser og tredjepartslisens følger med serverpakken.
- PC-klientens stemplings- og lønnsside leser nå skjemaverdier på GUI-tråden
  før nettverksarbeidet starter. Lønnsberegningene endres ikke.

## Ta oppdateringen i bruk

Ta sikkerhetskopi. Installer ny DEB over eksisterende versjon og start alle
Salsy-serverinstanser og PC-klienter på nytt. Start også **Salsys egen HTTPS-proxy**
på nytt dersom den brukes, slik at den nye Caddy-filen faktisk kjøres.
Andre tjenester som Apache eller Mailcow skal ikke erstattes.

Dependency-fix-scriptet bytter ikke bibliotekene som er pakket inne i gamle
Salsy-installasjoner; installer de nye DEB-filene. En administrator med full
tilgang kan gi delegerte administratorer de rettighetene de skal administrere.

Salsy bruker ikke PHP. De nylige PHP-feilene treffer derfor ikke Salsy direkte;
andre PHP-tjenester på samme maskin må oppdateres separat. Gjennomgangen er ikke
en garanti mot alle innbrudd eller en penetrasjonstest av produksjonsmaskinen.

## English

Install Salsy Server and PC client 0.77.20 and standalone PRP 0.2.20. Android
installers are unchanged. This release prevents delegated user administrators
from granting or taking over permissions outside their own scope, updates
Pillow/certifi and Caddy's embedded Go dependencies, and fixes desktop GUI thread
access during clock-punch and payroll loading. Payroll calculations are unchanged.

Back up first, upgrade the DEBs, and restart Salsy instances, clients and Salsy's
own HTTPS proxy. The dependency-fix helper alone does not replace bundled
libraries. Existing unrelated proxies and services must be preserved.

Sources: [PHP advisories](https://www.php.net/archive/2026.php),
[Pillow](https://github.com/python-pillow/Pillow/security/advisories/GHSA-24rc-8hj2-v98c),
[certifi](https://github.com/certifi/python-certifi/security/advisories/GHSA-6q48-6c7w-9gw2),
[Go security releases](https://go.dev/doc/devel/release),
[chi](https://github.com/go-chi/chi/security/advisories/GHSA-j6qf-3m9c-vwj3).
