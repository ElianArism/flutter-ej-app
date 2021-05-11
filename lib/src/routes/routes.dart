import 'package:flutter/material.dart';

import 'package:app_utilidad/src/pages/alert_page.dart';
import 'package:app_utilidad/src/pages/avatar_page.dart';
import 'package:app_utilidad/src/pages/home_page.dart';
import 'package:app_utilidad/src/pages/card_page.dart';
import 'package:app_utilidad/src/pages/animated_container.dart';
import 'package:app_utilidad/src/pages/input_page.dart';
import 'package:app_utilidad/src/pages/slider_page.dart';
import 'package:app_utilidad/src/pages/listview_page.dart';

// retorna rutas de la app
Map<String, WidgetBuilder> getAppRoutes() {
  // rutas
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
  };
}
