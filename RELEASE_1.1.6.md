# Salsy 1.1.6 – kameraveiledning og oppdateringsknapp i sidemargen

Oppdater Server og PC til 1.1.6, start serveren på nytt og last nettappene på nytt. Ingen ny Caddyfile kreves.

## Kameratilgang på mobil

Under **Innstillinger → Kamera → Tillat kamerabruk** åpnes en veiledning for Chrome på iPhone/iPad, Safari på iPhone/iPad og Chrome på Android. Du kan velge nettleser, lese trinnene og åpne offisiell hjelp fra Google eller Apple. Mobilnettklienten foreslår nettleser ut fra enheten; valget kan endres. Veiledningen finnes også i PC og PC-nett, på norsk og engelsk.

Å åpne veiledningen starter ikke kameraet og gir ikke automatisk tilgang. Nettleseren og telefonen bestemmer tillatelsen. Menynavn og tilgjengelige tillatelser kan variere mellom versjoner. Nettapper fra hjemskjermen kan prøves i vanlig nettleser hvis tillatelsen fortsatt etterspørres.

## Oppdater visning

↻ er flyttet til venstre sidemarg ved rollen og brukernavnet. Topplinjen over innholdet er fjernet. Dette gjelder PC og PC-nett. Regnskapsfører har knappen med sine øvrige toppknapper, siden denne visningen har eget grensesnitt uten sidemarg. Vern om ulagrede endringer og automatisk oppdatering ved trygge overganger beholdes.

## Kontroll

Syntetiske testdata brukes til kontroll av mobil-/PC-nett, vanlig ansattilgang, alle tre nettleserveiledninger, norsk/engelsk, telefonbredde, mørk modus, lukking/gjenåpning og at hjelpen ikke starter kameraet. Native PC, pakkede nettressurser, ARM64 med QEMU og den private serveradministrasjonen kontrolleres også. Fysisk iPhone/Android, Raspberry Pi og faktisk systemd-oppstart er ikke testet i denne runden.

Android og de separate appene beholder versjonsnumrene sine. Kameraets opptaks- og stemplingslogikk er uendret. Tariffenes ufullstendige kontrollstatus og Kasses teststatus beholdes. Hosting Manager publiseres ikke på GitHub.

## English

Settings now offers camera-permission instructions for Chrome on iPhone/iPad, Safari on iPhone/iPad and Chrome on Android, with official sources and Norwegian/English text. Opening help never starts the camera or changes permissions. Desktop refresh moves beside the user identity in the sidebar; the former top strip is removed. The accountant workspace keeps its refresh control among its top buttons. Private hosting administration remains excluded from GitHub.
