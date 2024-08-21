import 'package:bilgi_yarismasi/constantsClass.dart';
import 'package:bilgi_yarismasi/veriClass.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BİLGİ YARIŞMASI")),
          backgroundColor: Colors.amber[600],
        ),
        backgroundColor: Colors.blue[50],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [
    //kDogruIcon, kDogruIcon, normalde bu iki ıcon burada tutuluyor.
    //ama liste boş olması gerekiyor ki yanlış veya doğru seçildiği zaman
    //row kısmına ıconlar sırayla eklenmesi gerekiyor ve eklenenler
    //runtime da bu liste içine eklenip,program durunca tekrar silinecek.
  ];
  //veriClass dosyasının içinde ki veriler sınıfından bir obje yaratmamız gerekiyor.
  //
  veriler veri1 = veriler();

  void butonFonk(
      bool
          secilenButon /* bunun amacı true/false alan veriyi butona göre kararlaştırmak */) {
    if (veri1.testBittiMi() == true) {
      //alertdiaolog göster
      //yani uyarı mesajı göster
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Test Bitti'),
            content: Text('Tebrikler Testi Bitirdiniz.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();

                  setState(() {
                    veri1.testiSifirla(); //indexi sıfırla
                    secimler = []; //seçimleri sıfıla
                  });
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    //TEST BİTMEDİYSE BU KISIMA GEÇ.
    else {
      setState(() {
        //burada yanıtlar listesinde ki soru indexini getirip
        //o indexteki değer false mı diye kontrol sağladıktan sonra
        // turnery ile kontrol sağladık.
        if (veri1.getSoruYaniti() == true) {
          //burada da sorubankası listesinin .. indexine ulaş ve oradaki
          //soru yanıtını karşılaştır.
          secimler.add(kDogruIcon);
        } else {
          secimler.add(kYanlisIcon);
        }

        /*
      veri1.getSoruYaniti() == false
                              burada da sorubankası listesinin .. indexine ulaş ve oradaki
                              soru yanıtını karşılaştır.
                              / ? secimler.add(kDogruIcon)
                              : secimler.add(kYanlisIcon);
      */

        veri1.soruArttirici();
        //soruIndex++; //önceki kullanımı. sonradan kapsülleme yaptık
        // ve veriClass dosyası içinden metod ile döndürdük.

        // burada soruyu diğerine geçmek için index değerini 1 arttırıyoruz.
        //hem tetikleme olup hem de ekranın aynı renkte aynı özellikte kalması
        //gerekiyor, bu yüzden setState kullanımı yapmalıyız ki gerekli olanlar gerçekleştirilsin.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //soruları göstermek için
                //veriClass içindeki veriler sınıfından bir türetme yaptık.
                //veriler veri1 = veriler();
                //burada ki amaç veriler i burada da türeterek kullanmak.
                //veri 1 de ki
                //sorubankası listesini çağırıp içine soru indexini veriyoruz.
                //o listeden de soru metni olan kısmı alıyoruz. ekrana veriyoruz.
                //BURADA ÖNCEDEN KULLANIM BU ŞEKİLDEYDİ. KAPSÜLLEME YAPTIK VE DEĞİŞTİ.
                //veri1.soruBankasi[soruIndex].soruMetni,

                veri1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: GoogleFonts.aDLaMDisplay(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //Normalde row kullanırken satır dışına taşma olduğu için
          // wrap kullandım.
          // wrap normalde yatay çalışır.
          // direction ile dikey de çalışır hale getirebiliriz.
          //
          // alignment: WrapAlignment.center, -->bu da dizilim şeklini değiştirir.
          // soldan başla,sağdan veya ortadan dizime başla için kullanılır.
          //
          runSpacing: 1, //yatayda gelen veriler arasına boşluk verir.
          spacing: 1, // dikey olarak gelen verilere boşluk verir.
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      onPressed: () {
                        butonFonk(true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        iconColor: Colors.white,
                        padding: EdgeInsets.all(12),
                        elevation: 12.0,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      onPressed: () {
                        butonFonk(false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[700],
                        padding: EdgeInsets.all(12),
                        elevation: 12.0,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                      child: const Icon(
                        Icons.cancel,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
