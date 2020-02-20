@ECHO OFF

:: Licensed under the Apache License, Version 2.0 (the "License"); you may not
:: use this file except in compliance with the License. You may obtain a copy of
:: the License at
::
::   http://www.apache.org/licenses/LICENSE-2.0
::
:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
:: WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
:: License for the specific language governing permissions and limitations under
:: the License.

SET COUCHDB_BIN_DIR=%~dp0
SET ROOTDIR=%COUCHDB_BIN_DIR%\..\
CD "%ROOTDIR%"

SET /P START_ERL= < releases\start_erl.data
FOR /F "tokens=1" %%G IN ("%START_ERL%") DO SET ERTS_VSN=%%G
FOR /F "tokens=2" %%G IN ("%START_ERL%") DO SET APP_VSN=%%G

set BINDIR=%ROOTDIR%/erts-%ERTS_VSN%/bin
set EMU=beam
set PROGNAME=%~n0
set PATH=%PATH%;%COUCHDB_BIN_DIR%

set COUCHDB_QUERY_SERVER_JAVASCRIPT="./bin/couchjs -S 268435456 ./share/server/main.js"
set COUCHDB_QUERY_SERVER_COFFEESCRIPT="./bin/couchjs -S 268435456 ./share/server/main-coffee.js"

"%BINDIR%\erl" -boot "%ROOTDIR%\releases\%APP_VSN%\couchdb" ^
-args_file "%ROOTDIR%\etc\vm.args" ^
-config "%ROOTDIR%\releases\%APP_VSN%\sys.config" %*

:: EXIT /B
