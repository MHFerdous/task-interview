*A clean and reactive Flutter app using **SupaBase** for backend, **GetX** for state management and **GetStorage** for local persistence. It showcases a complete, UX-driven onboarding, authentication, and setup flow, implementing modern mobile app design patterns.

##  App Flow Overview

### 1. **Splash / Onboarding**
- Multi-step onboarding introduces users to key app features with swipe-able pages and engaging illustrations.

### 2. **Sign In / Sign Up**
- Secure login with email/password.
- Includes a **“Remember Me”** feature—users stay logged in across sessions if checked.
- Unchecked → returns to sign-in on next launch.

### 3. **Forgot Password**
- Multi-step password recovery flow:
    - Enter email
    - Verify via code
    - Reset password
- Keeps users engaged with clear progression and feedback.

### 4. **Location Access / Language Selection**
- Requests location permission, then navigates to language selection.
- Language screen features a scrollable list with flag icons and a "Select"/"Selected" button. Selection is handled reactively via GetX.

## Installation

Install This project using the command prompt

```bash
  git clone https://github.com/MHFerdous/task-interview.git
```
```bash
  cd task-interview
```
```bash
  flutter pub get
```
```bash
  flutter run
```
