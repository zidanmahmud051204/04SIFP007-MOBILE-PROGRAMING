import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const ShopeeApp());
}

class ShopeeApp extends StatelessWidget {
  const ShopeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEE4D2D)),
        useMaterial3: true,
      ),
      home: const ShopeeHomePage(),
    );
  }
}

class ShopeeHomePage extends StatefulWidget {
  const ShopeeHomePage({super.key});

  @override
  State<ShopeeHomePage> createState() => _ShopeeHomePageState();
}

class _ShopeeHomePageState extends State<ShopeeHomePage> {
  int _selectedIndex = 0;
  int _bannerIndex = 0;
  late Timer _countdownTimer;
  late Timer _bannerTimer;
  int _countdownSeconds = 10647; // 2:57:27

  final Color shopeeOrange = const Color(0xFFEE4D2D);

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.flash_on, 'label': 'Flash Sale', 'color': Color(0xFFFF7043)},
    {'icon': Icons.card_giftcard, 'label': 'Voucher', 'color': Color(0xFF43A047)},
    {'icon': Icons.account_balance_wallet, 'label': 'Bayar', 'color': Color(0xFF1976D2)},
    {'icon': Icons.payment, 'label': 'ShopeePay', 'color': Color(0xFFF9A825)},
    {'icon': Icons.location_on, 'label': 'Toko Lokal', 'color': Color(0xFFE91E63)},
    {'icon': Icons.checkroom, 'label': 'Fashion', 'color': Color(0xFF8E24AA)},
    {'icon': Icons.devices, 'label': 'Elektronik', 'color': Color(0xFF00897B)},
    {'icon': Icons.restaurant, 'label': 'Makanan', 'color': Color(0xFFFB8C00)},
    {'icon': Icons.health_and_safety, 'label': 'Kesehatan', 'color': Color(0xFF3949AB)},
    {'icon': Icons.more_horiz, 'label': 'Lainnya', 'color': Color(0xFF757575)},
  ];

  final List<Map<String, dynamic>> _flashSaleItems = [
    {'emoji': '👟', 'price': 'Rp89.000', 'original': 'Rp270.000', 'discount': '-67%', 'sold': 0.8, 'color': Color(0xFFFFF0ED)},
    {'emoji': '📱', 'price': 'Rp1.299.000', 'original': 'Rp2.399.000', 'discount': '-45%', 'sold': 0.6, 'color': Color(0xFFE3F2FD)},
    {'emoji': '👗', 'price': 'Rp45.000', 'original': 'Rp100.000', 'discount': '-55%', 'sold': 0.4, 'color': Color(0xFFF3E5F5)},
    {'emoji': '🎧', 'price': 'Rp199.000', 'original': 'Rp320.000', 'discount': '-38%', 'sold': 0.25, 'color': Color(0xFFE8F5E9)},
    {'emoji': '⌚', 'price': 'Rp350.000', 'original': 'Rp650.000', 'discount': '-46%', 'sold': 0.55, 'color': Color(0xFFFFF8E1)},
  ];

  final List<Map<String, dynamic>> _products = [
    {'emoji': '👟', 'name': 'Sepatu Sneakers Pria Casual Sport Premium', 'price': 'Rp89.000', 'rating': 4.9, 'sold': '1.2rb', 'tag': 'Gratis Ongkir', 'color': Color(0xFFFFF0ED)},
    {'emoji': '💻', 'name': 'Laptop Stand Aluminium Adjustable Portable', 'price': 'Rp125.000', 'rating': 4.7, 'sold': '890', 'tag': 'Best Seller', 'color': Color(0xFFE8F5E9)},
    {'emoji': '👗', 'name': 'Dress Wanita Korean Style Midi Floral Terbaru', 'price': 'Rp65.000', 'rating': 4.8, 'sold': '2.4rb', 'tag': 'Baru', 'color': Color(0xFFF3E5F5)},
    {'emoji': '🎧', 'name': 'Headphone Bluetooth Wireless Bass Booster', 'price': 'Rp199.000', 'rating': 4.6, 'sold': '3.1rb', 'tag': 'Flash Sale', 'color': Color(0xFFE3F2FD)},
    {'emoji': '🧴', 'name': 'Skincare Set Vitamin C Brightening Series', 'price': 'Rp175.000', 'rating': 4.8, 'sold': '5.6rb', 'tag': 'Terlaris', 'color': Color(0xFFFCE4EC)},
    {'emoji': '📚', 'name': 'Novel Best Seller 2024 Koleksi Terlengkap', 'price': 'Rp55.000', 'rating': 4.5, 'sold': '432', 'tag': 'Gratis Ongkir', 'color': Color(0xFFFFF3E0)},
  ];

  @override
  void initState() {
    super.initState();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownSeconds > 0) _countdownSeconds--;
      });
    });
    _bannerTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _bannerIndex = (_bannerIndex + 1) % 4;
      });
    });
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    _bannerTimer.cancel();
    super.dispose();
  }

  String get _countdownText {
    int h = _countdownSeconds ~/ 3600;
    int m = (_countdownSeconds % 3600) ~/ 60;
    int s = _countdownSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildPromoBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildBanner(),
                    _buildCategories(),
                    _buildFlashSale(),
                    _buildProductSection(),
                  ],
                ),
              ),
            ),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: shopeeOrange,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(Icons.search, size: 18, color: Colors.grey[400]),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Cari di Shopee',
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: Color(0xFFEEEEEE))),
                    ),
                    child: Icon(Icons.camera_alt_outlined, size: 18, color: shopeeOrange),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('3', style: TextStyle(fontSize: 9, color: shopeeOrange, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 24),
        ],
      ),
    );
  }

  Widget _buildPromoBar() {
    return Container(
      color: const Color(0xFFD63B1F),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _promoChip('GRATIS ONGKIR'),
          const Text(' | ', style: TextStyle(color: Colors.white54, fontSize: 10)),
          _promoChip('VOUCHER DISKON'),
          const Text(' | ', style: TextStyle(color: Colors.white54, fontSize: 10)),
          _promoChip('COD TERSEDIA'),
        ],
      ),
    );
  }

  Widget _promoChip(String text) {
    return Text(text, style: const TextStyle(color: Color(0xFFFFD54F), fontSize: 10, fontWeight: FontWeight.w500));
  }

  Widget _buildBanner() {
    final List<Color> bannerColors = [
      const Color(0xFFFF7043),
      const Color(0xFF42A5F5),
      const Color(0xFF66BB6A),
      const Color(0xFFAB47BC),
    ];
    final List<String> bannerTitles = ['Harbolnas 12.12', 'Super Brand Day', 'Gratis Ongkir', 'Flash Deal'];
    final List<String> bannerSubs = ['Diskon s/d 90%', 'Brand terpercaya', 'Tanpa min. belanja', 'Penawaran terbatas'];

    return Container(
      color: shopeeOrange,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 120,
              color: bannerColors[_bannerIndex],
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bannerTitles[_bannerIndex],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text(bannerSubs[_bannerIndex],
                            style: const TextStyle(fontSize: 11, color: Colors.white70)),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('Belanja Sekarang', style: TextStyle(fontSize: 11, color: bannerColors[_bannerIndex], fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60, height: 60,
                          decoration: const BoxDecoration(color: Color(0x33FFFFFF), shape: BoxShape.circle),
                          child: const Center(child: Text('🎁', style: TextStyle(fontSize: 30))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: i == _bannerIndex ? 14 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: i == _bannerIndex ? Colors.white : Colors.white38,
                borderRadius: BorderRadius.circular(3),
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 8),
      child: GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
        children: _categories.map((cat) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    color: (cat['color'] as Color).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(cat['icon'] as IconData, color: cat['color'] as Color, size: 22),
                ),
                const SizedBox(height: 4),
                Text(cat['label'] as String,
                    style: const TextStyle(fontSize: 9, color: Color(0xFF555555)),
                    textAlign: TextAlign.center,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFlashSale() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Text('Flash Sale', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: shopeeOrange)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(4)),
                child: Text(_countdownText, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              Text('Lihat semua >', style: TextStyle(fontSize: 11, color: shopeeOrange)),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: _flashSaleItems.length,
            itemBuilder: (context, index) {
              final item = _flashSaleItems[index];
              return Container(
                width: 90,
                margin: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 90, width: 90,
                          decoration: BoxDecoration(
                            color: item['color'] as Color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(child: Text(item['emoji'] as String, style: const TextStyle(fontSize: 36))),
                        ),
                        Positioned(
                          bottom: 0, left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: shopeeOrange,
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(4)),
                            ),
                            child: Text(item['discount'] as String,
                                style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(item['price'] as String,
                        style: TextStyle(fontSize: 12, color: shopeeOrange, fontWeight: FontWeight.bold)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: item['sold'] as double,
                        backgroundColor: const Color(0xFFFFDDD7),
                        color: shopeeOrange,
                        minHeight: 4,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildProductSection() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              const Text('Produk Pilihan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text('Lihat semua >', style: TextStyle(fontSize: 11, color: shopeeOrange)),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final p = _products[index];
            return Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: p['color'] as Color,
                        child: Center(child: Text(p['emoji'] as String, style: const TextStyle(fontSize: 52))),
                      ),
                      Positioned(
                        top: 0, left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: shopeeOrange,
                            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(4)),
                          ),
                          child: Text(p['tag'] as String,
                              style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p['name'] as String,
                            style: const TextStyle(fontSize: 12, color: Color(0xFF333333)),
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Text(p['price'] as String,
                            style: TextStyle(fontSize: 14, color: shopeeOrange, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.star, size: 12, color: Colors.amber[700]),
                            Text(' ${p['rating']} | Terjual ${p['sold']}',
                                style: const TextStyle(fontSize: 10, color: Color(0xFF888888))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.grid_view, 'label': 'Kategori'},
      {'icon': Icons.notifications_outlined, 'label': 'Notifikasi'},
      {'icon': Icons.chat_bubble_outline, 'label': 'Chat'},
      {'icon': Icons.person_outline, 'label': 'Saya'},
    ];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final active = _selectedIndex == i;
          return Expanded(
            child: GestureDetector(
              
              onTap: () => setState(() => _selectedIndex = i),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(items[i]['icon'] as IconData,
                        size: 22,
                        color: active ? shopeeOrange : const Color(0xFFAAAAAA)),
                    const SizedBox(height: 2),
                    Text(items[i]['label'] as String,
                        style: TextStyle(
                          fontSize: 9,
                          color: active ? shopeeOrange : const Color(0xFFAAAAAA),
                        )),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}