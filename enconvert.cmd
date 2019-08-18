@echo off
set arg="%1"
if %arg% == "/?" (
echo Konvertiruyu faili iz directorii v utf8
echo;
echo enconvert.cmd directory
goto EXIT1
)

echo "rabotau..."

FOR /R %arg% %%f IN (*.txt) DO (
"C:\Program Files (x86)\GnuWin32\bin\iconv.exe" -f cp866 -t utf-8 "%%f" > "%%f-utf8.txt"
copy "%%f-utf8.txt" "%%f"
del "%%f-utf8.txt"
)

:EXIT1