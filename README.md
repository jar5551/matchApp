# matchApp
### Projekt studencki
matchApp to aplikacja webowa - serwis randkowy "Match".
______
Projekt jest podzielony na dwie warstwy - warstwa aplikacji działającej postronie serwera (REST API) oraz warstwa aplikacji działającej po stronie klienta. Obie warstwy projektują oraz produjuą dwa oddzielne zespoły. W finalnym etapie prac nastąpi pęłna integracja  pomiędzy backendem a frontendem.
### Jak odpalić aplikację po stronie klienta?
Aplikacja po stronie klienta jest oparta o AngularJS. Wykorzystany został generator Yeoman.

Lokalizacja w repozytorium: /frontEnd

Aby odpalić aplikację lokalnie, w trybie developerskim należy zainstalować na komputerze [NodeJS](https://nodejs.org). Po poprawnej instalacji i uruchomieniu terminala/konsoli po wpisaniu następującej komendy powinniśmy dostać informację o zainstalowanej wersji Node

`node -v`

Następnym krokiem jest instalacja Node Package Manager ([npm](https://www.npmjs.com)). W terminalu/konsoli należy wpisać

`npm install npm -g`

Następnie za pomocą npm należy zainstalować następujące rzeczy:

`npm install -g bower`

`npm install -g grunt-cli`

Teraz można przejść do instalcji wszelkich dependencies w projekcie. Odpalamy więc polecenia

`npm install`

`bower install`

Jeżeli wszysto zostało wykonane poprawnie można odpalić lokalnie serwer za pomocą grunta  poleceniem: `grunt serve`. Serwer domyślnie zostanie uruchomiony na localhoscie, na porcie 9000.


### Jak odpalić PHP RESTful API?
Aplikacja działająca po stronie serwera jest zbudowana w języku PHP w oparciu o framework Slim. Jest to prosty framework, pozwalający szybko budować RESTowe API, pozostawiając developerowi dużą swobodę jeżeli chodzi o strukturę aplikacji.

Do zarządzania zależnościami użytymi w projekcie (dependecies) użyty został Composer. Aby pobrać zależności należy mieć zainstalowany serwer Apache (np. XAMPP), php dodane jako zmienną środowiskową i w konsoli uruchomić (będąc w folderze phpApi) następujące polecenie:

`php -r "readfile('https://getcomposer.org/installer');" | php`

Spowoduje to pobranie Composera lokalnie do projektu. W repozytorium przechowywany jest jedynie plik composer.json, gdzie zapisane są wszystkie zależności, ale do jego wykorzystania będzie nam potrzebny Composer. Kiedy już go mamy to możemy uruchomić polecenie instalacji zlaeżności

`composer.phar install`

I gotowe, wszystko czego projekt potrzebuje zostało pobrane. Działa to na podobnej zasadzie co npm czy bower.

Aby uruchomić docelową aplikację na komputerze polecam skonfigurować virtualhosta lokalnie. Zalecam, dla pełnej itegracji z api użyć adresu "match.local".
