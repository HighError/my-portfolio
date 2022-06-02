import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/footer_icon.dart';
import 'package:higherror_portfolio/modules/header_item.dart';
import 'package:higherror_portfolio/modules/project.dart';
import 'package:higherror_portfolio/routes.dart';
import 'package:simple_icons/simple_icons.dart';

class Data {
  static final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  static final footerItems = <FooterIcon>[
    FooterIcon(
        title: 'LinkedIn',
        icon: SimpleIcons.linkedin,
        url: 'https://www.linkedin.com/in/vitaliy-hordiyk/'),
    FooterIcon(
        title: 'Twitter',
        icon: SimpleIcons.twitter,
        url: 'https://twitter.com/higherrorua'),
    FooterIcon(
        title: 'Itch IO',
        icon: SimpleIcons.itchdotio,
        url: 'https://higherror.itch.io/'),
    FooterIcon(
        title: 'GitHub',
        icon: SimpleIcons.github,
        url: 'https://github.com/higherror'),
  ];

  static final headerItems = <HeaderItem>[
    HeaderItem(
        title: 'Home',
        icon: Icons.home,
        onTap: () {
          navigationKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.homeRoute, (route) => false);
        }),
    HeaderItem(
        title: 'Projects',
        icon: Icons.inventory_2,
        onTap: () {
          navigationKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.projectsRoute, (route) => false);
        }),
  ];

  static final projects = <Project>[
    Project(
      title: 'Road to Treasure',
      description:
          'Нескінченний top-down-скроллер написаний на Unity в рамках Ludum Dare 48. Мета гравця зібрати чим більше монет не торкаючись злих привидів та пасток.',
      tags: [ProjectTag.gamejam(), ProjectTag.unity()],
      links: [
        ProjectLink(
            title: 'Source Code',
            url: 'https://github.com/HighError/LudumDare48',
            icon: SimpleIcons.github),
        ProjectLink(
            title: 'Itch.io',
            url: 'https://higherror.itch.io/road-to-treasuare',
            icon: SimpleIcons.itchdotio),
      ],
    ),
    Project(
      title: 'Book Dungeon',
      description:
          'Нескінченний рогалик, де ви граєте за відьму. На шляху вам зустрінуться монстри, які будуть заважати вам проходити дальше та книги, які можуть як допомогти так і нашкодити. Генерація рівнів схожа на гру The Binfing of Isaac. Гра була розроблена в рамках Mini Jame Gam #3 та зайняла 3 других та 2 третіх місця в категоріях.',
      tags: [ProjectTag.gamejam(), ProjectTag.unity()],
      links: [
        ProjectLink(
            title: 'Source Code',
            url: 'https://github.com/HighError/LibraryDungeon',
            icon: SimpleIcons.github),
        ProjectLink(
            title: 'Itch.io',
            url: 'https://higherror.itch.io/bookdungeon',
            icon: SimpleIcons.itchdotio),
      ],
    ),
    Project(
      title: 'Silent Revolution',
      description:
          'Гравець відіграє роль керівника хакерського угрупування, яке здійснює революцію. Гра розроблена в рамка AB Game Jam 2021 та зайняла перше місце в категорії "Найкраща реалізація теми"',
      tags: [ProjectTag.gamejam(), ProjectTag.unity()],
      links: [
        ProjectLink(
            title: 'Source Code',
            url:
                'https://github.com/HighError/Silent-Revolution-GameJam-prototype',
            icon: SimpleIcons.github),
        ProjectLink(
            title: 'Itch.io',
            url: 'https://higherror.itch.io/silent-revolution',
            icon: SimpleIcons.itchdotio),
      ],
    ),
    Project(
      title: 'Ukraine News',
      description:
          'Додаток розроблений на Flutter, який дозволяє читати новини з різних джерел в одній стрічці. Додаток мав сканувати новини з телеграму, твіттеру та фейсбуку, но через технічні проблеми, я не зміг реалізувати це. Наразі додаток показує новини з декількох сторінок твіттеру.',
      tags: [ProjectTag.flutter()],
      links: [
        ProjectLink(
            title: 'Source Code (Client)',
            url: 'https://github.com/HighError/Eviloma-Ukraine-News-Client',
            icon: SimpleIcons.github),
        ProjectLink(
            title: 'Source Code (Server)',
            url: 'https://github.com/HighError/Eviloma-Ukraine-News-Server',
            icon: SimpleIcons.github),
        ProjectLink(
            title: 'Website',
            url: 'https://news.eviloma.xyz/',
            icon: Icons.language),
      ],
    ),
  ];
}
