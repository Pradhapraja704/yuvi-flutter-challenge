
import 'package:flutter_test/flutter_test.dart';
import 'package:day2/main.dart';

void main() {
  testWidgets('Habit Tracker screen loads successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('New Habit'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Calendar'), findsOneWidget);
    expect(find.text('Analytics'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
