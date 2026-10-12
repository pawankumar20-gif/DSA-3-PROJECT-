@echo off
title TalentMatch DSA Project
where javac >nul 2>nul
if errorlevel 1 (
  set "JAVA_HOME=C:\Program Files\Microsoft\jdk-21.0.12.101-hotspot"
  set "PATH=%JAVA_HOME%\bin;%PATH%"
)
if not exist out mkdir out
del /q out\*.class >nul 2>&1
for /R src %%f in (*.java) do echo "%%f">>sources.txt
javac -d out @sources.txt
if errorlevel 1 (
  echo.
  echo Compilation failed.
  pause
  exit /b 1
)
del sources.txt
echo.
echo Starting TalentMatch...
echo Open http://localhost:8080
echo.
java -cp out Main
pause
