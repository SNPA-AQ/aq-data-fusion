# aq-data-fusion
_Data fusion for air quality data_

Repository dedicato allo sviluppo di software per la combinazione di dati da modello e osservati

## come contribuire al progetto

### per cominciare
1. iscriversi a [GitHub](http://github.com) (indicate Nome e Cognome nel profilo, così ci riconosciamo)
1. aderire all'_organizzazione_ [SNPA-AQ](https://github.com/SNPA-AQ)
1. accedere al [server RStudio di sviluppo](https://rdati.arpae.it/) (richiedere l'attivazione di un account personale a RAmorati di Arpae)
1. creare una copia personale del progetto (nel gergo di _git_: _clonare il progetto_)
    * da RStudio: con i comandi _File_ > _New project..._ > _Version control_ > _Git_ e indicando come _Repository URL_ `https://github.com/SNPA-AQ/aq-data-fusion.git`
    * oppure in locale (__per esperti__, utile per testare la portabilità del codice su altre macchine): `git clone https://github.com/SNPA-AQ/aq-data-fusion.git`
 
### strumenti di progetto
* per pianificare e monitorare lo sviluppo del codice: https://github.com/SNPA-AQ/aq-data-fusion/projects/1?fullscreen=true
* per segnalare problemi (_issues_), porre obiettivi intermedi (_milestones_), proporre soluzioni: https://github.com/SNPA-AQ/aq-data-fusion/issues
* per discutere l'impostazione del lavoro (tra sviluppatori): https://github.com/orgs/SNPA-AQ/teams/data-fusion-developers
  
### link utili
* [guida](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf) essenziale di _git_
* [guida](https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf) essenziale di _RStudio_
* un breve [video](https://youtu.be/YxZ8J2rqhEM) su RStudio e GitHub

## struttura del repository

| __cartella__ o _file_ | descrizione | note |
|-----------------------|-------------|------|
| _.gitignore_| lista di file/cartelle da non caricare su github | p.es. dati voluminosi o riservati |
| _README.md_ | README  | formato RMarkdown |
| _LICENSE_ | definisce la licenza | [GPLv3](https://www.gnu.org/licenses/quick-guide-gplv3.it.html) |
| __config__ | file di configurazione| p.es. definizione dei path|
| __data__ | dati e metadati| conviene strutturarli in sotto-cartelle |
| __bash__   |script di shell|  |
| __python__ |script python  |  |
| __R__      |script R       |  |
| __log__ | log |  |
