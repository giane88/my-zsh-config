#!/bin/bash

# Update
echo "Aggiornamento dei pacchetti..."
sudo apt update

# Installo i pacchetti necessari
echo "Installazione pacchetti..."
sudo apt install -y zsh autojump gh 

# Installo OH-MY-ZSH
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installazione di Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh è già installato."
fi

# Imposto la variabile ZSH_CUSTOM se non già definita
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Installo il tema powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "Installazione del tema Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
else
    echo "Il tema Powerlevel10k è già installato."
fi

# Installo il plugin zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installazione del plugin zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
else
    echo "Il plugin zsh-syntax-highlighting è già installato."
fi

# Installo il plugin zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installazione del plugin zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
else
    echo "Il plugin zsh-autosuggestions è già installato."
fi

# Installo il plugin you-should-use
if [ ! -d "$ZSH_CUSTOM/plugins/you-should-use" ]; then
    echo "Installazione del plugin you-should-use..."
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
else
    echo "Il plugin you-should-use è già installato."
fi

# Installo il plugin zsh-bat
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-bat" ]; then
    echo "Installazione del plugin yzsh-bat..."
    git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat
else
    echo "Il plugin zsh-bat è già installato."
fi

# Installo i font
if [ ! -d "fonts" ]; then
    echo "Installazione dei Powerline Fonts..."
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    yes | rm -r fonts
    echo "Installazione dei font completata."
else
    echo "I Powerline Fonts sono già stati installati."
fi

# Sincronizzo le modifiche
echo "Sincronizzazione delle modifiche con rsync.sh..."
./sync.sh 1

# Ricarico il file .zshrc
echo "Ricaricamento della configurazione di Zsh..."
source ~/.zshrc

echo "Configurazione completata!"
