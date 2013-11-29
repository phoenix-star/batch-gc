@ECHO OFF
:USAGE
:START
:INITIALIZE
    SETLOCAL ENABLEDELAYEDEXPANSION
    SET BASE_DIR=%~DP0
    SET IN_GLOBALS_FILE=%1
    SET IN_VAR_NAME=%2
    SET OUT_VALUE=%3

:CODE
    SET VALUE=""

    IF EXIST "%IN_GLOBALS_FILE%" (
        FOR /F "TOKENS=1,2*" %%I IN (%IN_GLOBALS_FILE%) DO (
            IF %%I == %IN_VAR_NAME% (
                SET VALUE=%%~J
            )
        )
    )

:RETURN
    ENDLOCAL & (
        SET %OUT_VALUE%=%VALUE%
    )

:EOF
