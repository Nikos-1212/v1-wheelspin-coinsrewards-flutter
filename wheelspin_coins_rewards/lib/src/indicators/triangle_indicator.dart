part of 'indicators.dart';

class TriangleIndicator extends StatelessWidget {
  final Color? color;

  const TriangleIndicator({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.5708, // Full rotation
      child: SizedBox(
        width: 88,
        height: 88,
        child: Image.asset('assets/images/spin_indicator.png'),
        // child: _Triangle(
        //   color: color ?? theme.colorScheme.secondary,
        //   elevation: 2,
        // ),
      ),
    );
    
  }
}


