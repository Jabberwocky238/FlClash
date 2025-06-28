import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseCountry extends StatefulWidget {
  const ChooseCountry({super.key});

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  ValueNotifier<List<String>> countryList = ValueNotifier<List<String>>([]);

  @override
  void initState() {
    super.initState();
    request.enzyme.getCountryList().then((value) {
      countryList.value = value ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getWidgetHeight(1),
      child: Consumer(builder: (context, ref, child) {
        final currentSelectedCountry =
            ref.watch(currentSelectedCountryProvider);
        return CommonCard(
          info: Info(
            label: "选择国家",
            iconData: Icons.language,
          ),
          onPressed: () {
            showSheet(
                context: context,
                builder: (context, type) {
                  return AdaptiveSheetScaffold(
                    type: type,
                    body: ListView.builder(
                      itemCount: countryList.value.length,
                      itemBuilder: (context, index) {
                        return ListItem.radio(
                          title: Text(countryList.value[index]),
                          delegate: RadioDelegate(
                            value: countryList.value[index],
                            groupValue: currentSelectedCountry,
                            onChanged: (value) {
                              ref
                                  .read(currentSelectedCountryProvider.notifier)
                                  .value = value;
                              BaseNavigator.pop(context);
                              globalState.appController.updateStatus(false);
                            },
                          ),
                        );
                      },
                    ),
                    title: "选择国家",
                  );
                });
          },
          child: Container(
            padding: baseInfoEdgeInsets.copyWith(
              top: 4,
              bottom: 8,
              right: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: TooltipText(
                    text: Text(
                      currentSelectedCountry ?? "点击选择国家",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.adjustSize(-2)
                          .toLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
