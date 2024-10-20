Flutter Architecture Template - II
Many years ago, I created an end-to-end application development template using Flutter. Currently, I'm publishing new series with better ideas and new implementations. Let's learn together!
The purpose of this article is to help you understand how to build a custom business application. The enterprise or large project has an important point to consider. I can actually discuss this topic in more detail, but for now I'd like to build this architecture from zero to hero. Come on, let's do this!
Architecture template..
Yes, that's my main goal. Actually, I have two goals, the first is to advance my coding skills (more structural); the second is to create a template. Architecture coding provides a better coding environment, a solution, testing, modularization, etc. Additionally, template will encourage team collaboration, differentiation, and many more things.
That sounds good, right?
-Yes, but don't forget that this is not suitable for only one person or side project. Teamwork is better for understanding and implementing this.
How many component is in this article
In this project, core ideas have been created for an advanced mobile project. The following are included:
e1: Create project, module with structure of folders 
e2: Development of modules by modules
In terms of networking (Vexana)
Hive caching (Isaar version)
Managing dependencies (get_it)
Management of the state (Flutter BLoC)
Using better pubspec yaml with 3.party package
A list of useful scripts
Extensions, rules, etc., for VSCode.
Creating a page structure
The navigation

Let's start this survey for begining great architecture.

1.Create Project with Structure Folders
The main idea while developing architecture, this is first point. Because it is provide to where to write coding. This think will help to organize code base in the project. Organization will adapt to your new developer to project, keep the reletaed file same folder and you knew when coming new feature request to put it in your project.my
Reasons can be going more but the think quite important. Then what is my solution? 
The solution based on moduler thinks with feature base development. It is sepearte most important logic for ex. databasse/ network etc.
// Project Structure
lib/
├── development/
│ └── preview_main.dart
├── feature/home/
│ ├── view/
│ └── view_model/
└── product/
├── cache/
├── init/
├── navigation/
├── service/
├── state/
├── utility/constans/
└── widget/
└── main.dart

module/
├── common/
├── core/
├── gen/
└── widgets/
Thisi structure will provide your every request or you can find a uprade chance. There is reason of good strcutre. you can always add extra solution.

2. Vscode extensions with Pubspec Details
   For this architecture, I use many extensions for helping coding, debugging and fast developing. The other hand I configure my vscode settings for coding better.
   Last part is snippet. I create many snippet for speed up coding. For example I create "hwaFsm" it is mean "HardwareAndro Flutter statefull Model.

It is example of "base model" snippet.

    "Base Model ": {
    	"scope": "dart",
    	"prefix": "hwaBaseModel",
    	"body": [
    		"import 'package:json_annotation/json_annotation.dart';",
    		"part '$1.g.dart';",
    		"",
    		"@JsonSerializable()",
    		"class $2 extends INetworkModel<$2> {",
    		"@override",
    		"$2 fromJson(Map<String, dynamic> json) {",
    		"return _$$2FromJson(json);",
    		"}",
    		"@override",
    		"Map<String, dynamic> toJson() {",
    		"return _$$2ToJson(this);",
    		"}",
    		"}",
    	]
    },

After the writing key word "hwaBaseModel" and tab it will create a base model. It is very useful for me. You can create your own snippet for your needs.
The other hand about pubspec.yaml. While develoing project you need to add many package. This time the important thing is "annotation" and build operation.
Annotation is very helpfull for finding package for why I use this package.

For example:
#firebase
firebase_messaging: 4.5.0
firebase_core: 3.1.0
PR: https://github.com/VB10/architecture_template_v2/pull/4

3. Localization support
   The localization is very important for mobile application the latest year. Almost all application has localization. So I want to show you how to add localization in this project.
   It will making from localization manager for language feature. The other hand is generate key for localization. I'm using "easy_localization" package for this case. I have been using this package for a long time and it is very stable.

Let's see the example of localization implementation. First part of is define your key with value in the json. The important thing is the key. You can use argument for dynamic value.
For example: You want to show "Save 10000" in the button. You can use {count} for dynamic value.

{
"home": {
"title": "Home Page"
},
"general": {
"button": {
"save": "Save {}"
}
}
}

The other part is localization manager. You can see the example of localization manager.
final class ProductLocalization extends EasyLocalization {
/// ProductLocalization need to [child] for a wrap locale item
ProductLocalization({
required super.child,
super.key,
}) : super(
supportedLocales: \_supportedItems,
path: \_translationPath,
useOnlyLangCode: true,
);

static final List<Locale> \_supportedItems = [
Locales.tr.locale,
Locales.en.locale,
];

static const String \_translationPath = 'asset/translations';

/// Change project language by using [Locales]
static Future<void> updateLanguage({
required BuildContext context,
required Locales value,
}) =>
context.setLocale(value.locale);
}

This class will help to define your language support and change language in the app. Before the using this class don't forget to add a asset/translations folder and json file.
assets: - asset/translations/

Lastly it's need to work build runner for generate a code. (I'll explaing code generation in the next section)
Finally localization is ready to use. Just call with LocaleKeys;

example:
Text(LocaleKeys.home_title.tr());

Easy Localization Package: https://pub.dev/packages/easy_localization
PR: https://github.com/VB10/architecture_template_v2/pull/2

4. Project requirements while app staring and Environment management
   The application start with requirements. Many things can be checked before running the application. For example, internet permission, camera permission, database connection, etc.
   I want to show you how to manage this situation.

Environment management is very important for mobile application. It has many values for example change base url, api key, etc. The thing is how to keep this in project.
Envied package is very useful for this case. it helps to manage environment variable with obfuscate. It is not mean very secure but it is very useful for this case.

Let's check the implemntation when application start.

/// This method is used to initialize the application process
Future<void> \_initialize() async {
await EasyLocalization.ensureInitialized();
EasyLocalization.logger.enableLevels = [LevelMessages.error];
await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
// TODO: Splash
await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      /// Todo: add custom logger
      Logger().e(details.exceptionAsString());
    };

    AppEnvironment.general();
    // Depedency initialize
    // envied

}

It is general request for project. Error handling is helping to find a see a error. system chrome is for device orientation. Easy localization is for localization.
Device utility is for device information. App environment is for environment management. These are basicly required for project. Main idea is when you need to add a new requirement for project you can add this.

Important point is you need to use any implmentatiion initiilaze in splash screen. There is very good opinion for this. Every code is getting extra time while app starting. Splash page very good idea for this.

Envied Package: https://pub.dev/packages/envied
< Don't forget to add envied generator for making a code from .env file >

Let's implement this package in this project.
1- Create a new .env file then add this file to .gitignore
2- Add your base url, api key, etc.
3- Create a new file as a dev_env.dart for storing a environment variable.
4- Declare your envied path for top of class name and add your veriable like "static const baseUrl = \_DevEnv.baseUrl;"
5- Run builder for generating a code from .env file.

For example:
My envied file is look like this.

```json
BASE_URL=https://api.sample.com
```

The other hand is dev_env.dart file.

```dart
import 'package:envied/envied.dart';

part 'dev_env.g.dart';

@Envied(path: '.env')
class DevEnv {
  @EnviedField(varName: 'BASE_URL')
  static const baseUrl = _DevEnv.baseUrl;
}
```

That's it. You can use your env variable now with secure for all your variables.
Don't forget you will learn to code generation for best usage for next section so you can find a right code from this.
I complelty made general code gen in other sub module.

5. Theme & Code Generation

#Code generation
In my opinion code generation is most important thing for project. It is help to make a code easier, more readable and acssable. It is very useful for project. I'm usign many package for code genration layer. Asset gen help to make a asset easier. For example image,lottie, json, font, etc. Envied gen is for environment management with secure. Within this article manage this code genration alyer from new module. It is very easy to implement and manage.

The new module name is "gen" and it is very easy to implement and manage.
This folder has contain 4 sub module.

1- Asset Gen
2- Envied Gen
3- Model Generation

1- Asset Gen
Asset generation will using lottie, svg, font, image etc. It works by using flutter_gen package. This package is very easy to use and it is very powerful. The package needs to declare in the pubspec.yaml file.

```yaml
flutter_gen:
  output: lib/src/asset/
  integrations:
    lottie: true
    flutter_svg: true

  colors:
    inputs:
      - assets/color/colors.xml
```

After that you need to run build runner for generating a code.

```bash
flutter pub run build_runner build
```

The results are look like this.

```dart
Assets.color.black
Assets.images.imageName
Assets.lottie.animZombie
```

2- Envied Gen
Envied gen is for environment management with secure. The previous section is for this. You can find a detail for this. I just move to this module.

3- Model Generation
Model generation is for model. It is very useful for model. I'm using json_serializable package for this case. This package is very easy to use and it is very powerful. The package needs to declare in the pubspec.yaml file.

```yaml
dev_dependencies:
  json_serializable: ^6.7.1
```

Book.dart

```dart
@JsonSerializable()
@immutable
final class Book with EquatableMixin {
  const Book({
    this.type,
    this.id,
    this.attributes
  });
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  final String? type;
  final String? id;
  final Attributes? attributes;
}
```

That's it. You can use your model now with json_serializable.

2- Theme
Theme most important thing for this article. I'll create theme with "Theme Manager" and it is very easy to use. This is help to make a theme to light and dark. You can use
theme builder from material. Also text theme class for helping text theme for text theme. I was create a good article about this. You can check it. Theme main idea is
"how to make a color etc from mainly" and "how to implement new theme with easy".

vb10 theme medium

The theme structure has a main idea coming from abstract layer as a CustomTheme. It helps to make a multiple scheme like light and dark.

```dart
/// Custom theme for project design
abstract class CustomTheme {
  ThemeData get themeData;

  FloatingActionButtonThemeData get floatingActionButtonThemeData;
}
```

After that you can implement your theme like this.

```dart
/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}

```

This file for helping to make a theme basicly in font family, colorScheme etc. The other hand you can make a custom theme like FloatingActionButtonThemeData as a custom. It's need to call from MaterialApp inside.

```dart
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
```

For example you can need to use a color from colorScheme just call like this.

```dart
context.general.colorScheme.primary (this estension coming from kartal package)
```

6. Navigation structure, Scripts for helping development, 3.party package best usage

The main idea is navigation. It is very important for mobile application. I'll show you how to make a navigation structure. I'm using go_router package for this case. This package is very easy to use and it is very powerful. Especially manage a route with auto generate it is useful. Auto router package has a lot of navıgatıon feature in deeply. Let's implement this package in this project.

The app router file help to create a route with auto generate. How many page you have, you can add this flow.

```dart

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

/// Project router information class
final class AppRouter extends RootStackRouter {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: HomeDetailRoute.page),
      ];
}

```

After that you need to wrap your project with AppRouter. It is need to call MaterialApp.router then pass to your config.

```dart
final class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
```

It is almost done. After this implementation you can use like this. Also you have many feature for navigation like push, pop, replace, etc with context.router usage.

```dart
 context.router.push(HomeDetailRoute(id: user.userId.toString()));
```

> Auto router works only view file so the build yaml file can be update for work effectively.

```yaml
targets:
  $default:
    builders:
      auto_route_generator:auto_route_generator: # this for @RoutePage
        generate_for:
          - lib/**/**_view.dart
      auto_route_generator:auto_router_generator: # this for @AutoRouterConfig
        generate_for:
          - lib/product/navigation/app_router.dart
```
