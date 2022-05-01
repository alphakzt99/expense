import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  bool _theme;
  final String label;
  final double amount;
  final double totalspending;
  ChartBar(this.label, this.amount, this.totalspending, this._theme);

  @override
  Widget build(BuildContext context) {
    Color color1 = Theme.of(context).primaryColor;
    Color color2 = Theme.of(context).primaryColorDark;
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Text(
              '\$${amount.toStringAsFixed(0)}',
              style: TextStyle(color: color2),
            )),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: color2),
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10)),
                ),
                totalspending.isNaN
                    ? Container()
                    : FractionallySizedBox(
                        heightFactor: totalspending,
                        child: Container(
                          decoration: BoxDecoration(
                              color: _theme
                                  ? color1
                                  : color2,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text(
                label,
                style: TextStyle(color: color2),
              )))
        ],
      );
    });
  }
}
