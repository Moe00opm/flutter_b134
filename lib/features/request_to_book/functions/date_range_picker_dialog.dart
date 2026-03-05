import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

Future<DateTimeRange?> showDateRangePickerDialog(
  BuildContext context, {
  DateTimeRange? initialRange,
}) async {
  DateTimeRange? result;

  List<DateTime?> tempValue = [initialRange?.start, initialRange?.end];
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(28),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 380),
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: CalendarDatePicker2WithActionButtons(
              
              value: tempValue,
          
              onValueChanged: (dates) {
                tempValue = dates;
              },
              onCancelTapped: () => Navigator.pop(context),
              onOkTapped: () {
                final start = tempValue.isNotEmpty ? tempValue[0] : null;
                final end = tempValue.length > 1 ? tempValue[1] : null;
                if (start != null && end != null) {
                  result = DateTimeRange(
                    start: DateTime(start.year, start.month, start.day),
                    end: DateTime(end.year, end.month, end.day),
                  );
                }
                Navigator.pop(context);
              },
              config: CalendarDatePicker2WithActionButtonsConfig(
                calendarType: CalendarDatePicker2Type.range,
              ),
            ),
          ),
        ),
      );
    },
  );
  return result;
}
