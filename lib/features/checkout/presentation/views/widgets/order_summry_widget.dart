import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/checkout/domain/entites/order_entity.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'payment_item.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      tile: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()}جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.semiBold16,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'التوصيل  :',
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '30جنية',
                textAlign: TextAlign.right,
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            thickness: .5,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              const Text(
                'الكلي',
                style: AppTextStyles.bold16,
              ),
              const Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 30} جنيه',
                style: AppTextStyles.bold16,
              )
            ],
          ),
        ],
      ),
    );
  }
}
