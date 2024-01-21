import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhoneOTPVerification(),
    );
  }
}

class PhoneOTPVerification extends StatefulWidget {
  @override
  _PhoneOTPVerificationState createState() => _PhoneOTPVerificationState();
}

class _PhoneOTPVerificationState extends State<PhoneOTPVerification> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";

  Future<void> sendOTP(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // OTP verification completed automatically (on some devices)
        print("Verification completed automatically: Signed in!");
      },
      verificationFailed: (FirebaseAuthException authException) {
        // Handle errors like invalid phone number, too many requests, etc.
        print("Verification failed: ${authException.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store the verificationId for later use
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Called when the auto-sms-retrieval timer has finished
        print("Auto retrieval timeout");
      },
    );
  }

  Future<void> verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      print("OTP verification successful: Signed in!");
    } catch (e) {
      // Handle any exceptions (e.g., invalid OTP)
      print("OTP verification failed: $e");
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Enter Phone Number"),
            ),
            ElevatedButton(
              onPressed: () async {
                String phoneNumber = phoneNumberController.text;
                await sendOTP(phoneNumber);
              },
              child: Text("Send OTP"),
            ),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter OTP"),
            ),
            ElevatedButton(
              onPressed: () async {
                String otp = otpController.text;
                await verifyOTP(otp);
              },
              child: Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
