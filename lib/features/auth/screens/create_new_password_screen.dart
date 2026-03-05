import 'package:flutter/material.dart';
import 'package:flutter_b134/features/home/screens/home_screen.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: AppColors.primaryBlue),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'New Password',
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Create New Password',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your new password must be different from previous used passwords',
                style: TextStyle(fontSize: 16, color: AppColors.textGrey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.primaryBlue,
                child: Icon(Icons.lock_outline, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 40),
              _buildPasswordField('New password', Icons.lock),
              const SizedBox(height: 16),
              _buildPasswordField('Confirm new password', Icons.lock_outline),
              const SizedBox(height: 30),
              _buildPasswordRequirements(),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Reset Password',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password reset successfully! 🎉'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String hint, IconData icon) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.primaryBlue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget _buildPasswordRequirements() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          _buildRequirement('Minimum 8 characters', true),
          const SizedBox(height: 8),
          _buildRequirement('At least one uppercase letter', false),
          const SizedBox(height: 8),
          _buildRequirement('At least one number', false),
        ],
      ),
    );
  }

  Widget _buildRequirement(String text, bool isMet) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.circle_outlined,
          size: 18,
          color: isMet ? Colors.green : AppColors.textGrey,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: isMet ? Colors.green : AppColors.textGrey),
        ),
      ],
    );
  }
}
