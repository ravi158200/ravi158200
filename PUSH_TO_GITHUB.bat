@echo off
title GitHub Profile Sync - ravi158200
color 0A
echo ========================================================
echo    Pushing GitHub Profile Updates to ravi158200/ravi158200
echo ========================================================
echo.

cd /d "d:\All files\github"

:: Check git repository initialization
if not exist ".git" (
    echo [1/6] Initializing git repository...
    git init
    git branch -M main
    git remote add origin https://github.com/ravi158200/ravi158200.git
) else (
    echo [1/6] Git repository found. Verifying remote...
    git remote set-url origin https://github.com/ravi158200/ravi158200.git
    git branch -M main
)

:: Configure git identity
echo [2/6] Configuring git user identity...
git config user.email "raviraj7301325@gmail.com"
git config user.name "Ravi"

:: Pull latest changes to avoid conflicts
echo [3/6] Pulling latest changes from main branch...
git pull origin main --rebase 2>nul || echo (No remote history yet or local up-to-date)

:: Stage all changed and new files
echo [4/6] Staging updated files...
git add .

:: Commit changes
echo [5/6] Committing profile updates...
git commit -m "Update README profile aesthetics, workflow actions, and sync script"

:: Push to remote main branch
echo [6/6] Pushing changes to GitHub...
git push -u origin main

echo.
echo ========================================================
if %ERRORLEVEL% == 0 (
    echo   SUCCESS! GitHub Profile updated successfully!
    echo   View profile: https://github.com/ravi158200
    echo   Trigger animations: https://github.com/ravi158200/ravi158200/actions
) else (
    echo   PUSH FAILED! Check connection or git authentication.
    echo   To fix authentication: git config --global credential.helper manager
)
echo ========================================================
echo.
pause

