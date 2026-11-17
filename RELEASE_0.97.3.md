# Salsy 0.97.3

- Automatisk passnøkkelstart i mobilnett, PC-/regnskapsførernett og Warehouse når enheten husker en lokalt registrert/tidligere brukt nøkkel og konto/klientkode.
- Utløpt økt starter ny autentisering. Egen utlogging, avbrudd og passordreserve er håndtert uten automatisk løkke. Eldre passnøkkeloppsett krever én manuell passnøkkelinnlogging etter oppgradering.
- Android 0.36.3 og Warehouse 0.11.6 starter aktivert biometri automatisk ved oppstart og reautentisering. Private forespørsler med HTTP 401 skilles fra manglende rettighet og nettverksfeil. Ulagrede handlinger sendes ikke automatisk på nytt.
- Android-appene viser oppdateringssjekk og direkte offisiell APK-nedlasting i Innstillinger. Ingen stille installasjon; ingen konto- eller bedriftsdata i sjekken.
- Ni timers absolutt grense for beholdte mobiløkter og PC-nettets 30 minutters inaktivitet gjelder fortsatt. Linux PC bruker fortsatt passordinnlogging og kan åpne nettklienten for passnøkkel.
- Hosting Manager 0.97.3+hosting.1 følger serveren og bygges kun lokalt i dist/private.
- Tariffstatus er uendret. Eksisterende ufullstendige avtaler fremstilles ikke som ferdige.

Fysisk Android-biometri og Safari/iPhone må kontrolleres på faktisk enhet; nettleseren kan kreve brukertrykk selv om automatisk start forsøkes.

Denne utgivelsen inkluderer også arbeidet som tidligere bare var bygget lokalt:
- Vaktbok med dag-, tredagers- og ukevisning i PC og PC-nett.
- Alle med Administrator/leder- eller IT-rolle og brukeradministrasjon kan dele ordinære ansattilganger. Regnskapsførertilgangene beholdes for regnskapsførerrollen. Stoffkartotek kan leses på mobil/Android når modulen er aktivert.
- Import/eksport av stoffkartotek i .sdb-format med original PDF og registrerte opplysninger. Forhåndsvisning og bekreftelse ved import, avdelingsgrenser, identiske duplikater hoppes over og eksisterende produkter overskrives ikke. 48 produktikoner.

User-provided product PDFs and converted SDB files are not included in the public release. Private Hosting Manager code/packages remain local.
