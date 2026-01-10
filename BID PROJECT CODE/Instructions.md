# Instructions to Run and Use the Blockchain Identity System

This project consists of two main components:

1. Backend Blockchain Server (Python + Flask)

2. Frontend User Interface (Flutter Application)

Both components must be running for the system to function correctly.

## 1. Prerequisites

Before running the project, ensure the following software is installed:

### Backend Requirements

1. Python 3.8 or higher

2. Flask

### Basic Python packages:

1. pip install flask

### Frontend Requirements

1. Flutter SDK (latest stable version)

2. Dart SDK (comes with Flutter)

3. Windows OS (for Windows-specific image picker)

### An IDE such as:

1. VS Code

2. Android Studio

## 2. Backend Setup (Blockchain Server)
### Step 1: Navigate to Backend File

1. Locate the Python backend file inside the lib folder:

2. lib/block_chain.py

### Step 2: Run the Flask Server

1. Open a terminal in the directory containing block_chain.py and run:

2. python block_chain.py

### Step 3: Verify Backend

If successful, the Flask server will start at:

http://127.0.0.1:5000


## Available endpoints:

1. POST /add_block – Adds identity data to the blockchain

2. GET /get_chain – Returns the complete blockchain

⚠️ Keep this server running while using the Flutter app.

## 3. Frontend Setup (Flutter Application)
### Step 1: Navigate to Flutter Project Root

Ensure the uploaded lib folder is placed inside a valid Flutter project structure.

### Step 2: Install Dependencies

Run the following command in the project root:

1. flutter pub get


This installs required packages such as:

1. http

2. file_picker

3. qr_flutter

4. image_picker_windows

### Step 3: Run the Flutter Application

To run the app on Windows:

1. flutter run -d windows


## The application UI will launch automatically.
