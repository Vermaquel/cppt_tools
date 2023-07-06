import 'package:cppt_tools/sys_data/models/diagnose_entity.dart';
import 'package:flutter/material.dart';

final keadaanUmum = <String>[
  "Baik",
  "Membaik",
  "Sedang",
  "Perburukan",
];
final kesadaran = <String>[
  "Compos mentis",
  "Dellerium",
  "Apatis",
  "Somnolence",
  "Sub coma",
  "Comma",
];

final diagnoseList = <DiagnoseEntity>[
  DiagnoseEntity(
    diagnose: 'Nyeri akut',
    planning: '''Manajemen nyeri
- Monitor TTV
- Monitor skala nyeri
- Ajarkan teknik relaksasi
- Kolaborasi dengan dokter''',
  ),
  DiagnoseEntity(
    diagnose: 'Pola napas tidak efektif',
    planning: '''Manajemen pola napas
- Monitor TTV
- Atur posisi semi fowler - fowler
- Motivasi napas dalam
- Kolaborasi dengan dokter''',
  ),
  DiagnoseEntity(
    diagnose: 'Bersihan jalan napas tidak efektif',
    planning: '''Manajemen jalan napas
- Monitor TTV
- Ajarkan batuk efektif
- Motivasi minum air hangat
- Kolaborasi dengan dokter''',
  ),
  DiagnoseEntity(
    diagnose: 'Diare',
    planning: '''Manajemen Diare
- Monitor TTV
- Monitor frekuensi, konsistensi BAB
- Motivasi minum cukup
- Kolaborasi dengan dokter''',
  ),
  DiagnoseEntity(
    diagnose: 'Hipertermi',
    planning: '''Manajemen Hipertermi
- Monitor TTV
- Patau tanda-tanda syok
- Motivasi minum cukup
- Kolaborasi dengan dokter ''',
  ),
  DiagnoseEntity(
    diagnose: 'Intoleransi Aktivitas',
    planning: '''Manajemen aktivitas
- Monitor TTV
- Monitor batasan aktivitas
- Kolaborasi dengan dokter''',
  ),
  DiagnoseEntity(
    diagnose: 'Gangguan rasa nyaman',
    planning: '''Manajemen aktivitas
- Monitor TTV
- Monitor rasa nyaman
- Ajarkan teknik relaksasi
- Kolaborasi dengan dokter''',
  ),
  DiagnoseEntity(
    diagnose: 'Defisit nutrisi',
    planning: '''Manajemen nutrisi
- Monitor TTV
- Monitor makan minum
- Anjurkan makan sedikit tapi sering
- Kolaborasi dengan dokter''',
  ),
  DiagnoseEntity(
    diagnose: 'Masalah teratasi',
    planning: '''Px PBJ
Px kontrol di Poli
Tgl ''',
  ),
];

// text style judul
const textStyleJudul = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
