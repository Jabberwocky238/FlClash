import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jw_clash/common/common.dart';
import 'package:jw_clash/enum/enum.dart';
import 'package:jw_clash/models/models.dart';
import 'package:jw_clash/providers/providers.dart';
import 'package:jw_clash/state.dart';
import 'package:jw_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderFragment extends ConsumerStatefulWidget {
  const OrderFragment({super.key});

  @override
  ConsumerState<OrderFragment> createState() => _OrderFragmentState();
}



class _OrderFragmentState extends ConsumerState<OrderFragment> with PageMixin {
  final ValueNotifier<OrderSelectionPageState> _state = ValueNotifier(
    const OrderSelectionPageState(),
  );

  @override
  void initState() {
    super.initState();
    ref.listenManual(
      isCurrentPageProvider(
        PageLabel.order,
        handler: (pageLabel) => pageLabel == PageLabel.order,
      ),
      (prev, next) {
        if (prev != next && next == true) {
          initPageState();
        }
      },
      fireImmediately: true,
    );
    _initPageState();
  }

  void _initPageState() async {
    _state.value = _state.value.copyWith(loading: true, error: false);
    try {
      ref.read(orderSelectionProvider.notifier).value = OrderSelectionProps(
        orders: await _fetchOrders(),
      );
    } catch (e) {
      _state.value = _state.value.copyWith(error: true);
    }
    _state.value = _state.value.copyWith(loading: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final orderSelection = ref.watch(orderSelectionProvider);
      return Consumer(
        builder: (_, ref, child) {
          return SingleChildScrollView(
            padding: baseInfoEdgeInsets,
            child: Column(
              children: [
                ..._buildOrderItems(context, orderSelection.orders),
                const SizedBox(height: 16),
                child!,
              ],
            ),
          );
        },
        child: ValueListenableBuilder<OrderSelectionPageState>(
            valueListenable: _state,
            builder: (_, state, __) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.error) {
                return const Center(
                  child: Text("加载失败"),
                );
              }
              return _buildBuyButton(context);
            },
        ),
      );
    });
  }

  List<Widget> _buildOrderItems(
      BuildContext context, List<OrderCommonProps> orders) {
    return orders
        .map((order) => _buildOrderItem(context, order))
        .separated(const SizedBox(height: 16))
        .toList();
  }

  Widget _buildOrderItem(BuildContext context, OrderCommonProps order) {
    final orderSelection = ref.watch(orderSelectionProvider);
    return CommonCard(
      type: CommonCardType.filled,
      child: ListItem.radio(
        title: Text(order.name),
        subtitle: Text("${order.price}元"),
        delegate: RadioDelegate(
          groupValue: orderSelection.selectedOrder?.orderType,
          onChanged: (value) {
            ref.read(orderSelectionProvider.notifier).selectOrder(order);
          },
          value: order.orderType,
        ),
      ),
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return CommonCard(
      type: CommonCardType.filled,
      radius: 18,
      child: ListItem(
        leading: const Icon(Icons.shopping_cart),
        title: Text(
          "购买",
          textAlign: TextAlign.center,
        ),
        onTap: () {
          // _launchUrl("https://www.baidu.com");
          final selectedOrder = ref.watch(orderSelectionProvider).selectedOrder;
          final token = ref.watch(authSettingProvider).token;
          if (selectedOrder == null) {
            globalState.showMessage(message: const TextSpan(text: "请选择订单"));
            return;
          }
          if (token == null) {
            globalState.showMessage(message: const TextSpan(text: "请先登录"));
            return;
          }
          _order(selectedOrder, token);
        },
      ),
    );
  }
}

Future<void> _order(OrderCommonProps order, String token) async {
  final url =
      "$baseUrl/alipay/create_payment?order_type=${order.orderType}&token=$token";
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw '无法打开 URL: $url';
  }
}

Future<List<OrderCommonProps>> _fetchOrders() async {
  try {
    final url = "$baseUrl/fetch_all_orders";
    final response = await request.get(url);
    // commonPrint.log("[OrderFragment] _fetchOrders response: ${response.data}");
    final orders = <OrderCommonProps>[
      ...response.data.map((e) => OrderCommonProps(
            orderType: e["order_type"],
            name: e["name"],
            price: "${e["price"]}",
          ))
    ];
    return orders;
  } catch (e) {
    commonPrint.log("[OrderFragment] _fetchOrders error: $e");
    return [];
  }
}
