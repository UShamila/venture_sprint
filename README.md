# VentureSprint 🚀

## Overview

VentureSprint is a mobile application that connects ALU students with student-led startups and early-stage ventures. The platform helps students discover internship opportunities while allowing startups to find talented students and manage applications.

The goal of this project is to reduce the challenges students face when searching for internship opportunities and create a simple ecosystem where students and startups can connect.

---

# Features

## Student Features

* Create an account and manage a student profile
* Add skills, education background, GitHub, and LinkedIn information
* Browse available internship opportunities
* Search and save opportunities
* Apply for internship positions
* Track application status
* Receive notifications
* View scheduled interviews

---

## Startup Features

* Create a startup account
* Manage startup profile
* Create internship opportunities
* View student applications
* Accept or reject applicants
* Schedule interviews with applicants
* View basic hiring analytics

---

# Technologies Used

## Frontend

* Flutter
* Dart
* Material 3 Design

---

## Backend / Services

* Firebase Authentication
* Cloud Firestore
* Firebase CLI

---

## State Management

* Provider

---

## Other Tools

* Android Studio
* Git & GitHub

---

# Application Flow

## Student Flow

Register/Login

↓

Complete Profile

↓

Browse Opportunities

↓

Apply for Internship

↓

Track Application

↓

Attend Interview

---

## Startup Flow

Register/Login

↓

Complete Startup Profile

↓

Post Opportunity

↓

Review Applicants

↓

Schedule Interview

↓

Manage Hiring Process

---

# Project Structure

```
lib/

├── core/
│   ├── routes/
│   └── theme/

├── models/

├── providers/

├── screens/

├── services/

└── widgets/
```

---

# Firebase Integration

The application uses Firebase for:

* User authentication
* Role-based access
* Storing student and startup profiles
* Managing opportunities
* Handling applications
* Saving notifications and interviews

---
## How to run the app

### 1. Clone the Repository

```bash
git clone https://github.com/UShamila/venture_sprint.git
```

### 2. Open the Project

```bash
cd venture_sprint
```

### 3. Install Packages

```bash
flutter pub get
```
### 4. Run the app

```bash
flutter run
```

# Author

Built by Shamila Uwineza
