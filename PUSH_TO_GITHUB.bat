@echo off
echo ================================================
echo    Pushing GitHub Profile to ravi158200/ravi158200
echo ================================================
echo.

cd /d "d:\All files\github"

:: Check if git is initialized
if not exist ".git" (
    echo [1/6] Initializing git repository...
    git init
    git remote add origin https://github.com/ravi158200/ravi158200.git
) else (
    echo [1/6] Git already initialized. Checking remote...
    git remote set-url origin https://github.com/ravi158200/ravi158200.git
)

:: Set git user info (update if needed)
echo [2/6] Configuring git user...
git config user.email "ravi158200@github.com"
git config user.name "Ravi"

:: Pull latest changes first to avoid conflicts
echo [3/6] Pulling latest from GitHub...
git pull origin main --allow-unrelated-histories 2>nul || echo (No remote history yet - that's okay)

:: Stage all files
echo [4/6] Staging all files...
git add .

:: Commit
echo [5/6] Committing files...
git commit -m "Add generate-animations workflow and update README"

:: Push to main branch
echo [6/6] Pushing to GitHub...
git push -u origin main

echo.
echo ================================================
if %ERRORLEVEL% == 0 (
    echo   SUCCESS! Files pushed to GitHub!
    echo   Now go to: https://github.com/ravi158200/ravi158200/actions
    echo   and click "Run workflow" on Generate Animations
) else (
    echo   PUSH FAILED. See error above.
    echo   Common fixes:
    echo   - Make sure you are logged into GitHub in Git
    echo   - Run: git config --global credential.helper manager
)
echo ================================================
echo.
pause
