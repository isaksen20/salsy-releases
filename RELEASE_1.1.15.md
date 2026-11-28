# Salsy 1.1.15

28. november 2026. Salsy Android 1.0.5 følger med.

## Stempling på 4 × 6 tommer etikett

- Ny knapp **Etikett 4 × 6 tommer (PDF)** i plasseringens QR-vindu i PC, PC-nett og Android. Dagens A4-utskrift beholdes.
- Stående etikett på 101,6 × 152,4 mm, med stor QR-kode øverst og bare **Salsy stempling** og plasseringens navn under. Fet, svart tekst og vektorbasert QR gjør utskriften egnet for enkle etikettskrivere. Lange navn deles over flere linjer.
- Nye stemplingskoder har Salsy-klokken i midten, i rent svart/hvitt og med høy feilkorreksjon. Eksisterende QR-koder beholdes uendret, også ved ny utskrift. Navneendring eller valg av etikettformat bytter ikke kode eller legger til ikon.
- Skriv ut i **faktisk størrelse / 100 %**. Etiketten bruker plasseringens eksisterende kode; tidligere QR-utskrifter og NFC-brikker virker fortsatt. Tilgangskontroll og avdelingsavgrensning er uendret.

## Rettelse av NFC i nettklientene

En udefinert variabel i NFC-leserens lagringsmelding kunne avbryte stemplingen etter at brikken var lest. Dette er rettet i den felles leseren for mobilnett og PC-nett.

Bruksanvisningen er oppdatert. Skanning av etikettens PDF er kontrollert ved 203 og 300 dpi, og lagring er kontrollert i PC og PC-nett. Fysisk etikettskriver og Android-enhet er ikke testet.

Eksisterende tariffdekning og kontrollstatus beholdes. Utgivelsen endrer ingen lønnsberegninger.

## English

Adds a portrait 4 × 6 inch clock-location label alongside the existing A4 PDF in desktop, desktop web and Android. The label contains a large vector QR, **Salsy stempling** and the location name in bold black text. Print at actual size / 100%. New clock credentials include the Salsy clock icon in pure black and white with high error correction. Existing codes retain their original artwork, including on reprint. Existing credentials and access rules are retained. Also fixes an undefined NFC saving-message variable that could prevent web clock punches from being submitted.
