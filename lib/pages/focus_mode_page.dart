import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FocusModePage extends StatefulWidget {
  const FocusModePage({super.key});

  @override
  State<FocusModePage> createState() => _FocusModePageState();
}

class _FocusModePageState extends State<FocusModePage> {
  static const int pomodoroDuration = 25 * 60; // 25 minutos em segundos
  int _remainingSeconds = pomodoroDuration;
  Timer? _timer;
  bool _isRunning = false;

  void _startOrPauseTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds == 0) {
          timer.cancel();
          setState(() => _isRunning = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Pomodoro concluído!')),
          );
        } else {
          setState(() => _remainingSeconds--);
        }
      });
    }

    setState(() {
      _isRunning = !_isRunning;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/Vector.svg',
                    height: 20,
                    width: 20,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Focus',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (_remainingSeconds ~/ 60).toString().padLeft(2, '0'),
                  style: GoogleFonts.robotoFlex(
                    fontSize: 160,
                    fontWeight: FontWeight.w800,
                    color: color,
                    height: 0.9,
                  ),
                ),
                Text(
                  (_remainingSeconds % 60).toString().padLeft(2, '0'),
                  style: GoogleFonts.robotoFlex(
                    fontSize: 160,
                    fontWeight: FontWeight.w800,
                    color: color,
                    height: 0.9,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _startOrPauseTimer,
                child: Text(
                  _isRunning ? 'Pausar' : 'Iniciar',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
