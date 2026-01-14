<div align="center">
  <h1>🐧 Linux Pandoc Dönüştürücü Projesi</h1>
</div>

---

## 📌 Proje Tanımı

Bu proje, Pandoc’un sunduğu güçlü belge dönüştürme yeteneklerini  
Linux kullanıcıları için **daha erişilebilir ve kullanıcı dostu** hale getirmeyi amaçlamaktadır.

Komut satırı bilgisi sınırlı olan kullanıcılar için **GUI**,  
terminal ortamını tercih eden kullanıcılar için ise **TUI** arayüzü sunulmuştur.

Bu proje ile kullanıcılar, Pandoc aracılığıyla Markdown (`.md`) formatındaki belgeleri
HTML (`.html`), PDF (`.pdf`) ve Word (`.docx`) formatlarına dönüştürebilmektedir.
Ayrıca çıktı dosyaları kullanıcı tarafından istenilen dizine kaydedilebilmekte
ve dönüşüm işlemi hem grafik arayüz (GUI) hem de terminal tabanlı arayüz (TUI)
üzerinden gerçekleştirilebilmektedir.

Markdown → Markdown dönüşümü, dosya içeriğinin standartlaştırılması ve
biçimsel tutarlılığın sağlanması amacıyla kullanılmaktadır.


---

## 🎯 Projenin Amacı

- Pandoc kullanımını kolaylaştırmak
- Komut yazma zorunluluğunu ortadan kaldırmak
- GUI ve TUI farkını uygulamalı olarak göstermek
- Linux ortamında script tabanlı arayüz geliştirmeyi öğrenmek
- Eğitim amaçlı, sade ve anlaşılır bir proje sunmak

---

## ✨ Temel Özellikler

- GUI (YAD) ile fare destekli kullanım
- TUI (Whiptail) ile terminal menüleri
- Girdi dosyası seçimi
- Çıktı formatı belirleme
- Çıktı dosya yolu seçimi
- Pandoc komut önizleme
- Hata kontrolü ve kullanıcı bilgilendirmesi

---

## 🛠️ Kullanılan Teknolojiler

- **Bash (Shell Script)**  
- **Pandoc**  
- **YAD** – Grafik kullanıcı arayüzü  
- **Whiptail** – Terminal tabanlı arayüz  

---

## 📁 Proje Dosya Yapısı

```text
pandoc-ui
├── src
    ├── gui.sh        # YAD tabanlı grafik arayüz
    ├── tui.sh        # Whiptail tabanlı terminal arayüzü
├── test.md       # Örnek girdi dosyası
├── run.sh        # Ana çalıştırma dosyası
    README.md     # Proje dokümantasyonu
    img folder    #Projeden alınan ekran görüntüleri(resimler)
```

## Pardus İşletim Sistemi Kurulumu

Bu proje Pardus işletim sistemi üzerinde geliştirilmiş ve test edilmiştir.
Pardus kullanmayan kullanıcılar, aşağıdaki bağlantılar aracılığıyla
VirtualBox üzerinde Pardus kurulumunu gerçekleştirebilir.

- [VirtualBox Kurulumu](https://www.virtualbox.org/wiki/Downloads)
- [Pardus ISO Dosyası](https://www.pardus.org.tr/indir/)

## 🧩 Proje Kurulumu ve Çalıştırma

Bu bölümde projeyi GitHub üzerinden indirip terminalden çalıştırma adımları gösterilmektedir.

### 1️⃣ Git ile projeyi klonla

```bash
git clone https://github.com/YunS16/Linux_Pandoc_ui.git
```
### 2️⃣ Proje dizinine girin
```
cd Linux_Pandoc_ui
```
### 3️⃣ Gerekli paketleri kurun 

Bu adımda projenin çalışabilmesi için gerekli olan tüm paketler sisteme kurulmaktadır.
Pandoc belge dönüştürme işlemleri için, YAD ve Whiptail arayüzler için,
LaTeX ise PDF çıktısı oluşturabilmek için kullanılmaktadır.

```bash
sudo apt update
sudo apt install -y pandoc yad whiptail texlive
```
### 4️⃣Script dosyalarına çalıştırma izni verin
```
chmod +x run.sh gui.sh tui.sh
```
### 5️⃣ Programı çalıştırın
```
./run.sh
```
## Arayüz Seçim Mekanizması

Program çalıştığında kullanıcıdan arayüz seçmesi istenir:

- GUI (YAD)
- TUI (Whiptail)
- 
![arayüz_secim](img/Arayuz_secim.png)

## 🖥️ GUI (YAD) Arayüzü

### Girdi Dosyası Seçimi
![GUI Dosya Seçimi](img/gui/Gui_girdi_dosyasi.png)

Bu adımda kullanıcı dönüştürülmek istenen belgeyi grafik arayüz üzerinden seçer.
Dosya seçimi tamamlandıktan sonra bir sonraki aşamaya geçilir.


### Çıktı Formatı Seçimi
![GUI Format](img/gui/cikti_formati.png)

Kullanıcı burada belgenin hangi formata dönüştürüleceğini belirler.
HTML, PDF ve DOCX gibi farklı formatlar desteklenmektedir.


### Çıktı Dosya Yolu
![GUI Output](img/gui/cikti_dosya_yolu.png)

Dönüştürülen dosyanın hangi dizine kaydedileceği bu adımda seçilir.
Böylece çıktı dosyası kullanıcı tarafından kolayca bulunabilir.


### İşlem Sonucu

<div style="display:flex; gap:20px; justify-content:center; align-items:center;">
  <img src="img/gui/basarili_cikti.png" width="48%">
  <img src="img/gui/basarili_cikti_kanit.png" width="48%">
</div>

Dönüştürme işlemi başarıyla tamamlandığında kullanıcı bilgilendirilir.
Oluşturulan çıktı dosyası seçilen dizine kaydedilir.


## ⌨️ TUI (Whiptail) Arayüzü

### Dosya Yolu Girişi
![TUI Input](img/tui/girdi_yolu_2.png)

Kullanıcı dönüştürülecek dosyanın tam yolunu terminal üzerinden girer.
Bu yöntem grafik arayüz bulunmayan sistemlerde kullanım sağlar.

### Format Seçim Menüsü
![TUI Format](img/tui/cikti_formati.png)

Terminal tabanlı menü aracılığıyla çıktı formatı seçilir.
Kullanıcı yön tuşlarıyla menüde rahatça gezinebilir.

### Cikti Yolu 
![TUI Preview](img/tui/cikti_yolu.png)

### İşlem Sonucu

<div style="display:flex; gap:20px; justify-content:center; align-items:center;">
  <img src="img/tui/basarili_cikti1.png" width="48%">
  <img src="img/tui/basarili_cikti2.png" width="48%">
</div>

İşlem başarıyla tamamlandığında terminal üzerinden bilgilendirme yapılır.
Çıktı dosyası belirtilen dizinde oluşturulur.



## 🎥 Tanıtım Videosu

YouTube Linki:


## Geliştirici Bilgileri

İsim: Yunus Emre Nallı
Email: yunusemrenalli@hotmail.com





