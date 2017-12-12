#!/usr/bin/env bash

shopt -s cdspell # Pour que bash corrige automatiquement les fautes de frappes ex: cd ~/fiml sera remplacé par cd ~/film
shopt -s checkwinsize # Pour que bash vérifie la taille de la fenêtre après chaque commande
shopt -s cmdhist # Pour que bash sauve dans l'historique les commandes qui prennent plusieurs lignes sur une seule ligne.
shopt -s dotglob # Pour que bash montre les fichiers qui commencent par un .
shopt -s expand_aliases # # Pour que bash montre la commande complete au lieu de l'alias
shopt -s extglob # Pour que bash, interprète les expressions génériques
shopt -s histappend # Pour que bash ajoute au lieu d'écraser dans l'histo
shopt -s hostcomplete # Pour que bash tente de résoudre le nom pour les ip suivis d'un @
shopt -s nocaseglob # Pour que bash ne soit pas sensible a la casse
shopt -s no_empty_cmd_completion

export HISTSIZE=10000 # taille de l'historique
export HISTFILESIZE=${HISTSIZE}
export HISTIGNORE="ls:cd:[bf]g:exit:pwd" # ignorer les lignes w/ ls, cd, ...
export HISTCONTROL=ignoreboth
set -o history
