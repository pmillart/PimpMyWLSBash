# Pre-requis 
# 4 fonts dejavu installées
#=== installer les fonts powerline ===
#télécharger les fonts powerline et les installer sous windows, les fonts DejaVu suffisent
#https://github.com/powerline/fonts
#source : http://iamnotmyself.com/2017/04/15/setting-up-powerline-shell-on-windows-subsystem-for-linux/
# https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20Bold%20Oblique%20for%20Powerline.ttf?raw=true

# Variables 

#=== installer ZSH ===

echo "install zsh"
sudo apt install zsh
>> .zshrc

echo "Install oh-my-zsh"
git clone https://github.com/robbyrussell/oh-my-zsh $HOME/oh-my-zsh
sh ./oh-my-zsh/tools/install.sh

echo "changer le theme par défaut par gnoster"
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' .zshrc


=== configurer les couleurs ===
echo "Installer le theme solarized"
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
echo "`dircolors ~/.dircolors`" >> .zshrc
echo "export LS_COLORS" >> .zshrc

=== Corriger les problèmes de couleurs ===

#Cloner le repo 16bash
#dans le répertoire, des scripts bash permettent de redéfinir proprement la palette 16 colors.
git-clone https://github.com/chriskempson/base16-shell.git $HOME/.base16-shell
sh ./base16-shell/scripts/base16-solarized-dark.sh


Ex: base16-solarized-dark.sh


ajouter la (les) ligne(s) suivantes dans .zshrc :

echo "# Correction des problemes de 16 couleurs dans le terminal WSL de Windows
# base16-black-metal-immortal.sh
# base16-black-metal-khold.sh
# base16-brewer.sh             -- comme mode Nico mais fond plus sombre
# base16-bright.sh             -- bien lumineux couleurs vives
# base16-chalk.sh  ---
# base16-atelier-plateau.sh    --couleur douce genre mode Nuit
# base16-gruvbox-dark-hard.sh  --bien lumineux
# base16-hopscotch.sh          --bien lumineux
# base16-pico.sh               --bien lumineux, Powerline grise et jaune
# base16-solarized-dark.sh" >> .zshrc
echo "sh $HOME/.base16-shell/scripts/base16-atelier-plateau.sh" >> .zshrc

=== plugin Oh My ZSH ===
ZSH syntax highlight : https://github.com/mattjj/my-oh-my-zsh/tree/master/plugins/zsh-syntax-highlighting

Download the script or clone this repository in oh-my-zsh plugins directory:

#  cd ~/.oh-my-zsh/custom/plugins
# WARNING
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins
Activate the plugin in ~/.zshrc (in last position):

  plugins=( [plugins...] zsh-syntax-highlighting)

modifier le fichier .zshrc en mettant les plug-ins que vous souhaitez activer 

#exemple :
#plugins=(docker git git-flow history history kubectl terraform sudo zsh-autosuggestions zsh-syntax-highlighting)
#
#=== Autosuggestion basé sur l'historique ===

#git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions


ajouter zsh-autosuggestions dans les plugins dans .zshrc


==== Démarrer automatiquement ZSH ===

Source : https://github.com/Microsoft/WSL/issues/1724

Just add this line on top of the .bashrc:

# Switch to ZSH shell
if test -t 1; then
exec zsh
fi


=== Faire prendre en compte .bashrc par WSL ===

Source : https://github.com/Microsoft/WSL/issues/2067

You have ~/.bash_profile and ~/.profile both, but ~/.bash_profile would be read if bash be a login shell and you have ~/.bash_profile.

Check your ~/.bash_profile to have these lines;

if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi



=== Colorisation syntaxique dans Nano ===

Faire de la colorisation syntaxique dans nano.

https://github.com/scopatz/nanorc

git clone https://github.com/scopatz/nanorc.git ~/.nano 

cat ~/.nano/nanorc >> ~/.nanorc

=== Pour autocomplete de la ligne de commande Azure (az) ===
dans le fichier .zshrc ajouter les lignes suivantes

autoload bashcompinit && bashcompinit
source '/home/stan/az.completion'

