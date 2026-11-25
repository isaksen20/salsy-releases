# Salsy 1.1.10 – avtalesignering og passordbekreftelse

Oppdater Server og PC til **1.1.10** og Salsy Android til **1.0.1**. Start serveren på nytt og last nettappene på nytt. Ingen ny Caddyfile kreves. Android bruker samme offisielle signeringsnøkkel og en høyere versjonskode enn 0.41.0, slik at den kan oppdateres uten å avinstallere appen.

## Android 1.0.1 – logo uten hvit bakgrunn

Android-oppdatering 25.11.2026: logoen i topplinjen og sidemenyen bruker nå gjennomsiktig bakgrunn med en tynn hvit kontur rundt bokstavene og symbolet. Originalfargene beholdes. Dette følger den godkjente forhåndsvisningen. Server og PC er uendret på 1.1.10; bare Android-appen må oppdateres for denne visuelle rettelsen. Android 1.0.1 bruker samme offisielle signeringsnøkkel og høyere versjonskode enn 1.0.0, slik at den kan installeres over eksisterende app. Android 1.0.0 beholdes som tidligere nedlasting.

## Arbeidsavtaler og taushetserklæringer

Begge parter signerer med sitt personlige kontopassord og uttrykkelig bekreftelse. Nye dokumenter sendes til signering fra Ansettelse → Kontrakter. Den ansatte får et varsel over kalenderen når egne dokumenter venter på signatur. Varslet åpner dokumentlisten direkte, og forsvinner når den ansatte har signert. Signerte dokumenter og signaturspor beholdes under Personalia, med PDF-eksport. Varslet viser aldri dokumenter for en annen ansatt som er valgt i kalenderen. Nettklientene og Android oppdaterer antallet i bakgrunnen uten å tegne kalenderen eller pågående skjema på nytt.

**Last opp eldre avtale (PDF)** støtter både arbeidsavtaler og taushetserklæringer, maksimalt 5 MiB. Originalfilen beholdes uendret. Begge parter signerer en registreringsbekreftelse på at de er kjent med at avtalen er lagt inn i Salsy. Bekreftelsen endrer ikke originalavtalen og dokumenterer ikke når originalen ble signert. Den er bundet til originalfilens SHA-256 og partenes publiserte opplysninger. Originalen og bekreftelsen med signaturspor lastes ned hver for seg. Signering er autentisert elektronisk aksept/bekreftelse i Salsy, ikke BankID eller kvalifisert elektronisk signatur.

## Avslutning av arbeidsforhold

**Avslutt arbeidsforhold** krever lederens eget passord før noe endres. Feil eller manglende passord avslutter ikke arbeidsforholdet og tilbakekaller ikke ansattes økter. Gjentatte feil begrenses. Ansattredigering kan ikke omgå bekreftelsen ved å sette arbeidsforholdet inaktivt. PC-programmet velger aktive ansatte ved redigering, slik at avslutning av siste aktive arbeidsforhold ikke gir en feil ved etterfølgende oppdatering. Historikken beholdes under avsluttede arbeidsforhold.

Server og PC må oppdateres sammen: eldre PC-klienter kan ikke avslutte arbeidsforhold uten det nye passordfeltet. Tidligere vakter, arbeidstid og lønnsberegninger beholdes.

## Kontroll og avgrensninger

Kontrollene bruker syntetiske data og dekker begge dokumenttyper, begge signeringsrekkefølger, feil/manglende passord og samtykke, innholdslås, originalfilens kontrollsum, PDF-eksport, egne dokumenter, avdelingsskille, norske/engelske varsler, passordbeskyttet avslutning og tilbakekalling av økter. Native PC, PC-nett og mobilnett er prøvd med opplasting og signering. Android kompileres og enhetstestes. Installerte/pakkede moduler, ARM64 under emulering og privat serveradministrasjon kontrolleres før publisering. Fysisk Android/iPhone/Raspberry Pi og faktisk systemd-oppstart er ikke testet.

Tariffavtalenes ufullstendige kontrollstatus og Kasses teststatus beholdes. Hosting Manager publiseres ikke på GitHub.

## English

Server/PC 1.1.10 and Android 1.0.0 add own-document signing notices above the calendar and upload of earlier employment/confidentiality agreements as unchanged PDFs. Both parties use their own passwords to acknowledge registration, bound to the original file hash. The original and the acknowledgement/signature record can be downloaded separately; signed documents remain in Personal details. Ending employment now requires the manager's own password and cannot be bypassed through ordinary employee editing. Failed confirmation leaves employment and employee sessions unchanged. This is authenticated acceptance/acknowledgement in Salsy, not BankID or a qualified electronic signature. Android retains the official signing key and increases its version code. Private Hosting Manager installers remain excluded from GitHub.

Android 1.0.1 visual update: replaces the white logo panel with transparent artwork and a thin white contour in the header and side menu, preserving the original colours. Server/PC remain at 1.1.10. The official signing key is retained and the version code increases; the previous 1.0.0 APK remains available.
