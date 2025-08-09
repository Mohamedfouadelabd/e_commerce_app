import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Theme/my_theme.dart';
import 'package:flutter/material.dart';

import '../data/model/Response/ProductResponse/ProductSourceResponse.dart';

class ProductDetilsScreen extends StatefulWidget {
  static const String routeName = 'Products';

  @override
  State<ProductDetilsScreen> createState() => _ProductDetilsScreenState();
}

class _ProductDetilsScreenState extends State<ProductDetilsScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: MyTheme.primary),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Text(
                    'Product Details',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22,
                          color: MyTheme.primary,
                        ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: MyTheme.primary),
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: args.imageCover ?? '',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(args.category!.name ?? ""),
                  Text('\$${args.price?.toString() ?? ''}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: MyTheme.primary),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${args.sold?.toString() ?? ''} sold',
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(args.ratingsAverage.toString() ?? ''),
                  ),
                  Image.asset(
                    'assets/images/img_6.png',
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: MyTheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            count++;
                            setState(() {});
                          },
                          child: Icon(
                            Icons.add_circle,
                            color: MyTheme.White,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            count.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: MyTheme.White),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (count > 1) {
                              count--;
                              setState(() {});
                            }
                          },
                          child: Icon(
                            Icons.remove_circle,
                            color: MyTheme.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
       Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('Description',
             style: Theme.of(context).textTheme.titleSmall,
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(args.description??'',
               style: Theme.of(context).textTheme.titleSmall!.copyWith(
                 fontSize: 15
               ),

             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(args.brand!.name
               ??"",
               style: Theme.of(context).textTheme.titleSmall,
             ),

           ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('The quantity we have available'
                  ??"",
                style: Theme.of(context).textTheme.titleSmall,
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${args.quantity ?? ''} pcs',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),


          ],
        ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(args.createdAt??""
                 ??"",
               style: Theme.of(context).textTheme.titleSmall,
             ),

           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('\$${args.price?.toString() ?? ''}'),
               ),
               Container(

                 margin: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                   color: MyTheme.primary,
borderRadius: BorderRadius.circular(20)
                 ),
               child: Row(

                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Icon(Icons.shopping_cart,
                     size: 40,
                       color: MyTheme.White,
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('Add to cart',
                     style: TextStyle(
                       fontSize: 20,
                        color: MyTheme.White
                     ),
                     ),
                   )
                 ],
               ),
               ),


             ],
           ),

         ],
       ),
        
        
          ],
        ),
      ),
    );
  }
}
