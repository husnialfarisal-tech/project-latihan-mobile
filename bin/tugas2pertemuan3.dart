import 'dart:io';

void main() {
  stdout.write('Masukan Skor Mahasiswa :  ');
  String? input = stdin.readLineSync();

  // Cek apakah input null atau bukan angka
  if (input == null || input.isEmpty || int.tryParse(input) == null) {
    print('Input tidak valid. Masukkan angka antara 0 hingga 100.');
    return;
  }

  int Skor = int.parse(input);

  // Cek range nilai
  if (Skor < 0 || Skor > 100) {
    print('Input tidak valid. Masukkan angka antara 0 hingga 100.');
    return;
  }

  String Grade = '';
  if (Skor >= 85) {
    Grade = 'A';
  } else if (Skor >= 70) {
    Grade = 'B';
  } else if (Skor >= 60) {
    Grade = 'C';
  } else if (Skor >= 50) {
    Grade = 'D';
  } else {
    Grade = 'E';
  }

  print('Skor Mahasiswa : $Skor');
  print('Grade Mahasiswa : $Grade');
}
