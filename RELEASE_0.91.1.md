# Salsy 0.91.1 – EHF og sikkerhetsgjennomgang

Utgivelsen inkluderer EHF-funksjonene som ble bygget lokalt i 0.91.0, med
rettelser etter gjennomgang av sending, tilgang, samtidighet og nettverksfeil.

PC og PC-nett får offisiell lokal UBL/CEN/Peppol-kontroll, XML-eksport og
dokumentert Recommand API v1-integrasjon. Norske bedriftskunder, NOK,
0192-adresser, faktura/kreditnota, rabatter og MVA-kategoriene S/Z/E/O støttes.
Kunderegisteret skiller Privatkunde og Bedriftskunde. eFaktura er kun klargjort.
Sending krever egen leverandøravtale og API-tilgang; Playground er standard.
Les [EHF-veiledningen](EHF.md).

## Rettelser

- Sendebekreftelsen bindes til test/produksjon og gjeldende leverandøroppsett.
  Ved endringer må fakturavinduet åpnes på nytt før sending.
- En kjørende innsending kan ikke låses opp manuelt. Ukjente utfall gjentas
  ikke automatisk. Diskfeil åpner heller ikke for gjentatt innsending.
- Leveringskvittering og fakturaens Sendt-status lagres atomisk og kryptert.
- Gamle statusforespørsler kan ikke overskrive bekreftet levering.
  Test og produksjon har adskilt historikk og tydelig visning i begge klienter.
- Ferdige testsendinger låser ikke usendte produksjonsfakturaer. Endrede
  testdata kan testes igjen; identiske tester lager ikke duplikater.
- Krediterte originaler kan ikke sendes som nye utsendinger. En allerede
  påbegynt sending stoppes ikke ved å opprette kreditnota.
- Avbrutte og ugyldige leverandørsvar håndteres uten feilaktig Sendt-status.
  Uventet bedrifts-ID eller leveringsstatus behandles som usikkert utfall.
- XML-kontroll og leverandørkall begrenses slik at køer ikke fyller serverens
  arbeidstråder.

Se [sikkerhetsgjennomgangen](SECURITY_REVIEW_2026-11-09.md) for avgrensninger.
Ingen ekte Peppol-produksjonssending er testet uten en leverandørkonto.

## Oppgradering

Ta backup, installer server og PC 0.91.1, start serveren på nytt og last nett
på nytt. Ingen avinstallasjon kreves. EHF-sending krever oppdatert PC/nettklient.
Java/Saxon er nye serveravhengigheter og installeres av APT sammen med DEB.
ARM64 har samme server-/nettkode. Privat Hosting Manager 0.91.1+hosting.1
beholdes lokalt. Andre appversjoner er uendret. Kasse er fortsatt en testutgave.

## English

0.91.1 publishes EHF features previously built locally as 0.91.0, plus security
and correctness fixes. PC and PC web share official offline UBL/CEN/Peppol
validation, XML export and a Recommand v1 integration. Live sending requires
the business's own agreement and API credentials. Scope: Norway, NOK, 0192
addresses and VAT categories S/Z/E/O. Consumer eFaktura remains preparation only.

Sending consent is bound to environment/provider revision; active submissions
cannot be unlocked. Receipt and sent state commit atomically. Unknown outcomes
and disk failures do not allow automatic replay. Stale polls cannot undo
delivery. Simulation and production history stay separate, completed tests
do not lock unsent invoices, and credited originals cannot be newly dispatched.
Malformed/truncated responses fail safely; concurrency is bounded.

Upgrade server and PC, restart and reload web clients. Java/Saxon are declared
server dependencies. Private Hosting Manager stays private. No live Peppol
production transmission has been tested. See the security review for limits.
