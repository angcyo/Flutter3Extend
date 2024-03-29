library lp_module;

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/src/models/bean/bean_ex.dart';
import 'package:lp_module/src/models/bean/connect_device_bean.dart';
import 'package:lp_module/src/models/bean/user_bean.dart';
import 'package:lp_module/src/pages/main/community/choices_page.dart';
import 'package:lp_module/src/pages/main/community/dynamic_page.dart';
import 'package:lp_module/src/pages/main/community/tutorial_page.dart';
import 'package:lp_module/src/pages/main/mine/account_security_page.dart';
import 'package:lp_canvas/lp_canvas.dart';

import 'assets_generated/assets.gen.dart';
import 'l10n/generated/l10n.dart';
import 'src/models/bean/banner_bean.dart';
import 'src/models/bean/list_user_bean.dart';
import 'src/pages/main/home/add_device_page.dart';
import 'src/pages/main/home/materials_page.dart';
import 'src/pages/main/mine/about_page.dart';
import 'src/pages/main/mine/contact_us_page.dart';
import 'src/pages/main/mine/device_info_tile.dart';
import 'src/pages/main/mine/like_tip_dialog.dart';
import 'src/pages/main/mine/list_user_info_tile.dart';

export 'package:lp_canvas/lp_canvas.dart';

export 'l10n/generated/l10n.dart';

part 'src/lp_module_app.dart';
part 'src/models/login_model.dart';
part 'src/models/user_model.dart';
part 'src/pages/login/login_page.dart';
part 'src/pages/login/register_page.dart';
part 'src/pages/lp_page_mixin.dart';
part 'src/pages/main/community_page.dart';
part 'src/pages/main/home_page.dart';
part 'src/pages/main/main_page.dart';
part 'src/pages/main/mine/attention_fans_page.dart';
part 'src/pages/main/mine/attention_list_page.dart';
part 'src/pages/main/mine/device_history_page.dart';
part 'src/pages/main/mine/fans_list_page.dart';
part 'src/pages/main/mine/user_info_page.dart';
part 'src/pages/main/mine/user_setting_page.dart';
part 'src/pages/main/mine_page.dart';

/// [toast]
lpToast(Widget msg) => toastBlur(msg: msg);

/// [loadAssetSvgWidget]
Widget lpSvgWidget(
  String key, {
  Color? tintColor,
  UiColorFilter? colorFilter,
  BoxFit fit = BoxFit.contain,
  double? width,
  double? height,
}) =>
    loadAssetSvgWidget(
      key,
      package: "lp_module",
      tintColor: tintColor,
      colorFilter: colorFilter,
      width: width,
      height: height,
      fit: fit,
    );

/// [loadAssetImageWidget]
Widget? lpImageWidget(
  String? key, {
  BoxFit? fit,
  double? width,
  double? height,
}) =>
    loadAssetImageWidget(
      key,
      package: "lp_module",
      fit: fit,
      width: width,
      height: height,
    );
