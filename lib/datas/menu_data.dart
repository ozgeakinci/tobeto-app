import 'package:flutter/material.dart';
import 'package:tobeto_app/models/menu_model.dart';
import 'package:tobeto_app/models/courses.dart';

final menus = [
  MenuModel(name: "Ana Sayfa", menuIcon: const Icon(Icons.chevron_right)),
  MenuModel(
      name: "Değerlendirmeler", menuIcon: const Icon(Icons.chevron_right)),
  MenuModel(name: "Profilim", menuIcon: const Icon(Icons.chevron_right)),
  MenuModel(name: "Katalog", menuIcon: const Icon(Icons.chevron_right)),
  MenuModel(name: "Takvim", menuIcon: const Icon(Icons.chevron_right)),
];



// Sahte kurs verilerini depolamak ve sağlamak için kullanılan bir sınıf
class CourseData {
  static List<CourseModel> courses = [
    CourseModel(
      name: 'Dinle, Anla, İfade Et: Etkili İletişim Gelişim Yolculuğu',
      instructor: 'Gürkan İlişen',    
      duration: '2 Saat 30 Dakika',
      releaseDate: DateTime(2024, 1, 4), // Örnek bir tarih
    ),
    CourseModel(
      name: 'Bilim ve Teknoloji',
      instructor: 'Dr. Ayşe',
      duration: '1 Saat 45 Dakika',
      releaseDate: DateTime(2024, 1, 1), // Örnek bir tarih
    ),
    // Diğer sahte ders verileri buraya eklenebilir
  ];

  static String formattedDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year.toString()}';
  }
}
