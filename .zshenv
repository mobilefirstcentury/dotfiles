# Contrairement à zshrc zshenv est loadé pour toutes les sessions et pas seulement pour les session interactives
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  # Je suis obligé parceque j'ai une version ancienne de ruby installé en globale et elle fout la grouille.
  chruby 2.1.3
fi
