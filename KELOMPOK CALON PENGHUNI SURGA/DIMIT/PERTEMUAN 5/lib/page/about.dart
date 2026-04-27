import 'package:flutter/material.dart';

// ─── Warna Tema ────────────────────────────────────────────────────
const Color kGold = Color(0xFFC9A84C);
const Color kGoldFaint = Color(0x11C9A84C);
const Color kDarkBg = Color(0xFF0A0A0F);
const Color kDarkMid = Color(0xFF1A1428);
const Color kDarkBlue = Color(0xFF0D1A2E);

// ─── Data Anggota — GANTI SESUAI DATA ASLI ─────────────────────────
class _MemberData {
  final String initials;
  final String name;
  final String nim;
  const _MemberData({required this.initials, required this.name, required this.nim});
}

const List<_MemberData> kMembers = [
  _MemberData(initials: 'A1', name: 'Nama Anggota 1', nim: 'NIM: 241011700269'),
  _MemberData(initials: 'A2', name: 'Nama Anggota 2', nim: 'NIM: 0000000002'),
  _MemberData(initials: 'A3', name: 'Nama Anggota 3', nim: 'NIM: 0000000003'),
  _MemberData(initials: 'A4', name: 'Nama Anggota 4', nim: 'NIM: 0000000004'),
];

// ─── About Page ────────────────────────────────────────────────────
class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F0),
      body: CustomScrollView(
        slivers: [
          // ── Sliver App Bar Hero ──
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: kDarkBg,
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                    border: Border.all(color: kGold.withOpacity(0.5), width: 0.5),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, color: kGold, size: 16),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(background: _HeroHeader()),
          ),

          // ── Konten ──
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Stat row
                _StatCard(),
                const SizedBox(height: 16),

                // Tentang Kelompok
                _SectionCard(
                  label: 'TENTANG KAMI',
                  child: const Text(
                    'Kami adalah Kelompok 4 — sekumpulan mahasiswa Mobile Programming '
                    'yang hadir bukan sekadar untuk memenuhi tugas, tetapi untuk '
                    'memberikan yang terbaik di setiap baris kode yang kami tuliskan.\n\n'
                    'Dengan semangat yang membara, tekad yang bulat, dan keyakinan '
                    'bahwa kerja keras tidak akan mengkhianati hasil, kami melangkah '
                    'bersama sebagai satu tim yang solid. Bagi kami, ini bukan hanya '
                    'soal nilai — ini soal kebanggaan, dedikasi, dan persaudaraan '
                    'yang terjalin indah sepanjang perjalanan perkuliahan ini.',
                    style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.85, letterSpacing: 0.3),
                  ),
                ),
                const SizedBox(height: 16),

                // Visi & Misi
                _SectionCard(
                  label: 'VISI & MISI',
                  child: Column(
                    children: [
                      _VisiMisiItem(
                        icon: Icons.star_rounded,
                        title: 'Visi',
                        desc: 'Menjadi kelompok Mobile Programming terbaik yang menghasilkan '
                            'karya nyata, inovatif, dan membanggakan — bagi diri sendiri, '
                            'kelompok, dan almamater.',
                      ),
                      const SizedBox(height: 14),
                      _VisiMisiItem(
                        icon: Icons.flag_rounded,
                        title: 'Misi',
                        desc: 'Berkolaborasi dengan penuh dedikasi, saling menguatkan satu '
                            'sama lain, dan menghasilkan aplikasi mobile berkualitas tinggi '
                            'dengan standar kode yang bersih, arsitektur yang solid, '
                            'serta antarmuka yang indah dan intuitif.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Nilai Kelompok
                _SectionCard(
                  label: 'NILAI KELOMPOK',
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      '🔥 Semangat',
                      '🤝 Solidaritas',
                      '💡 Inovasi',
                      '📱 Mobile First',
                      '✨ Kualitas',
                      '🎯 Fokus',
                      '💪 Pantang Menyerah',
                      '🙏 Rendah Hati',
                    ].map((s) => _ValuePill(label: s)).toList(),
                  ),
                ),
                const SizedBox(height: 16),

                // Anggota
                _SectionCard(
                  label: 'ANGGOTA TIM',
                  child: Column(
                    children: List.generate(kMembers.length, (i) {
                      return _MemberItem(member: kMembers[i], isLast: i == kMembers.length - 1);
                    }),
                  ),
                ),
                const SizedBox(height: 16),

                // Pesan Penutup
                _SectionCard(
                  label: 'PESAN KAMI',
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kGoldFaint,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kGold.withOpacity(0.25), width: 0.5),
                    ),
                    child: const Column(
                      children: [
                        Text('✦', style: TextStyle(color: kGold, fontSize: 18)),
                        SizedBox(height: 10),
                        Text(
                          '"Kami datang dengan niat yang tulus, bekerja dengan hati '
                          'yang penuh semangat, dan berkarya dengan tekad yang tidak '
                          'pernah padam. Kelompok 4 bukan sekadar nama — ini adalah '
                          'identitas, perjuangan, dan kebanggaan yang kami pikul bersama '
                          'dengan senyum dan rasa syukur."',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF1A1428),
                            height: 1.9,
                            letterSpacing: 0.3,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '— Kelompok 4  ·  Mobile Programming',
                          style: TextStyle(fontSize: 11, color: kGold, letterSpacing: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Info Mata Kuliah
                _SectionCard(
                  label: 'INFO',
                  child: Column(
                    children: [
                      _InfoRow(icon: Icons.school_outlined, text: 'Mobile Programming'),
                      const SizedBox(height: 12),
                      _InfoRow(icon: Icons.group_outlined, text: 'Kelompok 4'),
                      const SizedBox(height: 12),
                      _InfoRow(icon: Icons.location_on_outlined, text: 'Pamulang, Tangerang Selatan'),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Hero Header ───────────────────────────────────────────────────
class _HeroHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kDarkBg, kDarkMid, kDarkBlue],
            ),
          ),
        ),
        CustomPaint(painter: _PatternPainter()),
        Positioned(
          bottom: 28,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kDarkBlue,
                  border: Border.all(color: kGold, width: 1.5),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1504805572947-34fad45aed93?q=80&w=200&auto=format&fit=crop',
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'KELOMPOK 4',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Georgia',
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: kGold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kGold.withOpacity(0.5), width: 0.5),
                ),
                child: const Text(
                  'CALON PENGHUNI SURGA  ✦  MOBILE PROGRAMMING',
                  style: TextStyle(fontSize: 9, color: kGold, letterSpacing: 2, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Pattern Painter ───────────────────────────────────────────────
class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..strokeWidth = 0.5..style = PaintingStyle.stroke;

    p.color = kGold.withOpacity(0.12);
    for (double y = 0; y <= size.height; y += size.height / 6) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
    }

    p.color = kGold.withOpacity(0.08);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 90, p);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 130, p);

    p.color = kGold.withOpacity(0.18);
    final t1 = Path()..moveTo(20, 50)..lineTo(34, 74)..lineTo(6, 74)..close();
    canvas.drawPath(t1, p);
    final t2 = Path()
      ..moveTo(size.width - 20, size.height - 50)
      ..lineTo(size.width - 34, size.height - 74)
      ..lineTo(size.width - 6, size.height - 74)
      ..close();
    canvas.drawPath(t2, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Stat Card ─────────────────────────────────────────────────────
class _StatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kGold.withOpacity(0.2), width: 0.5),
        boxShadow: [BoxShadow(color: kGold.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 6))],
      ),
      child: Row(
        children: [
          _StatCell(value: '4', label: 'Anggota\nTim'),
          Container(width: 0.5, height: 40, color: kGold.withOpacity(0.25)),
          _StatCell(value: '1', label: 'Kelompok\nTerbaik'),
          Container(width: 0.5, height: 40, color: kGold.withOpacity(0.25)),
          _StatCell(value: '100%', label: 'Semangat\nBerjuang'),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  final String value;
  final String label;
  const _StatCell({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: kGold)),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, letterSpacing: 1.2, color: Colors.black38, height: 1.5)),
        ],
      ),
    );
  }
}

// ─── Section Card ──────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final String label;
  final Widget child;
  const _SectionCard({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kGold.withOpacity(0.15), width: 0.5),
        boxShadow: [BoxShadow(color: kGold.withOpacity(0.04), blurRadius: 16, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 3, height: 14, color: kGold),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontSize: 10, letterSpacing: 3, color: kGold, fontWeight: FontWeight.w600)),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [kGold.withOpacity(0.5), kGold.withOpacity(0.05)]),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

// ─── Visi Misi Item ────────────────────────────────────────────────
class _VisiMisiItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  const _VisiMisiItem({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(color: kGoldFaint, borderRadius: BorderRadius.circular(8), border: Border.all(color: kGold.withOpacity(0.3), width: 0.5)),
          child: Icon(icon, size: 18, color: kGold),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1A1428))),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(fontSize: 13, color: Colors.black45, height: 1.6)),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Value Pill ────────────────────────────────────────────────────
class _ValuePill extends StatelessWidget {
  final String label;
  const _ValuePill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: kGoldFaint,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kGold.withOpacity(0.35), width: 0.5),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12, color: kGold, letterSpacing: 0.3, fontWeight: FontWeight.w500)),
    );
  }
}

// ─── Member Item ───────────────────────────────────────────────────
class _MemberItem extends StatelessWidget {
  final _MemberData member;
  final bool isLast;
  const _MemberItem({required this.member, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        children: [
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(shape: BoxShape.circle, color: kGoldFaint, border: Border.all(color: kGold.withOpacity(0.4), width: 1)),
            alignment: Alignment.center,
            child: Text(member.initials, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: kGold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1A1428))),
                const SizedBox(height: 2),
                Text(member.nim, style: const TextStyle(fontSize: 11, color: Colors.black38)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: kGoldFaint,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kGold.withOpacity(0.3), width: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Info Row ──────────────────────────────────────────────────────
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34, height: 34,
          decoration: BoxDecoration(color: kGoldFaint, borderRadius: BorderRadius.circular(8), border: Border.all(color: kGold.withOpacity(0.3), width: 0.5)),
          child: Icon(icon, size: 16, color: kGold),
        ),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(fontSize: 13, color: Colors.black54, letterSpacing: 0.3)),
      ],
    );
  }
}