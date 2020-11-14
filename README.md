# Цифровой прорыв 2020. Кейс Россети





## Общая информация

Проект написан на флаттер, для достижения максимальной кроссплатформанности, для каждой из платформ написаны свои компоненты.

В проекте реализована основная функциональность, кроме этого реализована система аналитики, а также админ-панель для управления тестами. 
Сделаны все валидации, вёрстка адаптирована под все современные экраны.



Минимальные версии ОС:

Android - **4.1**

IOS - **8**

Поддерживаемые браузеры:
-   Chrome (mobile & desktop)
-   Safari (mobile & desktop)
-   Edge (mobile & desktop)
-   Firefox (desktop)


## Дополнительно


Для проекта написан сервер:

[https://github.com/daniilsv/cp_2020_rosset_back](https://github.com/daniilsv/cp_2020_rosset_back)

Админ-панель:

[https://github.com/MysticalNobody/cp_2020_rosset_admin](https://github.com/MysticalNobody/cp_2020_rosset_admin)


### Релиз:



Скачать APK (Android)

https://tod.itis.team/android.apk

WEB-версия

https://tod.itis.team/




## Сборка

### Android

Для начала, необходимо скачать и установать Flutter, а также настроить IDE

https://flutter.dev/docs/get-started/install

https://flutter.dev/docs/get-started/editor?tab=vscode

После базовой настройки для запуска необходимо выполнить следующие команды(для Android):



> cd *project dir*

> flutter packages get

> flutter run --release

или для сборки apk

> flutter build apk --release



https://flutter.dev/docs/deployment/android



###  IOS:



> cd *project dir*

> flutter packages get

> flutter build ios

Дальше запускать проект в Xcode



https://flutter.dev/docs/deployment/ios


###  WEB:

> flutter channel beta

> flutter upgrade

> flutter config --enable-web

> cd *project dir*

> flutter packages get

> flutter build web

https://flutter.dev/docs/deployment/web

## Структура проекта

Проект основан на архитектурном паттерне [GetX Pattern](https://github.com/kauemurakami/getx_pattern)
