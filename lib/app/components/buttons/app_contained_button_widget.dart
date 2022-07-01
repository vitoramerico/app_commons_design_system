import 'package:app_commons_dependency_manager/app_commons_dependency_manager.dart';
import 'package:flutter/material.dart';

import '../../enums/app_button_size_enum.dart';
import '../../enums/app_icon_direction_enum.dart';
import '../../utils/module_util.dart';

class AppContainedButtonWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final AppButtonSizeEnum buttonSize;
  final AppIconDirectionEnum iconDirection;
  final bool isLoading;
  final bool semanticIsLink;
  final String semanticsLabel;
  final VoidCallback? onPressed;

  const AppContainedButtonWidget({
    Key? key,
    required this.title,
    this.icon,
    this.buttonSize = AppButtonSizeEnum.large,
    this.iconDirection = AppIconDirectionEnum.right,
    this.isLoading = false,
    this.semanticIsLink = false,
    this.semanticsLabel = '',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: onPressed != null ? _styleRegular : _styleDisabled,
      child: _buildButton(),
    );
  }

  Widget _buildButton() => Semantics(
        button: !semanticIsLink,
        link: semanticIsLink,
        container: true,
        enabled: onPressed != null,
        label: semanticsLabel.isEmpty ? title : semanticsLabel,
        hint: ModuleUtil.isAndroid && semanticIsLink ? 'Link' : null,
        child: ExcludeSemantics(
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(buttonSize.size),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: AppBorderRadius.radiusPill,
                ),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return AppColors.quaternaryMedium;
                  }
                  return Colors.transparent;
                },
              ),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: isLoading ? _buildLoading() : _buildContent(),
          ),
        ),
      );

  Widget _buildContent() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconDirection == AppIconDirectionEnum.right
            ? lstContent
            : lstContent.reversed.toList(),
      );

  List<Widget> get lstContent => <Widget>[
        Text(
          title,
          style: buttonSize.textStyle?.copyWith(color: _contentColor),
        ),
        Visibility(
          visible: icon != null,
          child: Container(
            margin: _iconMargin,
            child: icon != null
                ? FaIcon(
                    icon,
                    color: _contentColor,
                    size: 24,
                  )
                : null,
          ),
        ),
      ];

  Widget _buildLoading() => const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.neutralLightest),
        ),
      );

  Color get _contentColor => onPressed != null
      ? AppColors.neutralLightest
      : AppColors.neutralLightMedium;

  Decoration get _styleRegular => AppShadow.primaryButtonLv1.copyWith(
        borderRadius: AppBorderRadius.radiusPill,
        gradient: AppColors.gradientPrimary,
      );

  Decoration get _styleDisabled => BoxDecoration(
        borderRadius: AppBorderRadius.radiusPill,
        color: AppColors.neutralLight,
      );

  EdgeInsetsGeometry get _iconMargin =>
      iconDirection == AppIconDirectionEnum.right
          ? const EdgeInsets.only(left: AppGlobalSpacing.nano)
          : const EdgeInsets.only(right: AppGlobalSpacing.nano);
}
