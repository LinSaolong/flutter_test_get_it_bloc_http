import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * .2),
            Container(
              width: size.width * .6,
              height: size.width * .6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment(-.8, -0.8),
                  end: Alignment(1.8, -0.5),
                  stops: [0.12, 0.93, 0.93],
                  colors: [
                    Color(0xFF242424),
                    Color(0xFF484848),
                    Color(0xFF484848),
                  ],
                ),
              ),
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                rangeSelectionColor: Colors.green,
                startRangeSelectionColor: Colors.green,
                endRangeSelectionColor: Colors.green,
                todayHighlightColor: Colors.redAccent,
                selectionColor: Colors.green,
                selectionShape: DateRangePickerSelectionShape.rectangle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
