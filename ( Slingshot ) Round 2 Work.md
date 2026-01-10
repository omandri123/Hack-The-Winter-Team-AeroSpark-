# SlingShot Round 2
## What we have created ?
We have built a Blockchain-Based Identification (BID) system that allows users to securely register their personal identity information and receive a unique, immutable Blockchain ID (BID).
This BID acts as a digital proof of identity that can be verified using blockchain principles.

### Our system consists of two tightly integrated components:

1. Backend Blockchain Server (Python + Flask)

2. Frontend Identity Registration Application (Flutter)

## 1️⃣ Backend: Blockchain Implementation (Python + Flask) ( blockchain.py ) file
The backend of the system is implemented using Python with the Flask framework and serves as the core blockchain engine of the application. It includes a custom-built blockchain structure that creates and manages blocks containing user identity data. Each block stores the submitted data, a cryptographic SHA-256 hash, the hash of the previous block, and a timestamp, thereby forming an immutable chain of records. A Genesis Block is created at initialization to anchor the blockchain. The backend exposes RESTful APIs that allow the frontend to add new blocks and retrieve the complete blockchain for verification and auditing purposes. When identity data is received from the UI, the backend generates a unique hash that acts as a Blockchain Identification Number (BID), ensuring data integrity, tamper detection, and uniqueness. Overall, the backend blockchain module provides secure storage, cryptographic linking, and transparent access to identity records while remaining lightweight and suitable for educational and prototype-level implementations.


#### 1. Custom Blockchain Architecture
<img width="1131" height="753" alt="image" src="https://github.com/user-attachments/assets/f0260719-462f-411b-87df-0571a6f111ba" />

We implemented a custom blockchain from scratch, without using third-party blockchain frameworks.

Each block in our blockchain contains:

1. User identity data (JSON)

2. Current block hash

3. Previous block hash

4. Timestamp

This creates a cryptographically linked chain, where every block depends on the previous one.

#### 2. Genesis Block

When the blockchain starts, a Genesis Block is created automatically.

Purpose of the Genesis Block:

1. Acts as the foundation of the blockchain

2. Ensures the chain is never empty

3. Provides a fixed reference point for future blocks

#### 3. Cryptographic Hashing
<img width="445" height="61" alt="image" src="https://github.com/user-attachments/assets/d2819207-1793-4473-8af6-c81085f2e957" />


We used SHA-256 hashing to generate block identifiers.

**Hash = SHA256(User Data + Previous Block Hash)**



This ensures:

1. **Immutability** – changing data changes the hash

2. **Tamper detection** – any modification breaks the chain

3. **Uniqueness** – no two blocks produce the same BID

The block hash itself becomes the Blockchain ID (BID).

#### 4. Block Creation API
<img width="1109" height="775" alt="image" src="https://github.com/user-attachments/assets/e6ff6ac8-ad41-443e-8234-05f4092c9495" />


You exposed REST APIs using Flask:

➤ POST /add_block

1. Accepts identity data from the Flutter app

2. Creates a new block

3. Links it to the previous block

4. Returns the generated BID

➤ GET /get_chain

1. Returns the complete blockchain

2. Allows auditing and verification



## 2️⃣ User Interface (UI) Design and Functionality (Flutter)
<img width="1243" height="1016" alt="image" src="https://github.com/user-attachments/assets/45a30ae9-dfec-45c0-9241-00ddb974ca18" />

### 1. Overview of the UI

The User Interface (UI) of the system is developed using Flutter, a cross-platform UI framework.
The UI serves as the primary interaction layer between the user and the blockchain-based identity system.

Its main purpose is to:

1. Collect personal identity information

2. Facilitate document uploads for verification

3. Submit identity data to the blockchain

4. Display the generated Blockchain Identification Number (BID)

5. Provide a QR-based representation of the identity

The UI is designed to be intuitive, structured, and user-friendly, closely resembling real-world digital identity registration systems.

### 2. Technology Stack Used for UI
<img width="999" height="217" alt="image" src="https://github.com/user-attachments/assets/c57565c4-4068-4cb7-899e-ff4b5ae5074f" />


## Flutter (Dart) – Core UI framework

1. Material Design – Provides consistent layout and visual hierarchy

2. HTTP Package – Enables communication with the Flask blockchain server

3. File Picker Package – Allows users to upload PDF documents

## QR Flutter Package – Generates QR codes for blockchain IDs

1. Image Picker (Windows) – Supports image selection (optional feature)

2. This combination ensures both functional reliability and visual clarity.

### 3. Application Structure
### Entry Point (main.dart)
<img width="887" height="516" alt="image" src="https://github.com/user-attachments/assets/b49e70a9-6b59-4da9-874a-4fceff61cfc9" />

1. Initializes the Flutter application

2. Applies a consistent color scheme using ColorScheme.fromSeed

3. Loads the primary screen (PersonalDetailsForm)

4. This ensures visual consistency and centralized theme control.

### 4. Registration Form Interface
### Personal Information Section
<img width="1254" height="502" alt="image" src="https://github.com/user-attachments/assets/e48d5e48-ed98-40e0-92c6-2fbc7f8f28bb" />

The core of the UI is a personal details registration form, implemented using Flutter’s Form and TextFormField widgets.

The following fields are collected:

1. Full Name

2. Aadhaar Number

3. PAN Number

4. Date of Birth

5. Mobile Number

6. Email Address

## UI Design Considerations:

1. Each field has a clear label and icon

2. Input types are restricted (numeric, email, date) to reduce errors

3. Rounded input fields improve readability

4. Validation logic ensures no mandatory field is left empty

This design reflects KYC-style identity collection systems used by banks and government portals.

## 5. Document Upload Interface
5.1 File Selection Mechanism

The UI includes a dedicated section for uploading verification documents in PDF format:

1. Aadhaar Card

2. PAN Card

3. Date of Birth Proof

4. Address Proof

5. Passport / Voter ID (optional)

Each document upload tile:

1. Displays document type

2. Shows selected file name

3. Provides an “Upload” button

The FilePicker package ensures:

1. Only PDF files are selectable

2. File selection is simple and intuitive

Although the files are not yet sent to the blockchain, the UI is architecturally prepared for future document hashing or decentralized storage integration.

## 6. User Experience Enhancements
### 1 Visual Layout

1. Scrollable interface to support large screens

2. Images and banners to enhance branding

3. Clear section separation using dividers

4. Consistent spacing and typography

### 2. Feedback Mechanisms

1. The UI provides real-time feedback using:

2. SnackBars for success and error messages

3. AlertDialogs for displaying Blockchain ID details

4. This improves transparency and user confidence during registration.

## 7. Blockchain Submission Workflow
### 1. Data Transmission

1. When the user clicks “Submit to Blockchain”:

2. The UI gathers text-based identity data

3. Converts it into JSON format

4. Sends it to the Flask backend using an HTTP POST request

### 2 Error Handling

1. Server errors (500, 400) are clearly displayed

2. Network failures are caught and reported

3. Users receive immediate visual feedback

4. This ensures robust interaction between frontend and backend.

## 8. Blockchain ID (BID) Display
### 1. Dialog-Based Confirmation

Upon successful submission:

1. A dialog box appears showing:

2. Confirmation message

3. The generated Blockchain ID (BID)

4. A QR code encoding the BID

### 2. QR Code Integration

The QR code:

1. Allows fast identity lookup

2. Can be scanned for verification

3. Reduces manual entry errors

4. Acts as a portable digital identity token

This feature enhances usability and real-world applicability.

## 9. Cross-Platform Capability

Because the UI is built using Flutter:

The same interface can run on:

1. **Windows**

2. **Android**

3. **Web**

Future deployment requires minimal changes

This makes the system scalable and platform-independent.

## 10. Security & Privacy Considerations (UI Level)

1. Sensitive fields are clearly labeled

2. Validation prevents accidental empty submissions

3. Files are selected locally and not exposed unless uploaded

4. No blockchain logic is exposed to the user directly

5. The UI acts as a secure gateway, isolating users from backend complexity.
