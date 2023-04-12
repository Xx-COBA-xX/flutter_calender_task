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
  int myIndex = DateTime.now().month - 1;

  DateTime startDateTime = DateTime(2022);
  int selectYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calender"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 500,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (constext) {
                            return yearDialog(context);
                          },
                        );
                      },
                      child: Text(
                        "$selectYear",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myIndex == 0
                      ? Container()
                      : iconButton(myIndex - 1, Icons.arrow_back_ios),
                  Text(
                    "${MyDate.monthName[myIndex]}",
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  myIndex == MyDate.dayInMonth.length - 1
                      ? Container(
                          width: 20,
                        )
                      : iconButton(myIndex + 1, Icons.arrow_forward_ios),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _selecatDate,
                  itemCount: MyDate.dayInMonth.length,
                  onPageChanged: (value) {
                    setState(() {
                      myIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:
                              List.generate(MyDate.dayName.length, (index) {
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
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7,
                                    crossAxisSpacing: 7,
                                    mainAxisSpacing: 12),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                  isAvailableDay(index + 1, i + 1) == Colors.red
                                      ? SnackBar(
                                          content: Text('This is a Snackbar'),
                                          duration: Duration(seconds: 3),
                                          action: SnackBarAction(
                                            label: 'Dismiss',
                                            onPressed: () {
                                              // Perform some action
                                            },
                                          ),
                                        )
                                      : isAvailableDay(index + 1, i + 1) ==
                                              Colors.green
                                          ? Navigator.of(context)
                                              .pushNamed("availableDay")
                                          : null;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isAvailableDay(index + 1, i + 1),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${i + 1}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: isAvailableDay(
                                                      index + 1, i + 1) ==
                                                  Colors.white
                                              ? Colors.grey[800]
                                              : Colors.white),
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog yearDialog(BuildContext context) {
    return AlertDialog(
      icon: InkWell(
        onTap: () {
          setState(() {
            myIndex = DateTime.now().month - 1;
            selectYear = DateTime.now().year;
            Navigator.of(context).pop();
          });
        },
        child: const Text(
          "To Day",
          style: TextStyle(fontSize: 19),
        ),
      ),
      content: Container(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(50, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectYear = startDateTime.year + index;
                    Navigator.of(context).pop();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${startDateTime.year + index}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            }),
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
      if (MyDate.availableDay[i].year == selectYear &&
          MyDate.availableDay[i].month == month &&
          MyDate.availableDay[i].day == day) {
        return Colors.green;
      }
    }
    for (int i = 0; i < MyDate.unavailableDay.length; i++) {
      if (MyDate.unavailableDay[i].year == selectYear &&
          MyDate.unavailableDay[i].month == month &&
          MyDate.unavailableDay[i].day == day) {
        return Colors.red;
      }
    }
    return Colors.white;
  }

  showSnakBar() {
    return const SnackBar(content: Text("unavailable Day"));
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
