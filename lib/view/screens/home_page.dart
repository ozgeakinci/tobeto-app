import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/big_button.dart';
import 'package:tobeto_app/view/widgets/info_banner_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      print(state);

      if (state is UserInitial) {
        context.read<UserBloc>().add(FetchUserRequested());
      }
      if (state is UserLoading) {
        return Center(
          child: Transform.scale(
            scale: 3,
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          ),
        );
      }
      if (state is UserLoaded) {
        print(state.username);
        print(state.department);
        print(state.applicationStatus);

        if (state.applicationStatus) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 15,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            state.username.isNotEmpty
                                ? 'Hoşgeldin ${state.username}'
                                : 'Hoşgeldin Kullanıcı',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: TobetoAppColor.textColor),
                        )
                      ]),
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_8,
                ),
                InfoBannerCard(
                  title: '',
                  subtitle:
                      'Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al. Aradığın “İş” Burada!',
                  color: TobetoAppColor.colorSchemeLight.secondary,
                  button: Image.asset('assets/images/hello_tobeto.png'),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                //   child: Stack(
                //     children: [
                //       Container(
                //         width: width,
                //         height: height * 0.16,
                //         decoration: BoxDecoration(
                //             color: TobetoAppColor.colorSchemeLight.secondary,
                //             borderRadius: BorderRadius.circular(20)),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Expanded(
                //             child: Padding(
                //               padding: const EdgeInsets.only(
                //                 left: 32,
                //                 top: 16,
                //                 right: 20,
                //               ),
                //               child: Text(
                //                 'Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al. Aradığın “İş” Burada!',
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .bodyMedium
                //                     ?.copyWith(
                //                         color: TobetoAppColor.textColorDark),
                //               ),
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(right: 20, top: 10),
                //             child: Image.asset(
                //               'assets/images/hello_tobeto.png',
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),

                //Bilgilendirmeler Bölümü
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bilgilendirmeler',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              BigButton(
                                  department: state.department,
                                  title: 'Başvurularım',
                                  color: isDarkMode
                                      ? TobetoAppColor.inputDarkBackground
                                      : TobetoAppColor.buttonColorLight,
                                  textColor: isDarkMode
                                      ? TobetoAppColor.textColorDark
                                      : TobetoAppColor.textColorBlack),
                              const SizedBox(
                                width: 10,
                              ),
                              BigButton(
                                  department: state.department,
                                  title: 'Eğitimlerim',
                                  color: isDarkMode
                                      ? TobetoAppColor.inputDarkBackground
                                      : TobetoAppColor.buttonColorLight,
                                  textColor: isDarkMode
                                      ? TobetoAppColor.textColorDark
                                      : TobetoAppColor.textColorBlack)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            BigButton(
                                department: state.department,
                                title: 'Duyuru ve Haberler',
                                color: isDarkMode
                                    ? TobetoAppColor.inputDarkBackground
                                    : TobetoAppColor.buttonColorLight,
                                textColor: isDarkMode
                                    ? TobetoAppColor.textColorDark
                                    : TobetoAppColor.textColorBlack),
                            const SizedBox(
                              width: 10,
                            ),
                            BigButton(
                                department: state.department,
                                title: 'Anketlerim',
                                color: isDarkMode
                                    ? TobetoAppColor.inputDarkBackground
                                    : TobetoAppColor.buttonColorLight,
                                textColor: isDarkMode
                                    ? TobetoAppColor.textColorDark
                                    : TobetoAppColor.textColorBlack)
                          ],
                        )
                      ]),
                ),

                //Gelişim Bölümü
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gelişim',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              BigButton(
                                department: state.department,
                                title: 'Sınavlarım',
                                color: const Color(0xffEC7B9C),
                                textColor: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              BigButton(
                                department: state.department,
                                title: 'Profil Oluştur',
                                color: const Color(0xff7086FF),
                                textColor: Colors.white,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            BigButton(
                              department: state.department,
                              title: 'Kendini Değerlendir',
                              color: const Color(0xff62CBA2),
                              textColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            BigButton(
                              department: state.department,
                              title: 'Öğrenmeye başla',
                              color: const Color(0xffB266FF),
                              textColor: Colors.white,
                            )
                          ],
                        )
                      ]),
                )
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 15,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          state.username.isNotEmpty
                              ? 'Hoşgeldin ${state.username}'
                              : 'Hoşgeldin Kullanıcı',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: TobetoAppColor.textColor),
                      )
                    ]),
              ),
              SizedBox(
                height: ProjectUtilities.projectHeight_8,
              ),
              InfoBannerCard(
                title: '',
                subtitle:
                    'Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al. Aradığın “İş” Burada!',
                color: TobetoAppColor.colorSchemeLight.secondary,
                button: Image.asset('assets/images/hello_tobeto.png'),
              ),
              SizedBox(
                height: ProjectUtilities.projectHeight_8,
              ),
              Text(
                'Bilgilendirmeler',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: isDarkMode
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 3),
                    ],
                    color: isDarkMode
                        ? TobetoAppColor.buttonColorDark
                        : TobetoAppColor.buttonColorLight),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "İstanbul Kodluyor Bilgilendirme",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Beklemede",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: TobetoAppColor.colorSchemeLight.error,
                                  fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.close,
                            size: 20,
                            color: TobetoAppColor.colorSchemeLight.error,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "İstanbul Kodluyor Başvuru Formu Onaylandı.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.close,
                            size: 20,
                            color: TobetoAppColor.colorSchemeLight.error,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "İstanbul Kodluyor Belge Yükleme Formu Onaylandı.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }
      // if (state is GetDepartmentInfo) {
      //   print("GetDepartmentState çalıştıı");
      //   print(state.educationDepartmentInfo);
      //   print(state.educationDepartmentInfo);

      //   return SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(
      //             left: 20,
      //             top: 15,
      //           ),
      //           child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                     state.educationDepartmentInfo.isNotEmpty
      //                         ? 'Hoşgeldin ${state.educationDepartmentInfo}'
      //                         : 'Hoşgeldin Kullanıcı',
      //                     style: Theme.of(context).textTheme.titleLarge),
      //                 const SizedBox(
      //                   height: 4,
      //                 ),
      //               ]),
      //         ),
      //       ],
      //     ),
      //   );
      // }
      else {
        return const Center(child: Text("Unknown State"));
      }
    }));
  }
}
