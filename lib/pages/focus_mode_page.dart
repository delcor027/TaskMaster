import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_theme.dart';

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

  String? _statusMessage;
  Color? _statusColor;
  bool _showPopup = false;

  void _showStatus(String message, Color color) {
    setState(() {
      _statusMessage = message;
      _statusColor = color;
      _showPopup = true;
    });

    // Esconde o popup após 3 segundos
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _showPopup = false);
      }
    });
  }

  void _startOrPauseTimer() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
      _showStatus('Pomodoro pausado', AppColors.warning);
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

      setState(() => _isRunning = true);
      _showStatus('Pomodoro iniciado', AppColors.accent);
    }
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
      body: Stack(
        children: [
          Padding(
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

          // Pop-up flutuante
          if (_statusMessage != null)
            Positioned(
              top: 60,
              left: 24,
              right: 24,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showPopup ? 1.0 : 0.0,
                child: Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: _statusColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _statusMessage!,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
