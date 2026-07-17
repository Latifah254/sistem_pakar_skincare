import 'package:flutter/material.dart';

class LoadingCard extends StatefulWidget {
  final int currentStep;
  final String statusText;

  const LoadingCard({
    super.key,
    required this.currentStep,
    required this.statusText,
  });

  @override
  State<LoadingCard> createState() => _LoadingCardState();
}

class _LoadingCardState extends State<LoadingCard>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  double _oldProgress = 0;

  double get _newProgress {
    if (widget.currentStep < 0) return 0;
    return (widget.currentStep + 1) / 4;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _progressAnimation = Tween<double>(
      begin: _oldProgress,
      end: _newProgress,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant LoadingCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    _oldProgress = _progressAnimation.value;

    _progressAnimation = Tween<double>(
      begin: _oldProgress,
      end: _newProgress,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  child: Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.green.withOpacity(.08),
          blurRadius: 30,
          offset: const Offset(0, 12),
        ),
      ],
    ),

    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// =====================================
        /// JUDUL
        /// =====================================

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Menganalisis Data Kamu",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(width: 8),

            Icon(
              Icons.auto_awesome,
              color: Color(0xff2E8B57),
            ),

          ],
        ),

        const SizedBox(height: 28),

        /// =====================================
        /// ROBOT + PROGRESS
        /// =====================================

        SizedBox(
          width: 250,
          height: 250,

          child: Stack(
            alignment: Alignment.center,

            children: [

              AnimatedBuilder(

                animation: _progressAnimation,

                builder: (_, __) {

                  return SizedBox(

                    width: 210,
                    height: 210,

                    child: CircularProgressIndicator(

                      value: _progressAnimation.value,

                      strokeWidth: 10,

                      backgroundColor:
                          Colors.green.shade100,

                      color: const Color(0xff2E8B57),

                    ),

                  );

                },

              ),

              Container(

                width: 140,
                height: 140,

                decoration: BoxDecoration(

                  shape: BoxShape.circle,

                  gradient: RadialGradient(

                    colors: [

                      Colors.green.shade100,
                      Colors.white,

                    ],

                  ),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.green.withOpacity(.25),

                      blurRadius: 30,
                      spreadRadius: 4,

                    ),

                  ],

                ),

              ),

              TweenAnimationBuilder<double>(

                tween: Tween(
                  begin: .96,
                  end: 1,
                ),

                duration:
                    const Duration(milliseconds: 900),

                curve: Curves.easeInOut,

                builder: (context, scale, child) {

                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );

                },

                child: Image.asset(
                  "assets/icons/robot.png",
                  width: 105,
                ),

              ),

            ],

          ),

        ),

        const SizedBox(height: 12),

        /// =====================================
        /// PERSENTASE
        /// =====================================

        AnimatedBuilder(

          animation: _progressAnimation,

          builder: (_, __) {

            return Text(

              "${(_progressAnimation.value * 100).toInt()}%",

              style: const TextStyle(

                fontSize: 28,

                fontWeight: FontWeight.bold,

                color: Color(0xff2E8B57),

              ),

            );

          },

        ),

        const SizedBox(height: 8),

        /// =====================================
        /// STATUS
        /// =====================================

        AnimatedSwitcher(

          duration:
              const Duration(milliseconds: 350),

          transitionBuilder:
              (child, animation) {

            return FadeTransition(

              opacity: animation,

              child: SlideTransition(

                position: Tween<Offset>(

                  begin: const Offset(0, .2),

                  end: Offset.zero,

                ).animate(animation),

                child: child,

              ),

            );

          },

          child: Text(

            widget.statusText,

            key: ValueKey(widget.statusText),

            textAlign: TextAlign.center,

            style: const TextStyle(

              fontSize: 17,

              fontWeight: FontWeight.w600,

            ),

          ),

        ),

        const SizedBox(height: 28),

        Container(

          width: double.infinity,

          padding: const EdgeInsets.all(18),

          decoration: BoxDecoration(

            color: const Color(0xffF8FAFC),

            borderRadius: BorderRadius.circular(20),

            border: Border.all(
              color: Colors.green.shade100,
            ),

          ),

          child: Column(

            children: [
                            _buildStep(
                title: "Identifikasi Jenis Kulit",
                index: 0,
              ),

              const SizedBox(height: 12),

              _buildStep(
                title: "Identifikasi Masalah Kulit",
                index: 1,
              ),

              const SizedBox(height: 12),

              _buildStep(
                title: "Mencocokkan Knowledge Base",
                index: 2,
              ),

              const SizedBox(height: 12),

              _buildStep(
                title: "Menentukan Rekomendasi Skincare",
                index: 3,
              ),

            ],
          ),
        ),

        const SizedBox(height: 22),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(0xff2E8B57),
              ),
            ),

            const SizedBox(width: 10),

            const Text(
              "Mohon tunggu sebentar ya...",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

          ],
        ),

        const SizedBox(height: 6),

      ],
    ),
  ),
);
}

Widget _buildStep({
  required String title,
  required int index,
}) {
  final bool selesai = widget.currentStep > index;
  final bool proses = widget.currentStep == index;

  IconData icon;
  Color iconColor;
  Color badgeColor;
  String status;

  if (selesai) {
    icon = Icons.check_circle_rounded;
    iconColor = const Color(0xff2E8B57);
    badgeColor = const Color(0xff2E8B57);
    status = "Selesai";
  } else if (proses) {
    icon = Icons.autorenew_rounded;
    iconColor = Colors.orange;
    badgeColor = Colors.orange;
    status = "Proses";
  } else {
    icon = Icons.radio_button_unchecked_rounded;
    iconColor = Colors.grey;
    badgeColor = Colors.grey;
    status = "Menunggu";
  }

  return AnimatedContainer(
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
    padding: const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 14,
    ),
    decoration: BoxDecoration(
      color: proses
          ? const Color(0xffEEF9F1)
          : Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: proses
            ? const Color(0xffB8E5C4)
            : Colors.grey.shade200,
      ),
    ),
    child: Row(
      children: [

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: Icon(
            icon,
            key: ValueKey(status),
            color: iconColor,
            size: 24,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: proses
                  ? FontWeight.w600
                  : FontWeight.w500,
            ),
          ),
        ),

        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: badgeColor.withOpacity(.12),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: badgeColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

      ],
    ),
  );
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}