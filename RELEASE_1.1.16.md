# Salsy 1.1.16

28. november 2026. Salsy Android er fortsatt 1.0.5; Warehouse Android er fortsatt 0.11.9.

## QR-koder og 4 × 6 tommer lageretiketter

- Nye QR-koder registrert i lageret har Salsy-klokken i midten i rent svart/hvitt, med høy feilkorreksjon. Eksisterende koder beholder det opprinnelige QR-bildet ved visning og ny utskrift. Kodeinnhold, vareoppslag og strekkoder er uendret.
- I **Lager → Varer** kan leder velge **QR-etikett 4 × 6 tommer (PDF)**. I PC ligger valget under **Skriv ut / PDF**. Det blir én stående etikett på 101,6 × 152,4 mm per valgt vare, med stor QR-kode, **Salsy lager**, varenavn og varenummer. Skriv ut i faktisk størrelse / 100 %.
- Dagens A4-ark med 24 hylleetiketter beholdes. PC og PC-nett bruker samme API og etikettgenerator. PC lagrer og åpner PDF-en; nettleseren laster den ned.
- Bruksanvisningen og lagerveiledningen er oppdatert. Stemplingskodene og deres eksisterende utseende er beholdt.

Skanning er kontrollert digitalt ved 203 og 300 dpi, både for små A4-etiketter og store 4 × 6-etiketter. Fysisk skriver og Android-enhet er ikke testet.

## English

New warehouse QR registrations include the Salsy clock in pure black and white with high error correction. Existing codes retain their original plain artwork when viewed or reprinted. Desktop and desktop web add a portrait 4 × 6 inch product label, one per selected product, containing the QR, **Salsy lager**, product name and product number. Print at actual size / 100%. Existing A4 sheets, barcode output, scan values and product lookups are retained. Both clients use the shared server API.
