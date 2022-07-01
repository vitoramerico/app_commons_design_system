import 'package:flutter/material.dart';
import 'package:app_commons_dependency_manager/app_commons_dependency_manager.dart';

import '../../enums/app_button_size_enum.dart';
import '../../enums/app_icon_direction_enum.dart';
import '../../utils/module_util.dart';

class AppOutlineButtonWidget extends StatefulWidget {
  final String title;
  final IconData? icon;
  final AppIconDirectionEnum iconDirection;
  final AppButtonSizeEnum buttonSize;
  final bool isLoading;
  final bool semanticIsLink;
  final VoidCallback? onPressed;

  const AppOutlineButtonWidget({
    Key? key,
    required this.title,
    this.icon,
    this.iconDirection = AppIconDirectionEnum.right,
    this.buttonSize = AppButtonSizeEnum.large,
    this.isLoading = false,
    this.semanticIsLink = false,
    this.onPressed,
  }) : super(key: key);

  @override
  State<AppOutlineButtonWidget> createState() => _AppOutlineButtonWidgetState();
}

class _AppOutlineButtonWidgetState extends State<AppOutlineButtonWidget> {
  final isPressed = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.onPressed != null ? _styleRegular : _styleDisabled,
      child: _buildButton(),
    );
  }

  Widget _buildButton() => Semantics(
        button: !widget.semanticIsLink,
        link: widget.semanticIsLink,
        container: true,
        enabled: widget.onPressed != null,
        label: widget.title,
        hint: ModuleUtil.isAndroid && widget.semanticIsLink ? 'Link' : null,
        child: ExcludeSemantics(
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            style: ButtonStyle(
              animationDuration: AppAnimationCurves.easeOutDuration,
              minimumSize: MaterialStateProperty.all(widget.buttonSize.size),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: AppBorderRadius.radiusPill),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) != isPressed.value) {
                  isPressed.value = states.contains(MaterialState.pressed);
                }

                if (states.contains(MaterialState.pressed)) {
                  return AppColors.quaternaryMedium;
                }

                return Colors.transparent;
              }),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: widget.isLoading ? _buildLoading() : _buildContent(),
          ),
        ),
      );

  Widget _buildLoading() => const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryMedium),
        ),
      );

  Widget _buildContent() => ValueListenableBuilder<bool>(
        valueListenable: isPressed,
        builder: (_, value, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.iconDirection == AppIconDirectionEnum.right
                ? lstContent
                : lstContent.reversed.toList(),
          );
        },
      );

  List<Widget> get lstContent => <Widget>[
        Text(
          widget.title,
          style: widget.buttonSize.textStyle?.copyWith(color: _contentColor),
        ),
        Visibility(
          visible: widget.icon != null,
          child: Container(
            margin: _iconMargin,
            child: widget.icon != null
                ? FaIcon(
                    widget.icon,
                    color: _contentColor,
                    size: 24,
                  )
                : null,
          ),
        ),
      ];

  Color get _contentColor {
    if (widget.onPressed == null) return AppColors.neutralLightMedium;

    if (isPressed.value) return AppColors.neutralLightest;

    return AppColors.primaryMedium;
  }

  Decoration get _styleRegular => BoxDecoration(
        borderRadius: AppBorderRadius.radiusPill,
        border: AppBorder.widthHairline(color: AppColors.primaryMedium),
      );

  Decoration get _styleDisabled => BoxDecoration(
        borderRadius: AppBorderRadius.radiusPill,
        color: AppColors.neutralLight,
      );

  EdgeInsetsGeometry get _iconMargin =>
      widget.iconDirection == AppIconDirectionEnum.right
          ? const EdgeInsets.only(left: AppGlobalSpacing.nano)
          : const EdgeInsets.only(right: AppGlobalSpacing.nano);
}
