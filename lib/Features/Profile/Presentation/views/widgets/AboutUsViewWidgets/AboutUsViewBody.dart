import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: isDark ? Colors.grey.shade800 : Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                spreadRadius: 4,
                blurRadius: 8,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ]),
        child: Text(
          '''تطبيق In Egypt اتبنى بفكرة بسيطة، وهي إن مصر تستحق إن العالم كله يكتشفها بسهولة وبطريقة حديثة. إحنا فريق شغوف بالسياحة والتكنولوجيا، وقررنا نوصل الحضارة المصرية والتجارب المميزة لكل شخص، سواء كان سائح جاي لأول مرة أو مصري عايز يتعرف أكتر على بلده.

In Egypt مش مجرد تطبيق، لكنه صديقك اللي هيساعدك في كل خطوة. من أول ما تدور على مكان تزوره، لحد ما توصل وتعرف تاريخه وصوره وتشوف موقعه على الخريطة. التطبيق بيجمعلك أهم المعلومات في مكان واحد، عشان تختصر وقتك وتستمتع بتجربتك من غير تعقيد.

رؤيتنا إننا نكون المرجع الأول للسياحة في مصر، مش بس بعرض أماكن معروفة زي الأهرامات أو المتاحف، لكن كمان نسلط الضوء على الكنوز المخفية، المطاعم المحلية، الأسواق الشعبية، والشواطئ اللي مش كل الناس تعرفها.

رسالتنا إننا نخلي كل زيارة لمصر تجربة لا تُنسى. نساعدك تكتشف التاريخ، وتستمتع بالثقافة، وتعيش اللحظة.

إحنا مؤمنين إن التكنولوجيا لازم تخدم الإنسان، وعشان كده صممنا التطبيق بشكل بسيط وسهل الاستخدام، مع دعم متعدد للغات علشان نخلي مصر قريبة لكل العالم.

In Egypt… اكتشف، استمتع، وعيش تجربة مصر زي ما عمرها ما كانت متاحة قبل كده.''',
          style: AppTextStyles(context)
              .semiBold14
              .copyWith(color: isDark ? Colors.grey.shade300 : Colors.black),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
