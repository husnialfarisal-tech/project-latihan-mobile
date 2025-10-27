import 'dart:math';

// ====== KELAS ABSTRAK TRANSPORTASI ======
abstract class Transportasi {
String id;
String nama;
double _tarifDasar;
int kapasitas;

Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

double get tarifDasar => _tarifDasar;

double hitungTarif(int jumlahPenumpang);
void tampilInfo();
}

// ====== KELAS TAKSI ======
class Taksi extends Transportasi {
double jarak;

Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
: super(id, nama, tarifDasar, kapasitas);

@override
double hitungTarif(int jumlahPenumpang) {
return tarifDasar * jarak;
}

@override
void tampilInfo() {
print("Taksi: $nama | ID: $id | Tarif Dasar: $tarifDasar | Jarak: ${jarak}km");
}
}

// ====== KELAS BUS ======
class Bus extends Transportasi {
bool adaWifi;

Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
: super(id, nama, tarifDasar, kapasitas);

@override
double hitungTarif(int jumlahPenumpang) {
return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
}

@override
void tampilInfo() {
print("Bus: $nama | ID: $id | Tarif Dasar: $tarifDasar | Wifi: ${adaWifi ? 'Ya' : 'Tidak'}");
}
}

// ====== KELAS PESAWAT ======
class Pesawat extends Transportasi {
String kelas;

Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
: super(id, nama, tarifDasar, kapasitas);

@override
double hitungTarif(int jumlahPenumpang) {
return tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);
}

@override
void tampilInfo() {
print("Pesawat: $nama | ID: $id | Tarif Dasar: $tarifDasar | Kelas: $kelas");
}
}

// ====== KELAS PEMESANAN ======
class Pemesanan {
String idPemesanan;
String namaPelanggan;
Transportasi transportasi;
int jumlahPenumpang;
double totalTarif;

Pemesanan(this.idPemesanan, this.namaPelanggan, this.transportasi,
this.jumlahPenumpang, this.totalTarif);

void cetakStruk() {
print("===== STRUK PEMESANAN =====");
print("Kode Pemesanan : $idPemesanan");
print("Nama Pelanggan : $namaPelanggan");
print("Transportasi   : ${transportasi.nama}");
print("Jumlah Penumpang: $jumlahPenumpang");
print("Total Tarif    : Rp${totalTarif.toStringAsFixed(2)}");
print("============================\n");
}

Map<String, dynamic> toMap() {
return {
'idPemesanan': idPemesanan,
'namaPelanggan': namaPelanggan,
'transportasi': transportasi.nama,
'jumlahPenumpang': jumlahPenumpang,
'totalTarif': totalTarif
};
}
}

// ====== FUNGSI GLOBAL ======
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
String id = "P${Random().nextInt(1000)}";
double total = t.hitungTarif(jumlahPenumpang);
Pemesanan p = Pemesanan(id, nama, t, jumlahPenumpang, total);
return p;
}

void tampilSemuaPemesanan(List<Pemesanan> daftar) {
print("======= DAFTAR SEMUA PEMESANAN =======");
for (var p in daftar) {
p.cetakStruk();
}
}

// ====== MAIN PROGRAM ======
void main() {
// Membuat beberapa objek transportasi
Taksi taksi1 = Taksi("T001", "BlueBird", 7000, 4, 10);
Bus bus1 = Bus("B001", "TransJakarta", 3000, 40, true);
Pesawat pesawat1 = Pesawat("P001", "Garuda Indonesia", 1000000, 200, "Bisnis");

// Membuat beberapa pemesanan
List<Pemesanan> daftarPemesanan = [];

Pemesanan p1 = buatPemesanan(taksi1, "husni", 1);
Pemesanan p2 = buatPemesanan(bus1, "hazza", 5);
Pemesanan p3 = buatPemesanan(pesawat1, "rivai", 2);

daftarPemesanan.addAll([p1, p2, p3]);

// Menampilkan semua transaksi
tampilSemuaPemesanan(daftarPemesanan);
}
