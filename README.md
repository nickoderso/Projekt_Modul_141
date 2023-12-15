# Projekt_Modul_141
Dieses Repository beinhaltet das Projekt der Gruppe Gilgen




### Initial Daten (Persönlich)
Mike https://drive.google.com/file/d/1dqExdSWeQS-2JuxJp5MfIS_5T0RgXCMB/view?usp=drive_link <br>
Nick https://drive.google.com/drive/folders/1jmm8qUAnTKaKIHUInX1PoK5axRpsJVIK?usp=sharing <br>


### Infos zu Software und Umgebung
Dieses ganze Projekt wurde mithilfe eines Datenbankserver (Ubuntu Server), einem Windows Client, einem Ubuntu Client und Software wie
MariaDB, MySQL Workbench, winSCP und Putty erstellt

## Installation
### Erstellen der Datenbank
Um die Datenbank zu erstellen, öffnest du deine SQL Workbench und baust eine Verbindung mit deinem Datenbankserver auf. 
Kopiere dann den File inhalt von "Create_Database.sql". Anschliessend fügst du dieses in deine Workbench ein und führst das Gesamte script aus. 
Um den Vorgang zu testen machst du nun am besten eine "select" abfrage. Solltest du eine Fehlermedung erhalten hat etwas nicht geklappt.

### Import der Daten
Kopiere den Inhalt vom File "import_tabelle.sql" und führe diesen aus über die Workbench. <br>
Anschliessend kopierst du den Inhalt vom File "import.sql". Achte darauf, dass du den Pfad deines CSV Files im script richtig angibst.
Anschliessend führst du auch dieses Script aus. Wenn du alles richtig gemacht hast solltest du deine Datenbank nun mit Datensätzten gefüllt haben.
Überprüfe dies am besten wieder mit einer "select" Abfrage

### Umsetzung der Umgebung
Es gibt mehrere Möglichkeiten um die Umgebung umzusetzen. Das Veorgehen bleibt jedoch immer gleich: <br>
1.)   Instanzen bereitstellen (Webserver, Datenbankserver und Client) <br>
2.)   Entsprechende Rollen und Packete installieren (z.B MariaDB oder das GNA Package) <br>
3.)   Datenbank erstellen und User anlegen. <br>
4.)   Datenbank and Webserver anbinden. <br>

