import 'package:bilgi_yarismasi/soruClass.dart';
import 'package:flutter/material.dart';

/*
burada ki vericlass dosyasını oluşturma amacımız 
hem kod karmaşasını azaltmak 
ve bu dosyayı direk main.dart da kullanmak
böylelikle yeni bir veri eklenecek olduğu zaman
direk bu dosya içine gelip hem kolaylıkla eklenmiş olacak
hem de zaman kaybından ve özellikle 
UZUN VE KARMAŞIK KOD DÜZENİNDEN kurtulmuş olacak projemiz.

///   buna da SOYUTLAMA DENİR.
*/

class veriler {
  /// ÖNCEKİ İLK HALİNDE SORU VE YANITLARI BURADA LİSTE DE TUTUYORDUM.
  /// SONRADAN İKİSİNİ DE AYNI LİSTE İÇİNE ALDIM.
  /// BU ŞEKİLDE SORU SIRASI VE SORUNUN YANITI KAYABİLİRDİ.
  ///
  ///
  ///
  /*
  List<String> sorular = [
    
  ];

  List<bool> yanitlar = [
    
  ];
  */

  //bu listenin isminin başına   _  koyarak dışarıdan erişimini engelledik.
  //sadece bu sınıf erişebilecek.

  int _soruIndex = 0;

  //final kullandık çünkü bir kere vereceğiz değeri bir daha değişmeyecek.
  final List<Soru> _soruBankasi = [
    //Soru(soruMetni: soruMetni, soruYaniti: soruYaniti),
    Soru(
        soruMetni: "Titanic gelmiş geçmiş en büyük gemidir.",
        soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır.",
        soruYaniti: true),
    Soru(soruMetni: "Kelebeklerin ömrü bir gündür.", soruYaniti: false),
    Soru(soruMetni: "Dünya düzdür.", soruYaniti: false),
    Soru(
        soruMetni: "Kaju fıstığı aslında bir meyvenin sapıdır",
        soruYaniti: true),
    Soru(
        soruMetni: "Fatih Sultan Mehmet hiç patates yememiştir",
        soruYaniti: true),
    Soru(soruMetni: "Fransızlar 80 demek için, 4 - 20 der", soruYaniti: true),
    Soru(soruMetni: "Kova burcu bir kaplanla temsil edilir", soruYaniti: false),
    Soru(
        soruMetni: "Bir aslanın kükremesi sekiz kilometre öteden duyulabilir",
        soruYaniti: true),
    Soru(
        soruMetni: "Harry Potter'da Draco Malfoy'un kardeşi yoktur",
        soruYaniti:
            true), //F-T-F-F-T-T-T-F-T-T    -T-F-T-F-F-T-T-F-F-F    -F-F-F-T-T-F-T-F-F-T
    Soru(
        soruMetni: "Avatar tüm zamanların en çok hasılat yapan filmidir",
        soruYaniti: true),
    Soru(soruMetni: "Köpek balıkları memeli hayvanlardır", soruYaniti: false),
    Soru(
        soruMetni: "Mavi balina, şimdiye kadar yaşamış en büyük hayvandır",
        soruYaniti: true),
    Soru(soruMetni: "Yarasalar kördür", soruYaniti: false),
    Soru(soruMetni: "Köpek dilini soluyarak terler", soruYaniti: false),
    Soru(
        soruMetni: "Bir tembel hayvanın bir yemeği sindirmesi iki hafta sürer",
        soruYaniti: true),
    Soru(
        soruMetni:
            "Yaşayan en büyük kurbağa Batı Afrika'da yaşayan Goliath kurbağasıdır",
        soruYaniti: true),
    Soru(
        soruMetni: "Bir karınca vücut ağırlığının 1.000 katını kaldırabilir",
        soruYaniti: false),
    Soru(soruMetni: "Ahtapotun yedi kalbi vardır", soruYaniti: false),
    Soru(soruMetni: "Keçi, İskoçya'nın ulusal hayvanıdır", soruYaniti: false),
    Soru(
        soruMetni: "Uzaya giden ilk insan dışı canlı bir maymundur",
        soruYaniti: false),
    Soru(soruMetni: "Güney Afrika'nın bir başkenti vardır", soruYaniti: false),
    Soru(
        soruMetni: "Atlas Okyanusu, Dünya'nın en büyük okyanusudur",
        soruYaniti: false),
    Soru(
        soruMetni: "Everest Dağı dünyanın en yüksek dağıdır", soruYaniti: true),
    Soru(
        soruMetni: "Çin Seddi'nin toplam uzunluğu 13.171 mildir",
        soruYaniti: true),
    Soru(
        soruMetni: "Dünyanın en uzun iki nehri Mississippi ve Nil'dir",
        soruYaniti: false),
    Soru(soruMetni: "Grönland dünyanın en büyük adasıdır", soruYaniti: true),
    Soru(
        soruMetni: "Güney Amerika'da Afrika'dan daha fazla ülke var",
        soruYaniti: false),
    Soru(
        soruMetni: "Çin dünyanın en uzun kıyı şeridine sahip ülkesidir",
        soruYaniti: false),
    Soru(soruMetni: "Vatikan dünyanın en küçük ülkesidir", soruYaniti: true),
  ];

  //sınıflara ait metodlara da fonk diyorduk.

  //buradaki amaç yeni bir metod oluşturup
  //bunu diğer sınıflarda kullanmak ama sadece bizim istediğimiz
  //alanların kullanılacağı şekilde oluşturmak.
  //yani burada ki metod bu sınıfın görevlisi gibi
  //bu yapılan işleme KAPSÜLLEME DENİR.

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void soruArttirici() {
    //burada listedeki sorular biterse kontrolü
    if (_soruIndex + 1 /*index 0 dan başladığı için*/ < _soruBankasi.length) {
      _soruIndex++;
    }
  }

//burada son soruda mıyız onu kontrol ediyoruz.
  bool testBittiMi() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _soruIndex = 0;
  }
}
