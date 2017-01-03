# obiekt-rekreacyjno-sportowy
HOW TO RUN:
you need to befor lunch the application run localhost MySQL server : username root with no password (this conf you can change in src/main/resources/config/application-mysql.properties)</br>
open console in main path </br>
in console insert : mvn clean spring-boot:run</br>

in Intelijj</br>
Maven Projects/Lifecycle run clean, after Plugins/spring-boot run spring-boot:run

main application path: http://localhost:8080/</br>
login path http://localhost:8080/login</br>
registration path http://localhost:8080/registration</br>

___________________________________________________________
Polish version

Aby skorzystać z praw administratora warto zalogować się na domyślne konto administratora : administrator pw administrator</br>
Następnie można wejść w mój profil gdzie odnajdziemy:</br>
*Profil :swój profil</br>
*Rezerwacje :możemy zobaczyć listę wszystkich rezerwacji</br>
*Ustawienia :zmiana wszystkich ustawień w profilu</br>
*Dodaj aktualność : dodanie jakiegoś newsa związanego z obiektem</br>
*Wiadomości : lista wszystkich wiadomości od użytkowników portalu</br>
*Raporty : raporty odnośnie tworzonych użytkowników oraz rezerwacji w ciągu dnia miesiaca i całego roku</br>

</br></br>

_____________________________________________________________

Wszyscy użytkownicy:</br>

Aby utworzyć nowego użytkownika wystarczy wejść pod adres http://localhost:8080/registration i stworzyć nowego użytkownika.</br>
Aktualności: lista aktualności dodanych przez administratora.</br>
Cennik: cennik dla wszystkich obiektów z możliwością rezerwacji : klikając rezerwacja możemy wybrać date rezerwacji oraz godziny i możemy zarezerwować sobie obiekt dla siebie</br>
Oferta: opis wszystkich dostepnych obiektów</br>
Kontakt: Możlowość napisania wiadomości do administratora </br>
Zwykły użytkownik klikając Mój profil ma możliwość tylko edycji swoich danuych.</br>

Copyright Marcin Witek Seweryn Dudek Maciej Kulikiewicz Bartłomiej Gacek
