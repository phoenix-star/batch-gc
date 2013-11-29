@ECHO OFF
:USAGE
:START
:INITIALIZE
    SETLOCAL ENABLEDELAYEDEXPANSION
    SET BASE_DIR=%~DP0
    SET IN_VAR_NAME=%1
    SET OUT_VAR_NAME=%1

:CODE
    SET GLOBALS_FILE=%BASE_DIR%\globals.txt
    SET REFERENCE=!%IN_VAR_NAME%!
    
    CALL GET-GLOBAL %GLOBALS_FILE% REFERENCE_COUNT[%REFERENCE%] REFERENCE_COUNT
    IF /I %REFERENCE_COUNT% GTR 0 ( 
        SET /A REFERENCE_COUNT=REFERENCE_COUNT-1
        CALL SET-GLOBAL %GLOBALS_FILE% REFERENCE_COUNT[%REFERENCE%] %REFERENCE_COUNT%
    )

:RETURN
    ENDLOCAL & (
        SET %OUT_VAR_NAME%=
    )

:EOF