# Oracle database 
***created by Tomáš Doubek***
### Pár slov na úvod
Kompletna instalacia `oracle databse` *-xe a `Oracle SQL Developer` je mozne mat sucastne spustene viacere databazove verzie 

### Dostupne verzie

- Oracle Database 21c (21.3.0) Enterprise Edition, Standard Edition 2 and Express Edition (XE)
- Oracle Database 19c (19.3.0) Enterprise Edition and Standard Edition 2
- Oracle Database 18c (18.4.0) Express Edition (XE)
- Oracle Database 18c (18.3.0) Enterprise Edition and Standard Edition 2
- Oracle Database 12c Release 2 (12.2.0.2) Enterprise Edition and Standard Edition 2
- Oracle Database 12c Release 1 (12.1.0.2) Enterprise Edition and Standard Edition 2
- Oracle Database 11g Release 2 (11.2.0.2) Express Edition (XE)

#### Nastavenie `.env`
Vyber si verziu a nastav heslo

#### Instalacia `bin/install.sh`
Instalacia moze trvat aj 40minut
- nainstaluje docker container
- nainstaluje SQL Developera
- nasetupuje a nainicializuje prostredie
```sh
cd bin
sh install.sh
```

#### Import testovacej procedury `cmd/importOsadnici.sh`
```sh
cd cmd
sh importOsadnici.sh
```
#### Spustenie Oracle SQL Developer `cmd/sqlDeveloper.sh`
```sh
cd cmd
sh sqlDeveloper.sh
```

#### Spustenie SQL Plus `cmd/sqlPlus.sh`
```sh
cd cmd
sh sqlPlus.sh
```

#### Kompletne odinstalovanie `bin/uninstall.sh`
- odinstaluje kontajner, vymaze volume a configy, odstrani sql developera
```sh
cd bin
sh uninstall.sh
```

