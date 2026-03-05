import 'package:flutter/material.dart';
import 'create_account_screen.dart';
import 'forgot_password_screen.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

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
              color: AppColors.primaryBlue.withValues(alpha:0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: AppColors.primaryBlue, size: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Sign In',
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Let\'s Sign you in',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur',
                  style: TextStyle(fontSize: 14, color: AppColors.textGrey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.primaryBlue,
                  child: Icon(Icons.beach_access, size: 60, color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                label: 'Email Address',
                hint: 'Enter your email address',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Password',
                hint: 'Enter your password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: AppColors.primaryBlue,
                      ),
                      const Text('Remember Me', style: TextStyle(color: AppColors.textGrey)),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    ),
                    child: const Text('Forgot Password?', style: TextStyle(color: AppColors.primaryBlue)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Sign In',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
                ),
              ),
              const SizedBox(height: 30),
              _buildDivider('Or Sign In with'),
              const SizedBox(height: 30),
              _buildSocialButtons(),
              const SizedBox(height: 30),
              _buildSignUpRow(context),
              const SizedBox(height: 20),
              _buildTermsText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.primaryBlue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[50],
        ),
      ),
    );
  }

  Widget _buildDivider(String text) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(text, style: const TextStyle(color: AppColors.textGrey)),
        ),
        Expanded(child: Divider(color: Colors.grey[300])),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _socialButton(Icons.facebook, const Color(0xFF1877F2)),
        _socialButton(Icons.g_mobiledata, const Color(0xFFDB4437)),
        _socialButton(Icons.apple, Colors.black),
      ],
    );
  }

  Widget _socialButton(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.withValues(alpha:0.2)),
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? ", style: TextStyle(color: AppColors.textGrey)),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsText() {
    return Center(
      child: Text(
        'By signing up you agree to our Terms and Conditions of Use',
        style: TextStyle(color: AppColors.textGrey.withValues(alpha:0.7), fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}