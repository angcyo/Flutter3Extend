import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/assets_generated/assets.gen.dart';
import 'package:lp_module/lp_module.dart';
import 'package:lp_module/src/helper/device_helper.dart';

import '../../../models/bean/connect_device_bean.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/12/10
///

class DeviceInfoTile extends StatelessWidget {
  final ConnectDeviceBean? deviceInfoBean;

  const DeviceInfoTile({
    super.key,
    required this.deviceInfoBean,
  });

  /// 设备第一个信息
  Widget _buildDeviceTile(BuildContext context) {
    final bean = deviceInfoBean;
    final globalTheme = GlobalTheme.of(context);
    if (bean == null) {
      return GlobalConfig.of(context)
          .loadingIndicatorBuilder(context, this, null);
    }
    return (bean.blueName ?? "--")
        .text()
        .paddingOnly(
          left: globalTheme.xh,
          top: globalTheme.x,
          bottom: globalTheme.x,
        )
        .rowOf(
          lpSvgWidget(Assets.svg.copy).paddingAll(globalTheme.xh).ink(
                radius: 999,
                onTap: () {
                  bean.toJsonString().copy().ignore();
                  toast("已复制到剪切板".text());
                },
              ),
          mainAxisAlignment: MainAxisAlignment.start,
        )!
        .columnOf(
          lpImageWidget(
            DeviceHelper.getDeviceAssetsPngKey(bean.deviceModel),
            width: 76,
            height: 76,
          )
              ?.container(
                  decoration: fillDecoration(
                fillColor: globalTheme.themeWhiteColor,
              ))
              .rowOf(
                stringBuilder((builder) {
                  builder.appendLine(
                      '${LPModule.of(context).machineType}: ${bean.deviceModel}');
                  builder.appendLine(
                      '${LPModule.of(context).registerTime}: ${bean.createTime}');
                  builder.appendLine(
                      '${LPModule.of(context).firmwareVersion}: V${bean.firmwareVersion?.toVersionString()}');
                  builder.append(
                      '${LPModule.of(context).softwareVersion}: V${bean.appVersion}');
                })
                    .text(
                      style: globalTheme.textSubStyle,
                    )
                    .paddingOnly(
                      left: globalTheme.x,
                    )
                    .expanded(),
              )!
              .paddingOnly(
                left: globalTheme.xh,
                right: globalTheme.xh,
                bottom: globalTheme.xh,
              ),
        )!
        .container(
          decoration: fillDecoration(fillColor: "#F9F9F59".toColor()),
        )
        .paddingOnly(
          left: globalTheme.xh,
          right: globalTheme.xh,
          bottom: globalTheme.x,
        );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDeviceTile(context);
  }
}
