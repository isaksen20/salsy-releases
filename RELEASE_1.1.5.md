# Salsy 1.1.5 – oppdatering ved trygge overganger

Oppdater Server og PC-klienten til 1.1.5, start serveren på nytt og last PC-nettklienten på nytt. Ingen ny Caddyfile kreves.

Nye data tas i bruk ved fanebytte og når et vindu lukkes, dersom ingen andre vinduer eller ulagrede redigeringer på den underliggende siden hindrer dette. Veivisere, valgte PDF-filer og pågående skjemaer bevares under bakgrunnshenting. En dialog som erstattes av en ny dialog utløser ikke oppdatering av siden bak. Knappen ↻ beholdes for manuell oppdatering med bekreftelse.

PC-klienten beholder valgt underfane ved oppdatering. PC-nettklienten henter også endringer siden siste periodiske kontroll når en dialog lukkes. Dialoger, redigering og en pågående sideinnlasting stopper slik automatisk nytegning.

Kontrollert med syntetiske bedriftsdata i Chrome og native Linux GUI: faktisk stoffkartotekutkast med valgt PDF, lukking og erstatning av dialoger, underliggende ulagret tekst, fanebytte og oppdatert vaktbok fra serveren. Private serverflyter og installasjonspakker kontrolleres separat. Fysisk telefon, Raspberry Pi og faktisk systemd-oppstart er ikke testet i denne runden.

Android og separate apper beholder sine tidligere versjoner. Tariffenes ufullstendige kontrollstatus og Kasses teststatus beholdes. Hosting Manager bygges lokalt og publiseres ikke på GitHub.

## English

Desktop PC and desktop web apply fresh data at safe transitions, including tab navigation and dialog closure. Open editors, wizard steps and unrelated page drafts prevent automatic redraws. The manual circular-arrow refresh remains available. Private Hosting Manager packages are excluded from GitHub.
