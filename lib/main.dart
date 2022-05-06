import 'dart:async';
import 'package:flutter/material.dart';

import 'dart:convert';

// import this to easily send HTTP request
import 'package:http/http.dart' as http;

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
                  Image.asset("assets/teknisionline.png"),
                  const Text('Teknisi Online'),
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
                    borderRadius: BorderRadius.circular(6),
                    image: const DecorationImage(
                        image: AssetImage("assets/wallpaper.jpg"),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(
                        "assets/teknisionline.png",
                        height: 100,
                      ),
                      const SizedBox(
                        height: 15,
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
                              borderRadius: BorderRadius.circular(6),
                              color: const Color.fromRGBO(0, 0, 0, .7)),
                          child: const Center(
                              child: Text(
                            "Panggil Teknisi",
                            style: TextStyle(
                                color: Colors.white,
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
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const PembayaranPage()));
                    },
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/dompet.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(0, 42),
                          child: Center(
                              child: Text(
                            "Pembayaran",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const OrderPage()));
                    },
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/pemanggilan.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(0, 42),
                          child: Center(
                              child: Text(
                            "Pemanggilan",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HelpdeskPage()));
                    },
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/telepon.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(0, 42),
                          child: Center(
                              child: Text(
                            "Helpdesk",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const BantuanPage()));
                    },
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/bantuan.png"),
                                fit: BoxFit.cover)),
                        child: Transform.translate(
                          offset: const Offset(0, 42),
                          child: Center(
                              child: Text(
                            "Bantuan",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold),
                          )),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
                                image: AssetImage("assets/komputer.png"),
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
  List snapshot = [];
  Future<List> _loadData() async {
    List posts = [];
    try {
      // This is an open REST API endpoint for testing purposes
      const api = 'https://jsonplaceholder.typicode.com/posts';

      final http.Response response = await http.get(Uri.parse(api));
      posts = json.decode(response.body);
    } catch (err) {
      //print(err);
      //https://www.kindacode.com/article/flutter-futurebuilder/
    }

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Riwayat Teknisi"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Reload',
                onPressed: () {
                  setState(() {
                    snapshot = [];
                    _loadData();
                  });
                },
              ),
            ]),
        body: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) =>
                snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) => Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: const Image(
                                image: AssetImage("assets/teknisionline.png")),
                            title: Text(snapshot.data![index]['title']),
                            subtitle: Text(snapshot.data![index]['body']),
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )));
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
                        return 'Alamat Belum Diisi';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: dropdownValue1,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.blue),
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
                      'Jakarta Timur',
                      'Jakarta Utara'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: [
                      if (dropdownValue1 == "Jakarta Barat") ...[
                        DropdownButtonFormField<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: const TextStyle(color: Colors.blue),
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
                          style: const TextStyle(color: Colors.blue),
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
                          style: const TextStyle(color: Colors.blue),
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
                          style: const TextStyle(color: Colors.blue),
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
                          style: const TextStyle(color: Colors.blue),
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
                          style: const TextStyle(color: Colors.blue),
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

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue1 = 'Pilih';
  String dropdownValue2 = 'Pilih';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Pembayaran")),
        body: Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                child: ListTile(
                  leading: Image(image: AssetImage("assets/dompet.png")),
                  title: Text('Rp. 0,-'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Nomor HP Pengirim :'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nomor HP Pengirim Belum Diisi';
                                }
                                return null;
                              },
                            ),
                            DropdownButtonFormField<String>(
                              value: dropdownValue1,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.blue),
                              onChanged: (String? newValue) {
                                setState(() {
                                  if (dropdownValue1 != newValue) {
                                    dropdownValue2 = 'Pilih';
                                  }
                                  dropdownValue1 = newValue!;
                                });
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Pilih Metode Pembayaran :'),
                              validator: (value) {
                                if (value == "Pilih") {
                                  return 'Metode Pembayaran Belum Dipilih';
                                }
                                return null;
                              },
                              items: <String>[
                                'Pilih',
                                'DANA',
                                'Gopay',
                                'LinkAja',
                                'OVO'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Column(
                              children: [
                                if (dropdownValue1 == "DANA") ...[
                                  const Card(
                                    child: ListTile(
                                      leading: Image(
                                          image:
                                              AssetImage("assets/logodana.png"),
                                          height: 10),
                                      title: Text(
                                          "Nomor DANA Teknisi Online : 080000000000"),
                                    ),
                                  ),
                                ] else if (dropdownValue1 == "Gopay") ...[
                                  const Card(
                                    child: ListTile(
                                      leading: Image(
                                          image: AssetImage(
                                              "assets/logogopay.png"),
                                          height: 10),
                                      title: Text(
                                          "Nomor Gopay Teknisi Online : 080000000000"),
                                    ),
                                  ),
                                ] else if (dropdownValue1 == "LinkAja") ...[
                                  const Card(
                                    child: ListTile(
                                      leading: Image(
                                          image: AssetImage(
                                              "assets/logolinkaja.png"),
                                          height: 20),
                                      title: Text(
                                          "Nomor LinkAja Teknisi Online : 080000000000"),
                                    ),
                                  ),
                                ] else if (dropdownValue1 == "OVO") ...[
                                  const Card(
                                    child: ListTile(
                                      leading: Image(
                                          image:
                                              AssetImage("assets/logoovo.png"),
                                          height: 10),
                                      title: Text(
                                          "Nomor OVO Teknisi Online : 080000000000"),
                                    ),
                                  ),
                                ] else
                                  ...[],
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ])))
            ],
          ),
        ));
  }
}

class HelpdeskPage extends StatefulWidget {
  const HelpdeskPage({Key? key}) : super(key: key);

  @override
  _HelpdeskPageState createState() => _HelpdeskPageState();
}

class _HelpdeskPageState extends State<HelpdeskPage> {
  List snapshot = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollcontroller = ScrollController();

  Future<List> _loadData() async {
    List posts = [];
    try {
      // This is an open REST API endpoint for testing purposes
      const api = 'https://jsonplaceholder.typicode.com/posts';

      final http.Response response = await http.get(Uri.parse(api));
      posts = json.decode(response.body);
    } catch (err) {
      //print(err);
      //https://www.kindacode.com/article/flutter-futurebuilder/
    }

    return posts;
  }

  @override
  void initState() {
    super.initState();
  }

  void _scrollDown() {
    _scrollcontroller.jumpTo(_scrollcontroller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Helpdesk"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Reload',
              onPressed: () {
                setState(() {
                  snapshot = [];
                  _loadData();
                  _scrollDown();
                });
              },
            ),
          ]),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder(
                  future: _loadData(),
                  builder: (BuildContext ctx, AsyncSnapshot snapshot) =>
                      snapshot.hasData
                          ? ListView.builder(
                              controller: _scrollcontroller,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, index) =>
                                  Card(
                                margin: const EdgeInsets.all(10),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(10),
                                  leading: const Image(
                                      image: AssetImage(
                                          "assets/teknisionline.png")),
                                  title: Text(snapshot.data![index]['title']),
                                  subtitle: Text(snapshot.data![index]['body']),
                                ),
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            )),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
                child: Column(children: <Widget>[
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: 'Pesan :',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                //_controller.text = _controller.text.toString() + '123';
                                _controller.clear();
                                _loadData();
                                _scrollDown();
                              });
                            },
                            icon: const Icon(Icons.send))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pesan Belum Diisi';
                      }
                      return null;
                    },
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}

class BantuanPage extends StatefulWidget {
  const BantuanPage({Key? key}) : super(key: key);

  @override
  _BantuanPageState createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Bantuan")),
        body: Container());
  }
}
