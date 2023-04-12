import 'package:flutter/material.dart';
import 'package:task/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  PageController? _selecatDate =
      PageController(initialPage: DateTime.now().month - 1);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calender"),
        ),
        body: Container(
          height: 500,
          child: PageView.builder(
            controller: _selecatDate,
            itemCount: MyDate.dayInMonth.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black12,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            buildCircle("available", Colors.green.shade700),
                            const SizedBox(
                              width: 10,
                            ),
                            buildCircle("unavailable", Colors.red.shade700),
                          ],
                        ),
                        Row(
                          children: [
                            index == 0
                                ? Container()
                                : iconButton(index-1, Icons.arrow_back_ios),
                            Text(
                              "${MyDate.monthName[index]}",
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            index == MyDate.dayInMonth.length - 1
                                ? Container(
                                    width: 20,
                                  )
                                : iconButton(index+1 , Icons.arrow_forward_ios),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(MyDate.dayName.length, (index) {
                        return Text(MyDate.dayName[index],
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                            ));
                      }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: MyDate.dayInMonth[index],
                        // ignore: prefer_const_constructors
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            crossAxisSpacing: 7,
                            mainAxisSpacing: 12),
                        itemBuilder: (context, i) {
                          return Container(
                            decoration: BoxDecoration(
                              color: isAvailableDay(index + 1, i + 1),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Center(
                              child: Text(
                                '${i + 1}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: isAvailableDay(index + 1, i + 1) ==
                                            Colors.white
                                        ? Colors.grey[800]
                                        : Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconButton iconButton(int index, IconData icon) {
    return IconButton(
      onPressed: () {
        setState(() {
          _selecatDate?.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        });
      },
      icon: Icon(icon),
    );
  }

  Color isAvailableDay(int month, int day) {
    for (int i = 0; i < MyDate.availableDay.length; i++) {
      if (MyDate.availableDay[i].n_month == month &&
          MyDate.availableDay[i].n_day == day) {
        return Color.fromARGB(248, 56, 142, 60);
      }
    }
    for (int i = 0; i < MyDate.unavailableDay.length; i++) {
      if (MyDate.unavailableDay[i].n_month == month &&
          MyDate.unavailableDay[i].n_day == day) {
        return Color.fromARGB(223, 218, 29, 29);
      }
    }
    return Colors.white;
  }

  Row buildCircle(String title, Color color) {
    return Row(
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: color,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
