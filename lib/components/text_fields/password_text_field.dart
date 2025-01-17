import 'package:flutter/material.dart';
import 'package:flutter_belsons/businnes_logic/cubit/state_cubit.dart';
import 'package:flutter_belsons/constants/enums.dart';
import 'package:flutter_belsons/constants/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSave;

  final StateCubit stateCubit = StateCubit(true);
  PasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StateCubit, bool>(
      bloc: stateCubit,
      builder: (context, obscureText) {
        return TextFormField(
          controller: controller,
          obscureText: obscureText,
          onSaved: onSave,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                stateCubit.setBlocState(newState: !stateCubit.state);
              },
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          textInputAction: TextInputAction.next,
          validator: validator ??
              (value) => validatorTextField(
                    typeTextField: TextFieldType.password,
                    value: value,
                  ),
        );
      },
    );
  }
}
