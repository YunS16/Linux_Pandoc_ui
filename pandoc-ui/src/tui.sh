#!/usr/bin/env bash
set -e

# basit mesaj yardimcilari
hata() { whiptail --title "Hata" --msgbox "$1" 10 60; }
bilgi() { whiptail --title "Bilgi" --msgbox "$1" 10 60; }

# 1) girdi dosyasi
girdi_dosyasi=$(whiptail --title "Pandoc TUI" \
  --inputbox "Girdi dosyasinin tam yolunu yaz:" 10 70 \
  3>&1 1>&2 2>&3) || exit 0

# bos giris kontrolu
if [[ -z "$girdi_dosyasi" ]]; then
  hata "Girdi bos birakilamaz."
  exit 1
fi

# dosya var mi
if [[ ! -f "$girdi_dosyasi" ]]; then
  hata "Girdi dosyasi bulunamadi:\n$girdi_dosyasi"
  exit 1
fi

# 2) format secimi
format=$(whiptail --title "Cikti Formati" \
  --menu "Bir format sec:" 15 60 6 \
  "html" "HTML" \
  "pdf" "PDF" \
  "docx" "Word" \
  "markdown" "Markdown" \
  3>&1 1>&2 2>&3) || exit 0

# 3) cikti dosyasi (bos birakilabilir)
cikti_dosyasi=$(whiptail --title "Cikti Dosyasi" \
  --inputbox "Cikti dosya yolu (bos birakirsan otomatik olusur):" 10 70 \
  3>&1 1>&2 2>&3) || exit 0

# cikti bossa otomatik isim uret
if [[ -z "$cikti_dosyasi" ]]; then
  # girdi dizininde cikti.<format> uretsin
  girdi_klasor=$(dirname "$girdi_dosyasi")
  cikti_dosyasi="$girdi_klasor/cikti.$format"
fi

# pdf icin mini uyari (latex gerekebilir)
if [[ "$format" == "pdf" ]]; then
  whiptail --title "Not" --yesno "PDF icin sistemde LaTeX gerekebilir.\nPDF uretmezse html/docx deneyebilirsin.\n\nDevam?" 12 70 || exit 0
fi

# 4) komut onizleme
komut="pandoc \"$girdi_dosyasi\" -o \"$cikti_dosyasi\" -t $format"
whiptail --yesno "Calistirilacak komut:\n\n$komut\n\nDevam edilsin mi?" 15 70 || exit 0

# 5) calistir
if pandoc "$girdi_dosyasi" -o "$cikti_dosyasi" -t "$format"; then
  bilgi "Basarili!\n\nCikti:\n$cikti_dosyasi"
else
  hata "Bir hata olustu. (pandoc komutu basarisiz)"
fi
