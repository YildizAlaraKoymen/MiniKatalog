# Mini Katalog Uygulaması

Mini Katalog Uygulaması, Flutter eğitimi kapsamında hazırlanmış temel seviyede bir mobil katalog projesidir. Uygulamada ürün listeleme, ürün detay görüntüleme, arama, sepet simülasyonu ve sayfalar arası veri taşıma örnekleri yer alır.

## Proje Durumu

Bu proje aşağıdaki eğitim çıktılarını karşılayacak şekilde hazırlanmıştır:

| Gereksinim | Durum |
| --- | --- |
| Çalışan bir “Mini Katalog Uygulaması” | Var |
| Ana sayfa, ürün listesi ve ürün detayı ekran yapısı | Var |
| Sayfa geçişleri | `Navigator` ile yapıldı |
| Route Arguments kullanımı | Ürün detayı ekranına ürün verisi taşınıyor |
| GridView ile kart tabanlı tasarım | Ürünler grid kart yapısında listeleniyor |
| Basit state güncelleme örneği | Sepet sayacı ve sepet içeriği güncelleniyor |
| Proje klasör yapısını doğru kullanma | `data`, `models`, `screens`, `widgets` klasörleri kullanıldı |
| Asset yönetimi | Banner görseli asset olarak eklendi, ürün verileri JSON API cevabından modele çevriliyor |

## Özellikler

- Ana sayfada katalog banner alanı
- Fake Store API üzerinden ürün listeleme
- Ürün adı ve kategoriye göre arama
- GridView ile ürün kartları
- Ürün detay sayfası
- Sepete ürün ekleme
- Sepet ekranında ürün adedi ve toplam tutar gösterimi
- Route arguments ile ürün verisi taşıma

## Kullanılan Teknolojiler

- Flutter SDK
- Dart SDK
- Material Design
- `http` paketi
- Fake Store API

## Kullanılan Flutter Sürümü

Proje Flutter stable kanalında oluşturulmuştur.

```text
Dart SDK constraint: ^3.11.5
Flutter channel: stable
```

Kesin Flutter sürümünü görmek için:

```bash
flutter --version
```

## Proje Klasör Yapısı

```text
lib/
  data/
    cart_store.dart
    product_api_service.dart
    product_repository.dart
  models/
    product.dart
  screens/
    cart_screen.dart
    product_detail_screen.dart
    product_list_screen.dart
  widgets/
    product_card.dart
  main.dart

assets/
  images/
    banner.png

screenshots/
  home.png
  detail.png
  cart.png
```

## Çalıştırma Adımları

1. Bağımlılıkları yükleyin:

```bash
flutter pub get
```

2. Uygulamayı çalıştırın:

```bash
flutter run
```

3. Web üzerinde çalıştırmak için:

```bash
flutter run -d chrome
```

Asset değişikliklerinden sonra sorun yaşanırsa:

```bash
flutter clean
flutter pub get
flutter run
```

## Ekran Görüntüleri

### Ana Sayfa

![Ana Sayfa](screenshots/home.png)

### Ürün Detayı

![Ürün Detayı](screenshots/detail.png)

### Sepet

![Sepet](screenshots/cart.png)

## Veri Kaynağı

Ürün verileri eğitim ve demo amaçlı olarak Fake Store API üzerinden alınır:

```text
https://fakestoreapi.com/products
```

Uygulama API cevabındaki JSON verisini `Product` modeline çevirerek ekranda listeler.
