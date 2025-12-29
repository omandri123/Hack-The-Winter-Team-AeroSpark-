# Hack-The-Winter-Team-AeroSpark
This is the GitHub repository for our project submission in Hack the Winter hackathon.
<br />Project Name - BID (Blockchain Identification)
<br />Theme - Blockchain, IOT

## WHY BID (Blockchain Identification) ?
In today’s digital world, Aadhaar and other government-issued identity documents are used widely for verification in hotels, malls, KYC processes, and online registrations. However, the Supreme Court of India has restricted the use of Aadhaar as the sole proof of identity due to increasing concerns about privacy, forgery, and misuse. The fragile and easily replicable nature of Aadhaar cards has led to numerous incidents where forged or illegally obtained Aadhaar data was used for malicious activities, including criminal impersonation and unauthorized access.
<br ><br >Example :- Whenever we go to a hotel, mall, or cinema, the only requirement is to show or submit an Aadhaar card, and based on that, anyone is permitted entry. Today, Aadhaar cards are very easy to forge, and there are numerous cases where Aadhaar cards have been falsified.
## Cases of Aadhaar Card forgery

![fake aadhaar](https://github.com/user-attachments/assets/127dd9f7-b2d4-40c1-9095-4d714a6c1b9c)


### We cannot be dependent on such weak identity protection.

## Government Action :
The Supreme Court of India has clarified that Aadhaar cannot be considered a definitive proof of attributes such as age or citizenship, and its use as a standalone identity document is limited to specific, legally authorized purposes. Despite this, Aadhaar continues to be widely used for verification in places like hotels, malls, and online portals, often without sufficient validation or authorization.

![WhatsApp Image 2025-10-27 at 18 15 18 (1)](https://github.com/user-attachments/assets/2870142c-38dc-4892-a7b0-315128782b91)
![WhatsApp Image 2025-10-27 at 18 15 19 (1)](https://github.com/user-attachments/assets/cb031af4-0c7c-4c80-a960-49524630deaa)

# What is BID (Blockchain Identification) ?

To address the issues of data privacy, forgery, and unreliable identity verification, the proposed system introduces a __Blockchain-based Identity Verification Platform (BID)__ — a secure, decentralized, and tamper-proof digital identity network. The BID platform ensures that identity verification can occur without exposing or storing sensitive personal data in any centralized database.
<br /><br />The system functions as a trust layer between individuals and organizations (such as hotels, KYC agencies, or online portals) that require identity validation. Instead of repeatedly submitting personal documents like Aadhaar or PAN cards, users can register once on the BID platform and receive a unique Blockchain ID (BID) linked to their verified credentials.




## Key Components of BID 
1.	__User Registration and Verification__
* Users register by submitting verified__ information such as Aadhaar number, PAN number, Date of Birth, and Address Proof through the BID platform.
*	Submitted data is authenticated once through official verification APIs or manual validation.
*	Upon successful validation, the user’s details are hashed and stored on the blockchain ledger — not the raw data itself — ensuring immutability and privacy.
2.	__Blockchain-Based Storage__
*	Instead of storing actual personal data, the system stores cryptographic hashes of verified information in blockchain blocks.
*	Each transaction (registration, verification, update) is recorded as a new block linked cryptographically to the previous one, ensuring tamper-proof integrity.
3.	__Generation of BID (Blockchain ID)__
*	Every user is assigned a unique Blockchain ID after verification.
*	This BID acts as a decentralized identity token that can be used universally across multiple platforms for identity verification.
4.	__Privacy-Preserving Verification Mechanism__
*	When a third party (such as a hotel or an online platform) needs to verify a user, they only check the authenticity of the BID, not the personal details behind it.
*	For example, a website that needs to confirm if a user is above 18 can verify that fact directly from the blockchain without accessing the user’s Date of Birth or Aadhaar number.
5.	__Decentralization and Security__
*	As blockchain is decentralized, no single entity controls the stored data.
*	Data is distributed across multiple nodes, making it virtually impossible to hack, forge, or alter.
*	Cryptographic validation ensures that only the rightful owner of the BID can authorize verification requests.
6.	Integration Possibilities
*	The system can be easily integrated into government services, financial institutions, KYC platforms, and even private websites.
*	APIs can allow any authorized organization to verify a BID for authenticity, status, or specific eligibility conditions.

<img width="1280" height="720" alt="BID FLOWGRAM" src="https://github.com/user-attachments/assets/3d0cca1a-1b07-463e-9fc0-021817e27e5d" />


## BID Mechanism (Step by Step Procedure):
The Blockchain Mechanism is the core foundation of the BID (Blockchain Identity Verification) platform. It ensures that user identity information is securely stored, immutable, and verifiable without exposing private details. Blockchain technology enables a decentralized, tamper-proof, and transparent method for managing identity verification processes.
________________________________________
1. Data Entry and Hash Generation
* When a user registers on the BID platform, they submit personal identification details such as:
*	Full Name
*	Aadhaar Number
*	PAN Number
*	Date of Birth
*	Address Proof (e.g., Electricity Bill or Utility Bill)
* Instead of storing this data directly, the system processes it through a cryptographic hash function (such as SHA-256).
A hash is a fixed-length alphanumeric code that uniquely represents the user’s information but cannot be reverse-engineered to reveal the original data.
* For example:
User Data → Hash → Stored on Blockchain
This ensures that even if the blockchain ledger is publicly viewable, no personal data is ever exposed.
________________________________________
2. Block Creation
* Each verified user’s hashed identity is stored as a block in the blockchain.
A block contains:
1.	Block ID
2.	User Hash (encrypted identity)
3.	Timestamp
4.	Digital Signature of verification authority
5.	Previous Block Hash (linking to the earlier block)
* These elements together form a chain of blocks, where every new block depends on the previous one. This creates a continuous, verifiable sequence that cannot be altered without breaking the entire chain.
________________________________________
3. Consensus Mechanism
* Before a new block is added to the blockchain, the network must agree that the data is valid.
* This is achieved using a consensus algorithm, such as Proof of Authority (PoA) or Proof of Stake (PoS) — ideal for private or permissioned blockchains like BID.
1.	The verification nodes (trusted entities such as government servers, banks, or certified institutions) validate the authenticity of the user’s documents.
2.	Once approved, the new block is added to the blockchain and distributed to all nodes.
* This ensures that no single authority can manipulate or fake identity data.
________________________________________
4. Decentralized Storage
* After consensus, the new block is stored across multiple nodes in the network.
* Each node holds an identical copy of the ledger.
* If one node is compromised, others retain the correct, verified data — making the system resilient to hacking or corruption.
________________________________________
5. Verification Using BID
* When an organization (e.g., a hotel or online KYC portal) needs to verify a user:
1.	The user provides their Blockchain ID (BID).
2.	The system retrieves the corresponding hash from the blockchain.
3.	It compares the verification request against the stored hash to confirm authenticity.
*	If the hash matches, verification is successful.
*	The verifier does not receive the actual personal details.
This method allows “Yes/No” verification (e.g., “Is this user verified?” or “Is this user above 18?”) without revealing sensitive data.
________________________________________
6. Immutability and Transparency
* Once a block is added:
1. It cannot be edited or deleted.
2.	Every change (if ever needed) must be added as a new block.
3. This creates a transparent, time-stamped history of all verification events — ensuring full accountability and traceability


## Advantages of BID 

The BID System offers a wide range of advantages over traditional identity verification methods by combining security, privacy, and efficiency through blockchain technology.
________________________________________
1. Enhanced Security
*	All identity data is encrypted and hashed before storage, making it impossible for unauthorized users to access or modify information.
*	The decentralized nature of blockchain ensures that there is no single point of failure or vulnerability to hacking.
________________________________________
2. Immutability of Data
*	Once identity data is recorded as a block, it cannot be altered or deleted.
*	Every modification or update is stored as a new block, ensuring complete traceability of all verification events.
________________________________________
3. Data Privacy
*	Personal information is not stored directly on the blockchain.
*	Only hashed values are recorded, protecting the user’s sensitive data from exposure while still allowing for verification.
*	Verification is possible through yes/no responses without sharing personal details.
________________________________________
4. Elimination of Identity Fraud
*	Each BID is unique and tamper-proof, preventing misuse of identity documents like Aadhaar or PAN.
*	The blockchain ledger ensures that fake or duplicated identities cannot exist within the system.
________________________________________
5. Transparency and Trust
*	Every verification transaction is time-stamped and recorded permanently on the blockchain.
*	Authorized institutions can audit verification events anytime, ensuring public transparency and organizational accountability.
________________________________________
6. Decentralized Verification
*	The system operates on a distributed network of trusted nodes (such as government or banking authorities).
*	This decentralization removes dependency on a single authority, ensuring that no organization can manipulate or falsify data.
________________________________________
7. Faster KYC and Authentication
*	Traditional KYC processes require multiple document verifications across different organizations.
*	With BID, once the identity is verified, it can be instantly validated across institutions, drastically reducing verification time and costs.
________________________________________
8. Cost Efficiency
*	Eliminates the need for repeated manual verification, printing, and third-party intermediaries.
*	Reduces the operational expenses for banks, telecom companies, and government agencies that rely on identity validation.
________________________________________
9. User Empowerment
*	Users have full control over when and how their identity is shared.
*	They can grant or revoke verification access using their Blockchain ID (BID), promoting self-sovereign identity management.
________________________________________
10. Scalability and Interoperability
*	The blockchain framework can easily integrate with existing systems such as UIDAI, banks, or universities.
*	The modular design allows scaling to millions of users without compromising performance or data integrity.


# What we are working on so far :
We have developed our blockchain code using python, which is provided above in the __block_chain.py__ file.
Now, we are working on the UI of the BID registeration portal. We will use __Flutter__ to make our UI. So we can just use a single code-base for different platforms and devices.
And we are also working on connecting our BID network with IOT system, so that user can use a RFID card for identification whenever they need.

In Second round, we will complete the UI as well as connect an IOT system for BID identification.

### Thank You











