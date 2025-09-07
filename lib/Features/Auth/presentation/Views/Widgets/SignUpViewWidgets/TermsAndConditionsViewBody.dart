import 'package:flutter/material.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class TermsAndConditionsViewBody extends StatelessWidget {
  const TermsAndConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "مرحباً بك في تطبيق In Egypt",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 12),
          Text(
            "من خلال استخدامك لتطبيق In Egypt، فإنك توافق على الالتزام بجميع الشروط والأحكام الموضحة أدناه. يرجى قراءة هذه الشروط بعناية قبل البدء في استخدام التطبيق.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 16),

          /// 1
          Text(
            "١. الاستخدام الشخصي:",
            style: AppTextStyles(context).regular13.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "يُسمح لك باستخدام التطبيق فقط للأغراض الشخصية وغير التجارية. لا يجوز إعادة بيع أو استغلال أي محتوى لأغراض ربحية دون إذن كتابي مسبق.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 12),

          /// 2
          Text(
            "٢. المحتوى:",
            style: AppTextStyles(context).regular13.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "جميع الصور، النصوص، والمعلومات داخل التطبيق هي ملكية فكرية للتطبيق أو لمصادرها الأصلية. يمنع نسخ أو نشر المحتوى بدون إذن.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 12),

          /// 3
          Text(
            "٣. دقة المعلومات:",
            style: AppTextStyles(context).regular13.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "نحن نسعى لتوفير معلومات دقيقة ومحدثة عن المعالم السياحية والخدمات. لكن قد تحدث بعض الأخطاء أو التحديثات المتأخرة، ولا نتحمل مسؤولية أي قرار يتم اتخاذه بناءً على هذه المعلومات.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 12),

          /// 4
          Text(
            "٤. التزامات المستخدم:",
            style: AppTextStyles(context).regular13.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "يجب عليك استخدام التطبيق بطريقة قانونية وأخلاقية، وتجنب نشر أي محتوى مسيء أو مضلل أو مخالف للقوانين المحلية والدولية.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 12),

          /// 5
          Text(
            "٥. التعديلات على الشروط:",
            style: AppTextStyles(context).regular13.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "يحق لنا تعديل أو تحديث هذه الشروط في أي وقت. سيُعتبر استمرارك في استخدام التطبيق بعد التعديلات موافقة منك على الشروط المحدثة.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 12),

          /// 6
          Text(
            "٦. حدود المسؤولية:",
            style: AppTextStyles(context).regular13.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "نحن غير مسؤولين عن أي خسائر أو أضرار مباشرة أو غير مباشرة قد تنتج عن استخدام التطبيق أو الاعتماد على المعلومات المقدمة بداخله.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 12),

          /// 7
          Text(
            "٧. سياسة الخصوصية:",
            style: AppTextStyles(context).regular13.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "باستخدامك للتطبيق، فإنك توافق على سياسة الخصوصية الخاصة بنا، والتي تشرح كيفية جمع بياناتك واستخدامها وحمايتها.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 12),

          /// 8
          Text(
            "٨. التواصل:",
            style: AppTextStyles(context).regular13.copyWith(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "لأي استفسارات أو شكاوى، يمكنك التواصل معنا عبر البريد الإلكتروني أو من خلال صفحة الدعم داخل التطبيق.",
            style: AppTextStyles(context)
                .regular13
                .copyWith(color: isDark ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
