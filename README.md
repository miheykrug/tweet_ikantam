# README

Для запуска приложения необходимо:
1) создать новое Twitter-приложение на apps.twitter.com
2) В поле "Callback URL" ввести адрес сайта плюс "auth/twitter/callback" (например: для локальной машины http://127.0.0.1:3000/users/auth/twitter/callback).
3) В каталоге приложения создать файл с именем .env
4) В файл .env внести значения Consumer Key (API Key) и Consumer Secret (API Secret) в следующем формате:
    TWITTER_KEY=xxxxxxxxxxxxxx
    TWITTER_SECRET=xxxxxxxxxxxxxx