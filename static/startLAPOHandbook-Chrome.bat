@ECHO OFF
call venv\Scripts\activate.bat
@ECHO Starting Python HTTP Server on port 8888...
@ECHO .
start /min "" python -m http.server 8888
:: Sleep for 3 seconds
Timeout /T 3 /NoBreak>NUL
@ECHO Launching LAPO Volunteer Handbook...
Start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://localhost:8888/"
