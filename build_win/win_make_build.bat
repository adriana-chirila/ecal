@echo off

pushd %~dp0\..

call build_win\win_set_vars.bat

cmake --build "%BUILD_DIR_COMPLETE%" --parallel --config Release

popd
