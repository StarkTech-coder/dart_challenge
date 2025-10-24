// ==========================================================
// DART 1. GÜN CHALLENGE: TEMEL KILAVUZU
// Konu: Temel Veri Tipleri, Değişkenler, Fonksiyonlar, Karar Yapıları.
// ==========================================================

// ----------------------------------------------------------
// YARDIMCI FONKSİYONLAR (main() öncesinde, kodun temiz kalması için tanımlanır)
// ----------------------------------------------------------

// 1. Fonksiyon: Değer Döndürmeyen (void) Özet Fonksiyonu
// Parametre: Fonksiyona dışarıdan gönderilen verilerdir.
void lastikOzetiGoster(String ad, int omur, double sicaklik) {
  print("\n--- Lastik Özet Raporu ---");
  print("Analiz Edilen Lastik: $ad");
  print("Kalan Ömür: ${omur}%");
  print("Sıcaklık: ${sicaklik}°C");
}

// 2. Fonksiyon: Değer Döndüren (double) Hesaplama Fonksiyonu
// Kural: double tipini kullandığımız için mutlaka return ile double değer dönmeli.
double sicaklikFarkiHesapla(double mevcutSicaklik, double idealSicaklik) {
  // abs(): Mutlak değeri alır, farkın negatif olmasını engeller.
  return (mevcutSicaklik - idealSicaklik).abs();
}

// 3. Karar Yapısı (If-Else): Aralık Kontrolü
void sicaklikUyarisiVer(double sicaklik) {
  // If-Else, aralık kontrolü ve geniş ihtimaller için kullanılır.
  if (sicaklik > 105.0) {
    print("!!! KRİTİK: Yüksek Sıcaklık Limiti Aşıldı.");
  } else if (sicaklik > 95.0) {
    print("SARI SİNYAL: Sıcaklık Yüksek. Gözlem Gerekli.");
  } else {
    print("YEŞİL SİNYAL: Sıcaklık Normal Sınırlar İçinde.");
  }
}

// 4. Karar Yapısı (Switch-Case): Kesin Değer Kontrolü
void omurTavsiyesiVer(int kalanOmurYuzdesi) {
  // Switch-Case, belirli ve sınırlı sayıdaki kesin değerler için temizdir.
  switch (kalanOmurYuzdesi) {
    case 10:
      print("!!! ZORUNLU PİT: %10 Ömür Kaldı.");
      break; // break, case eşleşince switch bloğunu sonlandırır.
    case 50:
      print("İDEAL ZAMAN: %50 Ömür Kaldı. Pit Düşünülebilir.");
      break;
    default:
      // default: Hiçbir case eşleşmezse çalışır.
      print("Özel Durum: Standart Takipteyiz. (%${kalanOmurYuzdesi})");
  }
}

// ----------------------------------------------------------
// ANA GİRİŞ NOKTASI (void main() - Program her zaman buradan başlar)
// ----------------------------------------------------------
void main() {
  // ==========================================================
  // I. VERİ TİPLERİ VE DEĞİŞKEN TANIMLAMA
  // ==========================================================

  // A. TEMEL VERİ TİPLERİ (Type Safety)
  String lastikAd = "Sağ Arka";
  int mevcutOmur = 37;
  double anlikSicaklik = 101.5;
  bool islakZemin = false;

  // B. ESNEK/SABİT DEĞİŞKENLER
  var saniye = 0; // var: İlk atanan tipi (int) alır, sonradan değiştirilebilir.
  final idealPilot =
      "Lewis Hamilton"; // final: Değeri BİR KEZ atanır, DEĞİŞTİRİLEMEZ.
  const MAKS_HIZ_KM =
      350; // const: En katı sabit. Kod DERLENİRKEN bilinmelidir.

  // ==========================================================
  // II. EKRAN ÇIKTILARI (print())
  // ==========================================================

  print("--- DART TEMEL KODLAMA NOTLARI BAŞLANGIÇ ---");

  // String Interpolation: Metin içine değişken yerleştirme.
  print("Pilot: $idealPilot. Maksimum Hız: $MAKS_HIZ_KM km/s.");
  print("Islak Zemin Durumu: $islakZemin.");

  // ==========================================================
  // III. FONKSİYON KULLANIMI VE ÇAĞRILARI
  // ==========================================================

  // 1. Değer Döndürmeyen Fonksiyon Çağrısı
  lastikOzetiGoster(lastikAd, mevcutOmur, anlikSicaklik);

  // 2. Değer Döndüren Fonksiyon Çağrısı (Sonucu bir değişkene atamalıyız)
  double idealSicaklik = 95.0;
  double fark = sicaklikFarkiHesapla(anlikSicaklik, idealSicaklik);

  print("\nSICAKLIK HESAPLAMA SONUCU:");
  print("İdeal sıcaklık ile mevcut sıcaklık arasındaki fark: ${fark} °C.");

  // ==========================================================
  // IV. KARAR YAPILARI TESTLERİ
  // ==========================================================

  // 1. If-Else Testi (Aralık Kontrolü)
  print("\n--- IF-ELSE SİSTEMİ ÇALIŞIYOR ---");
  sicaklikUyarisiVer(anlikSicaklik); // 101.5 => SARI SİNYAL çıkmalı.
  sicaklikUyarisiVer(110.0); // KRİTİK çıkmalı.

  // 2. Switch-Case Testi (Kesin Değer Kontrolü)
  print("\n--- SWITCH-CASE SİSTEMİ ÇALIŞIYOR ---");
  omurTavsiyesiVer(mevcutOmur); // 37 => Default (Özel Durum) çıkmalı.
  omurTavsiyesiVer(10); // ZORUNLU PİT çıkmalı.
}

// Komut satırında çalıştırmak için: dart run lib/main.dart

// ==========================================================
// DART 2. GÜN BAŞLANGIÇ: NESNE YÖNELİMLİ PROGRAMLAMA (OOP)
// Konu: Sınıflar (Class) ve Kurucu Metotlar (Constructor).
// ==========================================================

// 1. SINIF TANIMLAMA (Class): Nesnelerin (Objelerin) kalıbıdır.
class LastikOOP {
  // 2. ÖZELLİKLER (Properties / Üye Değişkenler): Nesnenin Verileri.
  // Final kullanılarak, bu özelliklerin nesne yaratıldıktan sonra değişmeyeceği belirtilir.
  final String ad;
  final double basinc;
  final int omur;

  // 3. YAPICI METOT (Constructor): Nesne yaratıldığı anda çalışır ve zorunlu verileri alır.
  // this.ozellikAdi kullanımı, gelen argümanı doğrudan sınıfın özelliğine atar.
  // Bu, kod yazımını kısaltan Dart'a özgü bir kolaylıktır.
  LastikOOP(this.ad, this.basinc, this.omur);

  // 4. METOTLAR (Methods): Nesnenin Davranışları (Aksiyonları).
  // Bu metot, If-Else yapısını kullanarak sadece kendi nesnesinin verisini kontrol eder.
  void durumuGoster() {
    print("\n--- ${ad} Nesnesi Detaylı Analiz ---");
    print("Basınç: ${basinc} PSI | Ömür: ${omur}%");

    // If-Else, Sınıf Metodu içinde kullanılarak Kapsülleme (Encapsulation) sağlanır.
    if (basinc < 28.0) {
      print("!!! KRİTİK UYARI: Basınç DÜŞÜK! Acil Dolum Gerekli.");
    } else {
      print("Durum: OK. Basınç İdeal Sınırda.");
    }
  }
}

// ----------------------------------------------------------
// main() Fonksiyonunda Kullanım
// ----------------------------------------------------------
void main() {
  // ... (Dart 1. Gün Çağrıları burada devam ediyor.)

  print("\n\n=============== DART 2. GÜN: OOP ÇAĞRILARI ===============");

  // 1. NESNE OLUŞTURMA: Constructor'ı kullanarak nesneyi zorunlu verilerle oluşturuyoruz.
  // Eğer bu 3 değeri vermezsek, program hata verir (Type Safety).
  LastikOOP onSol = LastikOOP("Sol Ön", 27.5, 45); // Kritik Basınç
  LastikOOP sagArka = LastikOOP("Sağ Arka", 32.0, 80); // İdeal Basınç

  // 2. METOT ÇALIŞTIRMA: Her nesne, kendi verisiyle durumuGoster metodunu çalıştırır.
  onSol.durumuGoster(); // Sol Ön (27.5) için DÜŞÜK uyarısı vermeli.
  sagArka.durumuGoster(); // Sağ Arka (32.0) için OK çıktısı vermeli.
}

class LastikOOP {
  final String ad;
  final double basinc;
  final int omur;

  // 1. Birinci Yapıcı (Varsayılan): Tüm verileri doğrudan alır.
  LastikOOP(this.ad, this.basinc, this.omur);

  // 2. İSİMLENDİRİLMİŞ YAPICI METOT: Veritabanından gelen Map tipindeki veriyi işlemek için.
  // Kural: SınıfAdı.Yeniİsim() formatında tanımlanır.
  LastikOOP.fromDatabase(Map<String, dynamic> veriMap)
    // 'Initializing List' denir. Gövde çalışmadan önce atama yapılır.
    : ad = veriMap['ad']!,
      basinc = veriMap['basinc']!,
      omur = veriMap['omur']! {
    // Kurucu gövdesi: Nesne yaratılırken bir kez çalışacak ek işlemler (opsiyonel).
    print("Veritabanından Gelen ${ad} Nesnesi Başarıyla Oluşturuldu.");
  }

  void durumuGoster() {
    // ... (Metot içeriği aynı kalır)
    print("\n--- ${ad} Nesnesi Detaylı Analiz ---");
    print("Basınç: ${basinc} PSI | Ömür: ${omur}%");

    if (basinc < 28.0) {
      print("!!! KRİTİK UYARI: Basınç DÜŞÜK! Acil Dolum Gerekli.");
    } else {
      print("Durum: OK. Basınç İdeal Sınırda.");
    }
  }
}

// ----------------------------------------------------------
// main() Fonksiyonunda Kullanım
// ----------------------------------------------------------
void main() {
  // ... (Dart 1. ve 2. Gün Çağrılarım burada devam ediyor.)

  print(
    "\n\n=============== DART 2. GÜN: NAMED CONSTRUCTOR ÇAĞRILARI ===============",
  );

  // 1. Varsayılan Yapıcı ile Nesne Oluşturma (Sensör Verisi gibi)
  LastikOOP onSolSensorden = LastikOOP("Sol Ön Sensör", 27.5, 45);
  onSolSensorden.durumuGoster();

  // 2. İsimlendirilmiş Yapıcı ile Nesne Oluşturma (Veritabanı Verisi gibi)
  Map<String, dynamic> dbVerisi = {
    'ad': 'Sağ Ön DB',
    'basinc': 33.0,
    'omur': 90,
  };

  LastikOOP sagOnDBden = LastikOOP.fromDatabase(dbVerisi);
  sagOnDBden.durumuGoster();
}

// ==========================================================
// DART 2. GÜN CHALLENGE: ADIM 5 (Opsiyonel Parametreler)
// ==========================================================

// Opsiyonel: Veri girişini zorunlu olmaktan çıkarıp esneklik kazandırma.
class LastikAyari {
  // Zorunlu Veri: Her lastiğin bir adı olmalıdır.
  final String ad;

  // Opsiyonel Veriler: Basınç ve omur bilinmeyebilir. Null Safety için '?' ve varsayılan değer kullanılır.
  // Varsayılan değer (default value) atanarak null ihtimali azaltılır.
  final double? basinc; // Null olabilir
  final int omur = 100; // Varsayılan değer (Omur bilinmiyorsa %100 kabul et.)

  // Yapıcı (Constructor): Süslü Parantez ({}) kullanmak, parametreleri OPSİYONEL ve İSİMLENDİRİLMİŞ yapar.
  // Zorunlu (required) parametreler için 'required' anahtar kelimesi kullanılır (ad gibi).
  LastikAyari({
    required this.ad, // Bu parametre zorunlu (Adı olmayan lastik olmaz).
    this.basinc, // Bu parametre opsiyonel (Basınç verisi gelmeyebilir).
    int? omur, // Yerel omur değişkeni
  }) : omur =
           omur ??
           100; // Null Kontrolü: Eğer omur gelmezse (null ise), 100 olarak ata.

  void ozetiYazdir() {
    print("\n--- Lastik Ayarı Özeti (${ad}) ---");

    if (basinc == null) {
      print("Basınç Durumu: Bilinmiyor. Kontrol Edilmeli.");
    } else {
      print("Basınç: ${basinc} PSI");
    }

    print("Ömür (%): ${omur}");
  }
}

// ----------------------------------------------------------
// main() Fonksiyonunda Kullanım
// ----------------------------------------------------------
void main() {
  // ... (Önceki çağrılar burada devam ediyor.)

  print(
    "\n\n=============== DART 2. GÜN: OPSİYONEL PARAMETRELER ===============",
  );

  // 1. Tüm verileri girme (Sıra önemli değil, isimler önemli)
  LastikAyari tamVerili = LastikAyari(
    omur: 80,
    ad: "Sağ Arka (Tam Veri)",
    basinc: 30.5,
  );
  tamVerili.ozetiYazdir();

  // 2. Eksik veri girme (Basınç'ı atladık)
  LastikAyari eksikVerili = LastikAyari(
    ad: "Sol Ön (Eksik Basınç)", // Ad zorunlu olduğu için girmek zorundayız.
    omur: 50,
  );
  eksikVerili.ozetiYazdir(); // Basınç 'null' olduğu için uyarı verecek.
}
