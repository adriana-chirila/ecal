@echo off

pushd "%~dp0\.."

call build_win\win_set_vars.bat

echo Downloading NPCAP
powershell -Command "& '%~dp0\download_npcap.ps1'"

set "CMAKE_OPTIONS_COMPLETE=-DECAL_NPCAP_SUPPORT=ON"

if not exist "%BUILD_DIR_COMPLETE%" mkdir "%BUILD_DIR_COMPLETE%"

CALL "%BUILD_DIR_COMPLETE%\.venv\Scripts\activate.bat"

cd /d "%WORKSPACE%\%BUILD_DIR_COMPLETE%"
cmake ../.. -A x64 %CMAKE_OPTIONS_COMPLETE% %*

popd
