{ nixpkgs ? import <nixpkgs> {} }:

let
  pkgs = nixpkgs.pkgs;
in

pkgs.mkShell {
  packages = with pkgs; [
    vim
  ];
  shellHook = ''
    alias vim="vim -u $HOME/dotfiles/.vimrc"
    source $HOME/.bashrc
    export PS1="\u@nix-shell($SHLVL)-\h:\w\$ ";
  '';
}
