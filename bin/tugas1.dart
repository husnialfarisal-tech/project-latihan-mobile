void main() {
  // Data karyawan
  String nama = "husni";
  int jamKerja = 22;
  double upahPerJam = 100000;
  bool statusTetap = true; // true = tetap, false = kontrak

  // Hitung gaji kotor
  double gajiKotor = jamKerja * upahPerJam;

  // Tentukan potongan pajak
  double pajak;
  if (statusTetap) {
    pajak = 0.10 * gajiKotor; // 10% untuk karyawan tetap
  } else {
    pajak = 0.05 * gajiKotor; // 5% untuk karyawan kontrak
  }

  // Hitung gaji bersih
  double gajiBersih = gajiKotor - pajak;

  // Tampilkan hasil dalam bentuk int
  print("=== Aplikasi Penghitung Gaji Karyawan Sederhana ===");
  print("Nama Karyawan : $nama");
  print("Jam Kerja     : $jamKerja jam/minggu");
  print("Upah per Jam  : Rp${upahPerJam.toInt()}");
  print("-----------------------------------");
  print("Gaji Kotor    : Rp${gajiKotor.toInt()}");
  print("Pajak         : Rp${pajak.toInt()}");
  print("Gaji Bersih   : Rp${gajiBersih.toInt()}");
}
