class TokoUser {
  final String nama;
  final String alamat;
  final String telepon;
  final String status;
  final String username;
  final String password;
  final String akses;

  TokoUser({
    this.nama,
    this.alamat,
    this.telepon,
    this.status,
    this.username,
    this.password,
    this.akses,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'alamat': alamat,
      'telepon': telepon,
      'status': status,
      'username': username,
      'password': password,
      'akses': akses,
    };
  }
}
