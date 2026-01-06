#!/usr/bin/env bash
set -e

# 1) dosya sec
girdi_dosyasi=$(yad --title="Pandoc GUI" --file --width=700 --height=400)
if [[ -z "$girdi_dosyasi" ]]; then
  exit 0
fi

# 2) format sec
format=$(yad --title="Cikti Formati" \
  --form --width=400 \
  --field="Format:CB" "html!pdf!docx!markdown")

format=${format%%|}   # yad form cikti temizligi
if [[ -z "$format" ]]; then
  exit 0
fi

# 3) cikti dosyasi (varsayilan)
girdi_klasor=$(dirname "$girdi_dosyasi")
cikti_dosyasi="$girdi_klasor/cikti.$format"

# isterse cikti yolunu degistirsin
secim=$(yad --title="Cikti Dosyasi" \
  --form --width=700 \
  --field="Cikti yolu:" "$cikti_dosyasi")

cikti_dosyasi=${secim%%|}
if [[ -z "$cikti_dosyasi" ]]; then
  exit 0
fi

# 4) onizleme + calistir
komut="pandoc \"$girdi_dosyasi\" -o \"$cikti_dosyasi\" -t $format"
yad --title="Onizleme" --text="Calistirilacak komut:\n\n$komut" --button=OK:0 --button=Iptal:1
if [[ $? -ne 0 ]]; then
  exit 0
fi

if pandoc "$girdi_dosyasi" -o "$cikti_dosyasi" -t "$format"; then
  yad --title="Basarili" --text="Cikti olusturuldu:\n$cikti_dosyasi"
else
  yad --title="Hata" --text="Pandoc calisirken hata olustu."
fi
