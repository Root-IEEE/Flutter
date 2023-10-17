import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountdownTimerWidget extends StatefulWidget {
  final Duration duration;
  final Function onTimerComplete;

  const CountdownTimerWidget({
    super.key,
    required this.duration,
    required this.onTimerComplete,
  });

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Duration _remainingTime;
  late ValueNotifier<int> _notifier;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
    _notifier = ValueNotifier<int>(_remainingTime.inSeconds);

    startTimer();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) {
        return;
      }

      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
          _notifier.value = _remainingTime.inSeconds;
        });
        startTimer();
      } else {
        widget.onTimerComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _notifier,
      builder: (context, remainingSeconds, child) {
        final minutes = (remainingSeconds / 60).floor();
        final seconds = remainingSeconds % 60;
        return Text(
          '$minutes:${seconds.toString().padLeft(2, '0')}',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        );
      },
    );
  }
}
