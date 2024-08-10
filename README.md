
# Zsh Configuration and Plugin Management

Questo repository contiene le configurazioni di Zsh, i plugin associati, e due script per semplificare l'installazione e la sincronizzazione delle configurazioni.

## Contenuto del Repository

- `.zshrc`: File di configurazione principale per Zsh.
- `.p10k.zsh`: File di configurazione per il tema `powerlevel10k`.
- `install.sh`: Script per installare Zsh, Oh My Zsh, e i plugin necessari.
- `sync.sh`: Script per sincronizzare i file di configurazione tra la directory locale e la home.

## Script

### `install.sh`

Lo script `install.sh` gestisce l'installazione e la configurazione di Zsh, Oh My Zsh, e dei plugin essenziali.

**Funzionalità principali:**
- Installa `Zsh` e `autojump`.
- Installa `Oh My Zsh` se non già presente.
- Installa e configura il tema `powerlevel10k`.
- Installa i plugin `zsh-syntax-highlighting` e `zsh-autosuggestions`.
- Installa i font `Powerline` per migliorare l'aspetto del terminale.
- Sincronizza i file di configurazione con lo script `rsync.sh`.

### `sync.sh`

Lo script `sync.sh` gestisce la sincronizzazione dei file `.zshrc` e `.p10k.zsh` tra la directory locale e la home directory dell'utente.

**Modalità di utilizzo:**
- **Senza parametri**: Chiede all'utente se sincronizzare le modifiche locali con quelle nella home o viceversa.
- **Con parametro `1`**: Sincronizza i file dalla directory locale alla home (`~/`).
- **Con parametro `2`**: Sincronizza i file dalla home directory (`~/`) alla directory locale.

## Configurazione

Prima di eseguire gli script `install.sh` e `sync.sh`, assicurati di renderli eseguibili con il seguente comando:

```bash
chmod +x install.sh sync.sh
```

## Esecuzione degli Script

### Installazione

Esegui lo script install.sh per configurare il tuo ambiente Zsh:

```bash
./install.sh
```

### Sincronizzazione

Esegui lo script sync.sh per sincronizzare i file di configurazione:

Senza parametri:

```bash
./sync.sh
```

Questo chiederà se vuoi sincronizzare dalla directory locale alla home o viceversa.

Con parametro 1:

```bash
./sync.sh 1
```

Questo sincronizza i file dalla directory locale alla home.

Con parametro 2:

```bash
./sync.sh 2
```

Questo sincronizza i file dalla home directory alla directory locale.

## Note
Assicurati di avere una connessione internet attiva durante l'esecuzione di install.sh per scaricare le dipendenze necessarie. È consigliabile eseguire i comandi come utente non root, a meno che non sia specificato diversamente.

Buona configurazione del tuo ambiente Zsh!