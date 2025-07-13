import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flix_id/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_flix_id/presentation/misc/constants.dart';
import 'package:flutter_flix_id/presentation/providers/router/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: saffron,
          brightness: Brightness.dark,
          // surface is background because background is deprecated to use.
          surface: backgroundColor,
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.poppins(color: ghostWhithe),
          bodyLarge: GoogleFonts.poppins(color: ghostWhithe),
          labelLarge: GoogleFonts.poppins(color: ghostWhithe),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
