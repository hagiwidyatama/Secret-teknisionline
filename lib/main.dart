import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teknisi Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LauncherPage(),
      routes: <String, WidgetBuilder>{
        //'/login': (BuildContext context) => new LoginPage(),
        '/landing': (BuildContext context) => const LandingPage(),
      },
    );
  }
}

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 3);
    Timer(duration, () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const LandingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/repair.png"),
                  const Text('Launcher'),
                ]),
          )),
    ));
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  final List<Widget> _container = [
    const Beranda(),
    const Produk(),
    const Riwayat(),
    const Akun()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _container[_bottomNavCurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _bottomNavCurrentIndex = index;
            });
          },
          currentIndex: _bottomNavCurrentIndex,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
              ),
              label: 'Produk',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.assignment,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.assignment_outlined,
                color: Colors.grey,
              ),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.people,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.people_outlined,
                color: Colors.grey,
              ),
              label: 'Akun',
            )
          ],
        ));
  }
}

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Teknisi Online"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/repair.png"),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Text(
                        "Teknisi Handal",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const OrderPage()));
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            "Panggil Teknisi",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage("assets/repair.png"),
                              fit: BoxFit.cover)),
                      child: Transform.translate(
                        offset: const Offset(50, -50),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 65, vertical: 63),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Icon(
                            Icons.bookmark_border,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage("assets/repair.png"),
                              fit: BoxFit.cover)),
                      child: Transform.translate(
                        offset: const Offset(50, -50),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 65, vertical: 63),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Icon(
                            Icons.bookmark_border,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage("assets/repair.png"),
                              fit: BoxFit.cover)),
                      child: Transform.translate(
                        offset: const Offset(50, -50),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 65, vertical: 63),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Icon(
                            Icons.bookmark_border,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage("assets/repair.png"),
                              fit: BoxFit.cover)),
                      child: Transform.translate(
                        offset: const Offset(50, -50),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 65, vertical: 63),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Icon(
                            Icons.bookmark_border,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Produk extends StatefulWidget {
  const Produk({Key? key}) : super(key: key);

  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Produk")),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  children: [
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage("assets/repair.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(50, -50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Icon(
                              Icons.bookmark_border,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Riwayat Teknisi")),
        body: SafeArea(
          child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Order'),
                    ]),
              )),
        ));
  }
}

class Akun extends StatefulWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Akun")),
        body: SafeArea(
          child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Akun'),
                    ]),
              )),
        ));
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue1 = 'Pilih';
  String dropdownValue2 = 'Pilih';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Panggil Teknisi")),
        body: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Alamat :'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat belum diisi';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: dropdownValue1,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (dropdownValue1 != newValue) {
                          dropdownValue2 = 'Pilih';
                        }
                        dropdownValue1 = newValue!;
                      });
                    },
                    decoration:
                        const InputDecoration(labelText: 'Pilih Kota :'),
                    validator: (value) {
                      if (value == "Pilih") {
                        return 'Kota Belum Dipilih';
                      }
                      return null;
                    },
                    items: <String>[
                      'Pilih',
                      'Jakarta Barat',
                      'Jakarta Pusat',
                      'Jakarta Selatan',
                      'Jakarta Timur'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: [
                      // Only one of the children will be shown based on `beforeSunset` condition
                      if (dropdownValue1 == "Jakarta Barat") ...[
                        DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'Pilih Kecamatan :'),
                          validator: (value) {
                            if (value == "Pilih") {
                              return 'Kecamatan Belum Dipilih';
                            }
                            return null;
                          },
                          items: <String>[
                            'Pilih',
                            'Cengkareng',
                            'Grogol',
                            'Petamburan',
                            'Taman Sari',
                            'Tambora',
                            'Kebon Jeruk',
                            'Kalideres',
                            'Palmerah',
                            'Kembangan'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ] else if (dropdownValue1 == "Jakarta Pusat") ...[
                        DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'Pilih Kecamatan :'),
                          validator: (value) {
                            if (value == "Pilih") {
                              return 'Kecamatan Belum Dipilih';
                            }
                            return null;
                          },
                          items: <String>[
                            'Pilih',
                            'Cempaka Putih',
                            'Gambir',
                            'Johar Baru',
                            'Kemayoran',
                            'Menteng',
                            'Sawah Besar',
                            'Senen',
                            'Tanah Abang'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ] else if (dropdownValue1 == "Jakarta Selatan") ...[
                        DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'Pilih Kecamatan :'),
                          validator: (value) {
                            if (value == "Pilih") {
                              return 'Kecamatan Belum Dipilih';
                            }
                            return null;
                          },
                          items: <String>[
                            'Pilih',
                            'Cilandak',
                            'Jagakarsa',
                            'Kebayoran Baru',
                            'Kebayoran Lama',
                            'Mampang Prapatan',
                            'Pancoran',
                            'Pasar Minggu',
                            'Pesanggrahan',
                            'Setiabudi',
                            'Tebet'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ] else if (dropdownValue1 == "Jakarta Timur") ...[
                        DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'Pilih Kecamatan :'),
                          validator: (value) {
                            if (value == "Pilih") {
                              return 'Kecamatan Belum Dipilih';
                            }
                            return null;
                          },
                          items: <String>[
                            'Pilih',
                            'Cakung',
                            'Cipayung',
                            'Ciracas',
                            'Duren Sawit',
                            'Jatinegara',
                            'Kramat Jati',
                            'Makasar',
                            'Matraman',
                            'Pasar Rebo',
                            'Pulo Gadung'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ] else if (dropdownValue1 == "Jakarta Utara") ...[
                        DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'Pilih Kecamatan :'),
                          validator: (value) {
                            if (value == "Pilih") {
                              return 'Kecamatan Belum Dipilih';
                            }
                            return null;
                          },
                          items: <String>[
                            'Pilih',
                            'Cilincing',
                            'Kelapa Gading',
                            'Koja',
                            'Pademangan',
                            'Penjaringan',
                            'Tanjung Priok'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ] else ...[
                        DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                              labelText: 'Pilih Kecamatan :'),
                          validator: (value) {
                            if (value == "Pilih") {
                              return 'Kecamatan Belum Dipilih';
                            }
                            return null;
                          },
                          items: <String>['Pilih']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            )));
  }
}
