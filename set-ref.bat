@ECHO OFF
:USAGE
:START
:INITIALIZE
    SETLOCAL ENABLEDELAYEDEXPANSION
    SET BASE_DIR=%~DP0
    SET IN_VAR_NAME=%1
    SET IN_VALUE=%2

:CODE
    SET GLOBALS_FILE=%BASE_DIR%\globals.txt
    SET REFERENCE=!%IN_VAR_NAME%!
    CALL SET-GLOBAL %GLOBALS_FILE% %REFERENCE% %IN_VALUE%

:RETURN
    ENDLOCAL

:EOF