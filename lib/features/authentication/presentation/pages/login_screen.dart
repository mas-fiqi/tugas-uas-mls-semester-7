import 'package:flutter/material.dart';
import 'package:mls/core/constants/colors.dart';
import 'package:mls/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Atas (35% layar)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Stack(
                children: [
                   ClipPath(
                    clipper: HeaderClipper(),
                    child: Container(
                      color: kPrimaryColor, // Fallback color
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        'assets/images/kampus.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                   // Overlay warna transparan agar teks/konten lebih terbaca (opsional)
                  ClipPath(
                    clipper: HeaderClipper(),
                    child: Container(
                      color: kPrimaryColor.withOpacity(0.6),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            
            // Bagian Bawah (Isi Form)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Email Field
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email 365',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  
                  // Password Field
                  TextField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  


                  // Tombol Log In
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                         // Navigasi ke MainScreen (Dashboard)
                         Navigator.of(context).pushReplacement(
                           MaterialPageRoute(builder: (context) => const MainScreen()),
                         );
                      },
                      child: const Text('Log In'),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Tombol Bantuan
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Bantuan ?',
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomClipper untuk lengkungan bawah header
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Mulai dari kiri bawah (dikurangi sedikit)
    
    // Kurva Quadratic Bezier
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 50);
    
    path.quadraticBezierTo(
      controlPoint.dx, controlPoint.dy, 
      endPoint.dx, endPoint.dy
    );
    
    path.lineTo(size.width, 0); // Garis ke kanan atas
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
