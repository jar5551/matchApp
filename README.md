# matchApp
### Projekt, który spowoduje, że zaliczymy przedmiot z możliwie najwyżsą oceną
matchApp to aplikacja webowa - serwis randkowy "Match".
______
Projekt jest podzielony na dwie warstwy - warstwa aplikacji działającej postronie serwera (REST API) oraz warstwa aplikacji działającej po stronie klienta. Obie warstwy projektują oraz produjuą dwa oddzielne zespoły. W finalnym etapie prac nastąpi pęłna integracja  pomiędzy backendem a frontendem.
### Jak odpalić aplikację po stronie klienta?
Aplikacja po stronie klienta jest oparta o AngularJS. Wykorzystany został generator Yeoman.

Aby odpalić aplikację lokalnie, w trybie developerskim należy zainstalować na komputerze [NodeJS](https://nodejs.org). Po poprawnej instalacji i uruchomieniu terminala/konsoli po wpisaniu następującej komendy powinniśmy dostać informację o zainstalowanej wersji Node

`node -v`

Następnym krokiem jest instalacja Node Package  ([npm](https://www.npmjs.com)). W terminalu/konsoli należy wpisać

`npm install npm -g`

Następnie za pomocą npm należy zainstalować następujące rzeczy:

`npm install -g bower`

`npm install -g grunt-cli`

Teraz można przejść do instalcji wszelkich dependencies w projekcie. Odpalamy więc polecenia

`npm install`

`bower install`

Jeżeli wszysto zostało wykonane poprawnie można odpalić lokalnie serwer za pomocą grunta  poleceniem: `grunt serve`. Serwer domyślnie zostanie uruchomiony na localhoscie, na porcie 9000.