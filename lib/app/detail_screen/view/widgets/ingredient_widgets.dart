import 'package:flutter/material.dart';
import 'package:food_reciepi/app/add_reciepie/view_model/auth_services.dart';
import 'package:provider/provider.dart';

class IngredientWidgetCard extends StatelessWidget {
  const IngredientWidgetCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Text(context
                      .read<AddRecipiAuth>()
                      .ingredientListModel
                      .ingredient1
                      .toString())),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Text(context
                      .read<AddRecipiAuth>()
                      .ingredientListModel
                      .quantity1
                      .toString()))
            ],
          ),
        ),
      ],
    );
  }
}
