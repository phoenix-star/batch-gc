@ECHO OFF
:USAGE
:START
:INITIALIZE
    SETLOCAL ENABLEDELAYEDEXPANSION
    SET BASE_DIR=%~DP0
    SET IN_GLOBALS_FILE=%1
    SET IN_VAR_NAME=%2
    SET IN_VALUE=%3

:CODE
    IF NOT EXIST "%IN_GLOBALS_FILE%" (
        COPY /Y NUL "%IN_GLOBALS_FILE%" > NUL 2>&1
    ) 
    
    FOR /F %%I IN ("%IN_GLOBALS_FILE%") DO (
        SET TEMP_GLOBALS_FILE=%TEMP%\%%~NXI
    )
    
    COPY /Y NUL "%TEMP_GLOBALS_FILE%" > NUL 2>&1

    FOR /F "TOKENS=1,2*" %%I IN (%IN_GLOBALS_FILE%) DO (
        IF NOT %%I == %IN_VAR_NAME% (
            ECHO %%I %%J >> "%TEMP_GLOBALS_FILE%"
        )
    )
    
    ECHO %IN_VAR_NAME% %IN_VALUE% >> "%TEMP_GLOBALS_FILE%"
    TYPE "%TEMP_GLOBALS_FILE%" > "%IN_GLOBALS_FILE%"
    DEL /S /Q "%TEMP_GLOBALS_FILE%" > NUL 2>&1

:RETURN
    ENDLOCAL

:EOF
