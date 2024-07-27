# Flutter Web CI/CD with GitHub Actions and GitHub Pages

This project demonstrates how to set up Continuous Integration and Continuous Deployment (CI/CD) for a Flutter web application using GitHub Actions and deploy it to GitHub Pages.

## Prerequisites

1. **GitHub Account**: Ensure you have a GitHub account.
2. **GitHub Repository**: Your Flutter project should be pushed to a GitHub repository.
3. **Flutter Installed**: Ensure that Flutter is installed and properly set up on your local machine.

## Step 1: Set Up Your Flutter Project for Web

1. **Enable Web Support**: If you haven't already, enable web support in your Flutter project.
   ```sh
   flutter channel stable
   flutter upgrade
   flutter config --enable-web

   
Check Flutter Devices: Verify that the web device is available.
flutter devices
flutter build web


Step 2: Push Your Flutter Project to GitHub
Initialize Git:
git init
git add .
git commit -m "Initial commit"

Create a GitHub Repository: Go to GitHub and create a new repository. Follow the instructions to push your local repository to GitHub.

Step 3: Set Up GitHub Actions for CI/CD
Create GitHub Actions Workflow:

In your GitHub repository, create a directory called .github/workflows.
Inside this directory, create a file named flutter-web.yml.
Configure the Workflow: Add the following configuration to the flutter-web.yml file:

name: Flutter Web CI/CD

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Set up Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: 'latest'

    - name: Install dependencies
      run: flutter pub get

    - name: Run tests
      run: flutter test

    - name: Build web
      run: flutter build web --release

    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: build/web


Step 4: Deploy to GitHub Pages
Enable GitHub Pages:
Go to your GitHub repository.
Navigate to Settings > Pages.
Under Source, select the gh-pages branch and click Save.

Step 5: Push Changes and Trigger Workflow
Commit and Push Changes:
git add .
git commit -m "Add GitHub Actions workflow for Flutter web"
git push origin main


Check Actions Tab: Go to the Actions tab in your GitHub repository to see the workflow running. It will build your Flutter web app and deploy it to GitHub Pages.

Access Your Deployed App: Once the workflow completes, your Flutter web app will be available at https://<username>.github.io/<repository>.





