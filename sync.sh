#!/bin/bash

# Funzione per sincronizzare dalla cartella locale alla home
sync_to_home() {
    echo "Sincronizzazione delle modifiche locali con la home directory..."
    rsync -avh --progress .zshrc .p10k.zsh ~/
    echo "Sincronizzazione completata."
}

# Funzione per sincronizzare dalla home directory alla cartella locale
sync_to_local() {
    echo "Sincronizzazione delle modifiche dalla home directory alla cartella locale..."
    rsync -avh --progress ~/.zshrc ~/.p10k.zsh ./
    echo "Sincronizzazione completata."
}

# Controllo dei parametri
if [ $# -eq 0 ]; then
    echo "Vuoi sincronizzare le modifiche locali con quelle sulla home (1) o viceversa (2)?"
    read -p "Inserisci 1 per sincronizzare le modifiche locali con la home, oppure 2 per sincronizzare la home con le modifiche locali: " choice
    if [ "$choice" -eq 1 ]; then
        sync_to_home
    elif [ "$choice" -eq 2 ]; then
        sync_to_local
    else
        echo "Scelta non valida. Uscita dallo script."
        exit 1
    fi
elif [ "$1" -eq 1 ]; then
    sync_to_home
elif [ "$1" -eq 2 ]; then
    sync_to_local
else
    echo "Parametro non valido. Usa 1 per sincronizzare le modifiche locali con la home, oppure 2 per sincronizzare la home con le modifiche locali."
    exit 1
fi
