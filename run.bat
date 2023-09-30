@echo off
setlocal enabledelayedexpansion

:: Initialize package manager command
set INSTALL_CMD = ""

:: Check if already running through Conda or Mamba package managers
where conda > NUL 2>&1
set IS_CONDA=%ERRORLEVEL%
where mamba > NUL 2>&1
set IS_MAMBA=%ERRORLEVEL%

if %IS_CONDA% == 0 (
    set INSTALL_CMD=conda
) else if %IS_MAMBA% == 0 (
    set INSTALL_CMD=mamba
)

if not "%INSTALL_CMD%" == "" (
    echo Running in %INSTALL_CMD% environment, skipping venv setup.
    %INSTALL_CMD% install --file requirements.txt
    if %ERRORLEVEL% neq 0 (
        echo Error: Failed to install requirements via %INSTALL_CMD%.
        exit /b 1
    )
    goto :skip_venv
)

:: Setting default values for python_version and venv directory
set "python_version=3.10"
set "venv_dir=.venv"

:: Override default values if arguments are provided
if not "%1" == "" set "python_version=%1"
if not "%2" == "" set "venv_dir=%2"

:: Check if venv directory exists
if exist "%venv_dir%\Scripts\python.exe" (
    :: Activate the virtual environment and print out version
    call "%venv_dir%\Scripts\activate"
    py --version
    goto :run_venv
) else (
    goto :create_venv
)

:create_venv
:: Use the py launcher for version flexibility, using the highest available patch in the specified version
echo Creating a new virtual environment.
py -%python_version% quit()
if %ERRORLEVEL% neq 0 (
    echo Python version %python_version% is not installed.
    exit /b 1
)
:: Create the venv with the py launcher command to use the latest patch installad in the specified version
py -%python_version% -m venv %venv_dir%
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to create virtual environment.
    exit /b 1
)

:run_venv
:: Activate the virtual environment
call "%venv_dir%\Scripts\Activate"

:: Check if pip is installed
where /q pip
if %ERRORLEVEL% neq 0 (
    echo pip is not installed.
    exit /b 1
)

:: Check if a virtual environment is activated
if "%VIRTUAL_ENV%" == "" (
    echo Error: No virtual environment appears to be activated.
    exit /b 1
)

:: Install the required packages into the venv
pip install -r requirements.txt -q --disable-pip-version-check
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to install requirements.
    exit /b 1
)

:: If using conda/Mamba, start from here
:skip_venv

:: Call launch.py to set/check environment variables and launch the application
python launch.py
if %ERRORLEVEL% neq 0 (
    echo Error: launch.py encountered an issue.
    exit /b 1
)