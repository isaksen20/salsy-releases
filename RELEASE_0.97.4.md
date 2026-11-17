# Salsy 0.97.4

Aktive innlogginger viser nå brukernavnet til hver økt under Innstillinger i PC og PC-nett. Serveren løser bruker-ID til brukernavn uten å utvide eksisterende tilgang eller avdelingssynlighet. Kontoer uten ansattilknytning, inkludert IT-ansvarlige, identifiseres med brukernavnet sitt.

Oversikten i PC-programmet viser de samme fem kolonnene som PC-nettklienten og lar autoriserte brukere avslutte en valgt økt. Øktlisten hentes fersk ved åpning/oppdatering i begge klienter. Innlogging, passnøkler og utløpstider er uendret.

## English

Active sessions in PC and PC web Settings now include the account username. Names are resolved inside the existing account and department scope, including accounts with no linked employee. Both clients show username, device, platform, creation time and last use, and allow authorized users to revoke a selected session. Session lists are fetched fresh instead of cached for ten minutes. Authentication and session lifetimes are unchanged.

The private Hosting Manager uses the same server and is rebuilt locally as 0.97.4+hosting.1.
