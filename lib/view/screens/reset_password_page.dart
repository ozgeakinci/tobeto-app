import 'package:flutter/material.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: 'Şifre Sıfırlama'),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ProjectUtilities.sizeWidth_16,
              vertical: ProjectUtilities.projectHeight_32),
          child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons
                          .done, // Başarı durumu için bir ikon (örnekte tik işareti)
                      color: ColorScheme.light().secondary,
                      size: 48.0,
                    ),
                    SizedBox(height: ProjectUtilities.projectHeight_16),
                    Padding(
                      padding: EdgeInsets.all(ProjectUtilities.paddingAll_8),
                      child: const Text(
                        'Şifre sıfırlama e-postası başarıyla gönderildi. Lütfen e-postanızı kontrol edip, şifre sıfırlama bağlantısına tıklayınız.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
