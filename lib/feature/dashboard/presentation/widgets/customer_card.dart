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
    final avater = "https://api.dicebear.com/7.x/thumbs/png?seed=avatar1";

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
                                Text("Customer Name",style: TextStyles.light12,),
                                const SizedBox(height: 4),
                                Text("Customer Id",style: TextStyles.light12,),
                                const SizedBox(height: 4),
                                Text("Email",style: TextStyles.light12,),
                                const SizedBox(height: 4),
                                Text("Phone",style: TextStyles.light12,),
                                const SizedBox(height: 4),
                                Text("Total Due",style: TextStyles.light12,),
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
                                Text(":  ${customer.name}",style: TextStyles.light12,),
                                const SizedBox(height: 4),
                                Text(":  ${customer.id}",style: TextStyles.light12,),
                                const SizedBox(height: 4),
                                Text(":  ${customer.email}",style: TextStyles.light12,),
                                const SizedBox(height: 4),
                                Text(":  ${customer.phone}",style: TextStyles.light12,),
                                const SizedBox(height: 4),
                                Text(":  ${customer.totalDue.toString()} TK",style: TextStyles.light12,),
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


class TextStyles{
  static TextStyle light12 = TextStyle( fontSize: 12,fontWeight: FontWeight.w300);
}