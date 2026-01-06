#!/usr/bin/env bash

secim=$(whiptail --title "Pandoc Arayuz Secimi" \
  --menu "Hangi arayuzle calistirilsin?" 15 60 3 \
  "TUI" "Terminal Arayuzu" \
  "GUI" "Grafik Arayuz (YAD)" \
  "CIKIS" "Programdan cik" \
  3>&1 1>&2 2>&3)

case "$secim" in
  TUI)
    ./src/tui.sh
    ;;
  GUI)
    ./src/gui.sh
    ;;
  *)
    exit 0
    ;;
esac
