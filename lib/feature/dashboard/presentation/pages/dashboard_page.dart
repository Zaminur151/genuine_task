import 'package:flutter/material.dart';
import 'package:genuine_task/core/network/api_client.dart';
import 'package:genuine_task/feature/dashboard/domain/entities/customer.dart';
import 'package:genuine_task/feature/dashboard/presentation/controller/customer_controller.dart';
import 'package:genuine_task/feature/dashboard/presentation/widgets/customer_card.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final CustomerController controller = Get.find();
  final ApiClient api = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.fetchFirst(),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value &&
                  controller.customers.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              if (controller.customers.isEmpty) {
                return Center(child: Text('No customers found'));
              }

              return NotificationListener(
                onNotification: (notification) {
                  if (notification is ScrollNotification) {
                    if (notification.metrics.pixels >=
                        notification.metrics.maxScrollExtent - 100) {
                      controller.fetchNext();
                    }
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: controller.customers.length +
                      (controller.hasMore.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= controller.customers.length) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: CircularProgressIndicator()),
                      );
                    }
                    final Customer c = controller.customers[index];
                    return CustomerCard(customer: c, api: api);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

