import 'package:flutter/material.dart';

void main() {
  runApp(const TwinkleTailsApp());
}

class TwinkleTailsApp extends StatelessWidget {
  const TwinkleTailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twinkle Tails',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFB4CF),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

/// ANA EKRAN – Glow Garden menüsü
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3C4A6B), // night sky navy
              Color(0xFFC9C3FF), // soft lavender
              Color(0xFFFFF6D9), // moonlight cream
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Twinkle Tails',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Küçük parlayan dostlarla oyna 💫',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 24),

              // Lumie karakterleri (basit yuvarlak ikonlar)
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      LumieCircle(color: Color(0xFFFFB4CF)), // Pippa
                      LumieCircle(color: Color(0xFFCFF7E3)), // Momo
                      LumieCircle(color: Color(0xFFBEE9FF)), // Tiko
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Büyük menü butonları
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    BigMenuButton(
                      label: 'Glow Garden',
                      emoji: '🌼',
                      onTap: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const GlowGardenScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    BigMenuButton(
                      label: 'Colour Mix',
                      emoji: '🎨',
                      onTap: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ColorMixScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    BigMenuButton(
                      label: 'Sky Bubbles',
                      emoji: '🫧',
                      onTap: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SkyBubblesScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    BigMenuButton(
                      label: 'Goodnight',
                      emoji: '🌙',
                      onTap: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const GoodnightScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LumieCircle extends StatelessWidget {
  final Color color;
  const LumieCircle({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.7),
            blurRadius: 20,
            spreadRadius: 4,
          )
        ],
      ),
      child: const Center(
        child: Text(
          '✨',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}

class BigMenuButton extends StatelessWidget {
  final String label;
  final String emoji;
  final void Function(BuildContext) onTap;

  const BigMenuButton({
    super.key,
    required this.label,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          foregroundColor: const Color(0xFF3C4A6B),
        ),
        onPressed: () => onTap(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 26),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// AKTİVİTE 1 – Glow Garden (çiçek büyütme)
class GlowGardenScreen extends StatefulWidget {
  const GlowGardenScreen({super.key});

  @override
  State<GlowGardenScreen> createState() => _GlowGardenScreenState();
}

class _GlowGardenScreenState extends State<GlowGardenScreen> {
  // 0 = tohum, 1 = filiz, 2 = çiçek
  final List<int> stages = [0, 0, 0];

  void waterPlant(int index) {
    setState(() {
      stages[index] = (stages[index] + 1) % 3;
    });
  }

  IconData _iconForStage(int stage) {
    switch (stage) {
      case 0:
        return Icons.circle_outlined; // tohum
      case 1:
        return Icons.spa_outlined; // filiz
      case 2:
        return Icons.local_florist; // çiçek
    }
    return Icons.circle_outlined;
  }

  Color _colorForStage(int stage) {
    switch (stage) {
      case 0:
        return const Color(0xFFA6D4A3);
      case 1:
        return const Color(0xFFFFDBC6);
      case 2:
        return const Color(0xFFFFB4CF);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFF7E3),
      appBar: AppBar(
        title: const Text('Glow Garden'),
        backgroundColor: const Color(0xFF3C4A6B),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Dokun, sula, parlasın! 💧✨',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(stages.length, (index) {
                  final stage = stages[index];
                  return GestureDetector(
                    onTap: () => waterPlant(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 100,
                      height: 160,
                      decoration: BoxDecoration(
                        color: _colorForStage(stage).withOpacity(0.9),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: _colorForStage(stage).withOpacity(0.6),
                            blurRadius: 18,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      child: Icon(
                        _iconForStage(stage),
                        size: 72,
                        color: const Color(0xFF3C4A6B),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// AKTİVİTE 2 – Colour Mix (renk karıştırma)
class ColorMixScreen extends StatefulWidget {
  const ColorMixScreen({super.key});

  @override
  State<ColorMixScreen> createState() => _ColorMixScreenState();
}

class _ColorMixScreenState extends State<ColorMixScreen> {
  Color currentColor = Colors.white;
  final Color red = Colors.redAccent;
  final Color blue = Colors.blueAccent;
  final Color yellow = Colors.amber;

  void mix(Color c) {
    setState(() {
      currentColor = Color.lerp(currentColor, c, 0.6)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6D9),
      appBar: AppBar(
        title: const Text('Colour Mix'),
        backgroundColor: const Color(0xFF3C4A6B),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Renk gölüne dokun 🎨',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: currentColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: currentColor.withOpacity(0.6),
                      blurRadius: 30,
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    '✨',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorButton(red),
                _colorButton(blue),
                _colorButton(yellow),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorButton(Color c) {
    return GestureDetector(
      onTap: () => mix(c),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: c,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: c.withOpacity(0.6),
              blurRadius: 18,
              spreadRadius: 3,
            )
          ],
        ),
      ),
    );
  }
}

/// AKTİVİTE 3 – Sky Bubbles (baloncuk patlatma)
class SkyBubblesScreen extends StatefulWidget {
  const SkyBubblesScreen({super.key});

  @override
  State<SkyBubblesScreen> createState() => _SkyBubblesScreenState();
}

class _SkyBubblesScreenState extends State<SkyBubblesScreen> {
  final List<bool> visible = List<bool>.filled(8, true);

  void pop(int index) {
    setState(() {
      visible[index] = !visible[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBEE9FF),
      appBar: AppBar(
        title: const Text('Sky Bubbles'),
        backgroundColor: const Color(0xFF3C4A6B),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Baloncuklara dokun 🫧',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 24,
                children: List.generate(visible.length, (index) {
                  final isVisible = visible[index];
                  return GestureDetector(
                    onTap: () => pop(index),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: isVisible ? 1 : 0.2,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.4),
                              blurRadius: 16,
                              spreadRadius: 2,
                            )
                          ],
                          border: Border.all(
                            color: Colors.white.withOpacity(0.8),
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            isVisible ? '✨' : '😊',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// GOODNIGHT ekranı
class GoodnightScreen extends StatelessWidget {
  const GoodnightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3C4A6B),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'İyi geceler, küçük Lumies 🌙',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: 220,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFFC9C3FF),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Center(
                  child: Text(
                    '😴😴😴',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF3C4A6B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Geri dön',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
