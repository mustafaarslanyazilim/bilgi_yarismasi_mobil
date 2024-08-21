import 'package:flutter/material.dart';

class Soru {
  String soruMetni;
  bool soruYaniti;

  //required kelimesi ile zorunlu olarak değer girilmesi gerekecek.
  //yani soru parametresi çağırılırsa içine değerleri de girilmesi gerekiyor.
  Soru({required this.soruMetni, required this.soruYaniti});
}
