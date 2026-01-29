import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth/auth_bloc.dart';
import '../constants/colors_resource.dart';
import '../constants/dimensions_resource.dart';
import '../constants/route_constants.dart';
import '../utils/text_styles.dart';
import '../utils/theme_extensions.dart';
import '../widgets/custom_text_field_widget.dart';
import '../widgets/custom_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.onLogin(
          username: _usernameController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isAuthenticated && !state.isLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Successfully logged in'),
              backgroundColor: context.successColor,
              duration: const Duration(seconds: 2),
            ),
          );
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              context.go(RouteConstants.TASK_LIST_SCREEN_ROUTE);
            }
          });
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: context.errorColor,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.backgroundColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(DimensionsResource.D_24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.task_alt,
                      size: DimensionsResource.D_64.w,
                      color: theme.colorScheme.primary,
                    ),
                    SizedBox(height: DimensionsResource.D_24.h),
                    Text(
                      'Task Manager',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.displayLarge(context).copyWith(
                        fontSize: DimensionsResource.FONT_SIZE_32.sp,
                        fontWeight: FontWeight.bold,
                        color: context.primaryTextColor,
                      ),
                    ),
                    SizedBox(height: DimensionsResource.D_8.h),
                    Text(
                      'Sign in to manage your tasks',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLarge(context).copyWith(
                        fontSize: DimensionsResource.FONT_SIZE_16.sp,
                        color: context.secondaryTextColor,
                      ),
                    ),
                    SizedBox(height: DimensionsResource.D_40.h),
                    CustomTextField(
                      controller: _usernameController,
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: DimensionsResource.D_20.h),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: DimensionsResource.D_32.h),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return CustomButton(
                          text: 'Sign In',
                          onPressed: _handleLogin,
                          isLoading: state.isLoading,
                        );
                      },
                    ),
                    SizedBox(height: DimensionsResource.D_16.h),
                    Text(
                      'Use any username and password for demo',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption(context).copyWith(
                        fontSize: DimensionsResource.FONT_SIZE_12.sp,
                        color: context.secondaryTextColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
