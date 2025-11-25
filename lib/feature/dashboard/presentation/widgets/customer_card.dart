import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genuine_task/core/network/api_client.dart';
import 'package:genuine_task/feature/dashboard/domain/entities/customer.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;
  final ApiClient api;

  const CustomerCard({
    Key? key,
    required this.customer,
    required this.api,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = customer.imagePath!.isNotEmpty ? api.imageBaseLink + customer.imagePath! : null;
    final String avater = "data:image/jpeg;base64,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";


    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Colors.blue
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: imageUrl??"",
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                placeholder: (c, s) => CircularProgressIndicator(strokeWidth: 2),
                errorWidget: (c, s, e) => Image.network(avater,fit: BoxFit.contain,),
              ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(customer.name),
                SizedBox(height: 5,),
                Text('Due: ${customer.totalDue.toStringAsFixed(2)} TK',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,color: Colors.black54
                ),),
              ],
            )
          ],
        ),
      ),
      onTap: (){
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          backgroundColor: Colors.white,
          isScrollControlled: true,
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(imageUrl != null ? imageUrl : avater),
                  ),
                  const SizedBox(height: 10),
                  Text(customer.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Basic Info")),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey
                      )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer Name"),
                                const SizedBox(height: 4),
                                Text("Customer Id"),
                                const SizedBox(height: 4),
                                Text("Email"),
                                const SizedBox(height: 4),
                                Text("Phone"),
                                const SizedBox(height: 4),
                                Text("Total Due"),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ),
                        //Spacer(),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(":  ${customer.name}"),
                                const SizedBox(height: 4),
                                Text(":  ${customer.id}"),
                                const SizedBox(height: 4),
                                Text(":  ${customer.email}"),
                                const SizedBox(height: 4),
                                Text(":  ${customer.phone}"),
                                const SizedBox(height: 4),
                                Text(":  ${customer.totalDue.toString()} TK"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
