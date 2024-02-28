import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tobeto_app/bloc/calendar/calendar_bloc.dart';
import 'package:tobeto_app/bloc/calendar/calendar_event.dart';
import 'package:tobeto_app/bloc/calendar/calendar_state.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/skill_card.dart';

class Calender extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calender> {
  final List<String> teachers = [
    "Halit Enes Kalaycı",
    "Engin Demiroğ",
    "İrem Balcı",
    "Gürkan İlişen"
  ];

  final String selectedTeacher = "Halit Enes Kalaycı";

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Takvim',
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state is CalendarInitial) {
            final yourDepartment = userBloc.userDepartment;
            if (yourDepartment != null) {
              context
                  .read<CalendarBloc>()
                  .add(FetchCalendarRequested(department: yourDepartment));
            } else {
              // yourData null ise, bir hata işleme mekanizması ekleyin veya uygun bir yedek değer atayın
            }
          }
          if (state is CalendarLoading) {
            return Center(
              child: Transform.scale(
                scale: 3,
                child: const CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            );
          }
          if (state is CalendarLoaded) {
            List<dynamic> _getEventsForDay(DateTime day) {
              List<dynamic> events = [];

              for (var lesson in state.derslerInfo) {
                if (lesson.derstarih.year == day.year &&
                    lesson.derstarih.month == day.month &&
                    lesson.derstarih.day == day.day) {
                  events.add('${lesson.dershoca} - ${lesson.derskonu}');
                }
              }

              return events;
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(ProjectUtilities.sizeWidth_16),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2023, 1, 1),
                      lastDay: DateTime.utc(2025, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      eventLoader: _getEventsForDay,
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                      calendarStyle: CalendarStyle(
                        cellMargin:
                            EdgeInsets.all(ProjectUtilities.sizeWidth_8),
                        todayDecoration: BoxDecoration(
                            color: TobetoAppColor.primaryBackgroundColor
                                .withOpacity(0.7),
                            shape: BoxShape.circle),
                        selectedDecoration: BoxDecoration(
                          color: TobetoAppColor.primaryBackgroundColor
                              .withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                      ),
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _selectedDay != null
                      ? Padding(
                          padding:
                              EdgeInsets.all(ProjectUtilities.paddingAll_16),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _getEventsForDay(_selectedDay!).length,
                            itemBuilder: (BuildContext context, int index) {
                              var event =
                                  _getEventsForDay(_selectedDay!)[index];
                              return SkillCard(
                                title: Text(event.toString()),
                                subTitle: Text(
                                    '${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}'),
                                icon: Icon(
                                  Icons.calendar_month,
                                  color:
                                      TobetoAppColor.colorSchemeLight.secondary,
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          } else {
            return const Center(child: Text("Yükleniyor....."));
          }
        },
      ),
    );
  }

  void calenderAddIcon(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filtre',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                  const SizedBox(height: 20),
                  DropdownButton(
                    isExpanded: true,
                    hint: const Text("Kategori Seç"),
                    value: selectedTeacher,
                    items: teachers.map((teacher) {
                      return DropdownMenuItem(
                        value: teacher,
                        child: Text(
                          teacher,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {},
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Eğitim Durumu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  buildFilterRow("Bitmiş Dersler", true),
                  buildFilterRow("Devam eden dersler", false),
                  buildFilterRow("Satın alınmış dersler", true),
                  buildFilterRow("Başlamamış dersler", false),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Vazgeç',
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Oval şeklinde kenarlar
                            ),
                          ),
                          child: const Text('Kaydet'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildFilterRow(String labelText, bool initialValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(labelText),
        Checkbox(
          value: initialValue,
          onChanged: (newValue) {
            // Checkbox'ın durumu değiştiğinde yapılacak işlemler
            /*   setState(() {
                  checkboxValue = newValue!;
                }); */
          },
        ),
      ],
    );
  }
}
