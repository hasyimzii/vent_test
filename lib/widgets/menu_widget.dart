import 'package:flutter/material.dart';
import 'package:vent_test/core/style.dart';

class MenuWidget extends StatelessWidget {
  final String name;
  final int price;
  final int amount;
  final String image;
  final TextEditingController notesController;
  final VoidCallback plusFunc;
  final VoidCallback minFunc;

  const MenuWidget({
    super.key,
    required this.name,
    required this.price,
    required this.amount,
    required this.image,
    required this.notesController,
    required this.plusFunc,
    required this.minFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(
        vertical: 9,
        horizontal: 25,
      ),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadow(2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image
          Container(
            width: 75,
            height: 75,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              image,
            ),
          ),
          const SizedBox(width: 10),
          // desc
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: boldText(15),
              ),
              Text(
                'Rp $price',
                style: primaryText(17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit_note,
                    color: primaryColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 125,
                    height: 20,
                    child: TextField(
                      controller: notesController,
                      style: regularText(9),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(9),
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Tambahkan Catatan',
                        labelStyle: regularText(9),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 5),
          // actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.indeterminate_check_box_outlined,
                  color: primaryColor,
                  size: 25,
                ),
                onPressed: minFunc,
              ),
              Text(
                amount.toString(),
                style: regularText(20),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_box,
                  color: primaryColor,
                  size: 25,
                ),
                onPressed: plusFunc,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
