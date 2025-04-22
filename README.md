# InsuranceClaim App

The **InsuranceClaim** app is designed to help users manage insurance claims. It allows users to view, sort, and filter claims based on various criteria, as well as mark claims as reviewed. The app also features detailed claim views and an alert system for feedback.

## Table of Contents

- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [UI Screenshots](#ui-screenshots)
- [Tests](#tests)

## Features

- **Claims List View**: Displays a list of claims with options to filter and sort.
- **Claim Detail View**: Provides detailed information about a specific claim, including a "Mark as Reviewed" button.
- **Custom Alerts**: Displays custom alerts when a claim is marked as reviewed.
- **Search Functionality**: Allows users to search through claims.
- **Refresh Functionality**: Allows users to refresh the list of claims.
- **Error Handling**: Displays error messages for scenarios like no internet connection.

## Setup Instructions

To set up the project locally, follow the steps below.

### Prerequisites

1. **Xcode**: Ensure you have Xcode installed on your machine. Download it from the [App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12).
2. **Swift Version**: This project is developed using Swift 5.5+.
3. **iOS Version**: This project is developed using minimum deployment iOS 18.0.

### Clone the Repository

Clone the project to your local machine using the following command:

```bash
git clone https://github.com/yourusername/InsuranceClaim.git](https://github.com/alimusawa313/InsuranceClaim.git
```

## UI Screenshots

### All views are available in Dark and Light Mode

#### Error no internet with and without alert

<p float="left">
  <img src="https://drive.google.com/uc?export=view&id=1HF7fpc6-bZjOzsOaVmsqneNpbeL7LfYT" alt="Error no internet with alert" width="45%"/>
  <img src="https://drive.google.com/uc?export=view&id=1hdcH_pbJ3mrVz06B6UjVo3WjNdDYf3oV" alt="Error no internet without alert" width="45%"/>
</p>

#### List View (Light Mode) and (Dark Mode)

<p float="left">
  <img src="https://drive.google.com/uc?export=view&id=1G6a6jJVfKLXdG83-bQNudMTsTQrMjOvd" alt="List View Light Mode" width="45%"/>
  <img src="https://drive.google.com/uc?export=view&id=1MlEUK5TDiYNCV0-F4h73pqbQL6Y1vwZr" alt="List View Dark Mode" width="45%"/>
</p>

#### Search and DropDown Filter

<p float="left">
  <img src="https://drive.google.com/uc?export=view&id=1ADjm6tLPtnxfU5fMUEC79Mh7yA89yx9p" alt="Search" width="45%"/>
  <img src="https://drive.google.com/uc?export=view&id=1VcHhhSmf2hI76XpxfE46a3BUBNFh9Z_Y" alt="DropDown Filter" width="45%"/>
</p>

#### Detail View and Custom PopUp Alert

<p float="left">
  <img src="https://drive.google.com/uc?export=view&id=1UbwseUwOn7pEwsh0KlNuylnP4d8yEt6Y" alt="Detail View" width="45%"/>
  <img src="https://drive.google.com/uc?export=view&id=10yVJAlWSNFhHyZFKPOv2daz6hqweC80c" alt="Custom PopUp Alert" width="45%"/>
</p>



## Tests

This project includes basic unit tests using **XCTest**.

To run the tests:

1. Open the project in Xcode.
2. Select the **InsuranceClaim** scheme.
3. Press `⌘ + U` to run all unit tests.
4. Or navigate to the **Test Navigator** in Xcode and run individual tests from there.

