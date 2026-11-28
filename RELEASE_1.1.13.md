# Salsy 1.1.13

Utgitt 28. november 2026. Server og PC oppdateres til 1.1.13, Android til 1.0.3.

## Utbetalingsdato og skjæringsdato

- Utbetaling på lørdag, søndag, norsk helligdag eller julaften flyttes automatisk til siste bankdag før.
- Skjæringsdatoen flyttes like mange kalenderdager bakover, og videre til siste virkedag hvis den selv havner på en fridag.
- Eksempel: vanlig utbetaling 20. desember 2026 flyttes til fredag 18. desember. Vanlig skjæringsdato 18 blir onsdag 16. desember. Neste opptjeningsperiode begynner 17. desember.
- Opptjeningsperiodene følger hverandre gjennom korte måneder, skuddår og årsskifter. Allerede utstedte lønnsslipper beholder lagrede perioder, og neste periode tar hensyn til forrige utstedte periode.
- En manuelt valgt utbetalingsdato på en fridag justeres også før forhåndsvisning og generering. Den faktiske datoen vises i forhåndsvisningen.
- Hvis datoen flyttes til måneden før, beholdes valgt lønnsmåned. Skatt og opptjeningsår bruker faktisk utbetalingsdato. Oppsettet for den opprinnelige lønnsmåneden låses når lønnsslippen utstedes.
- Faktisk utbetalingsdato vises også i lønnsoversikten på mobil og Android.

Kalenderen følger [Norges Banks oppgjørsdager](https://www.norges-bank.no/tema/Norges-Banks-oppgjorssystem/Oppgjorsdager/), kontrollert 27.11.2026. Dette beregner datoer; det oppretter ikke en bankoverføring.

## PDF med total før skatt

Hver ansatts side viser **TOTALT FØR SKATT** øverst med stor, fet skrift. Det gjelder også fortsettelsessider. Totalen er lønn og tillegg for den enkelte ansatte før skatt. Refusjoner vises separat fra bruttobeløpet. Ansatte starter fortsatt på hver sin side; datoer, arbeidstid, tillegg og summer beholdes i dagsoversikten. Skatt og endelig netto beregnes ved lønnskjøring.

## Oppdatering og kontroll

Ta sikkerhetskopi før serveroppdatering, installer 1.1.13 og start serveren på nytt. Oppdater PC-klienten og Android-appen for visning av de nye datoopplysningene. Oppdaterte bruksanvisninger følger med. Ingen ny Caddyfile kreves av disse endringene.

Beregninger, datooverganger, rettigheter og PDF er kontrollert med syntetiske data, og de berørte arbeidsflytene er prøvd i nettleser og native PC-klient. De ferdige installasjonspakkene kontrolleres før publisering. ARM testes med emulering; fysisk ARM, Android og systemd-oppstart er ikke testet i denne runden.

Hosting Manager bygges og kontrolleres separat og inngår ikke i den offentlige utgivelsen. Tariffavtalenes eksisterende kontrollstatus og merking av ufullstendig dekning beholdes. Salsy Kasse er fortsatt under utvikling.
