# ThaiPBS-2 Automation
- **Testing Framework:** Robot Framework  
- **Library:** Selenium

## Automate standards

| **Rules and conditions** | **Details** | **Examples** |
|--------------|--------------|--------------|
| File name        | ตัวเล็กทั้งหมดและใช้_ไม่เว้นวรรค ขึ้นต้นด้วย id ของ automation_id  จาก Testrail ตามด้วย test case title      | c0001_login_with_valid_credential.robot      |
| Variables        | Global variable and Built-In variable ใช้ตัวใหญ่ทั้งหมด     | ${GLOBAL_CONFIG.TIMEOUT}, ${TRUE}      |
|                  | Local variable ใช้ตัวเล็กทั้งหมดขั้นระหว่างคำด้วย _ ตามรูปแบบการต้องค่าตัวแปรแบบ snake case     | ${user.email}   or    ${user.mobile_number}   |
| Element locator  | ใช้รูปแบบ fieldname_page_fieldtype     | ${email_login_input}      |
|   |      | ${submit_login_button}      |
|   |      | ${company_register_selection}      |
|   |      | ${gender_register_radio}      |
| Keyword  | ตัวแรกตัวใหญ่ของทุกคำใน keyword name     | Click Submit Button      |
|   | การเรียกใช้ keyword ให้ระบุชื่อไฟล์ หรือ library ของ keyword เพื่อป้องกันความซ้ำซ้อน     | login.Click Submit Button      |
|   |      | SeleniumLibrary.Click Element      |
| Arguments  | ใช้ตัวเล็กทั้งหมดขั้นระหว่างคำด้วย _ ตามรูปแบบการต้องค่าตัวแปรแบบ snake case     | ${username}         |        
| Test data  | ใช้ตัวเล็กทั้งหมดขั้นระหว่างคำด้วย _ ตามรูปแบบการต้องค่าตัวแปรแบบ snake case     | ${login_abiie.success_username}         |
| Tags  | ตั้ง prefix ของ tags เพื่อสื่อความหมายที่ชัดเจน     | automaiton_id:c6267    test_type:regression    priority:high    platform:ui    feature:organization    function:create_organization         |
| Indent  | การเว้นระยะห่างระหว่าง Keyword, Arguments     | ใช้ 4 Spaces         |                 


## Repository Structure

### **Folder and File Breakdown**  

#### **Main Project Structure**  
```plaintext
AUTOMATION_ThaiPBS-2  
├── .github                   # GitHub workflows and configuration files  
├── keywords                  # Custom keywords organized by features  
│   ├── feature               # Feature-specific keywords  
│   │   ├── create_org_feature.robot  
│   │   └── login_feature.robot  
│   └── page                  # Page-specific keywords  
│       ├── create_org_page.robot  
│       ├── login_page.robot  
│       └── common.robot       # Shared utility functions  
├── resources                 # Test resources and configuration files  
│   ├── dataset               # Sample data for tests  
│   │   └── file_upload       # Files for upload tests  
│   ├── config.yaml           # Configuration settings  
│   ├── translation.yaml      # Localization data  
│   └── web.yaml              # Test data for web  
├── result                    # Test result files (log, reports, and screenshots)  
│   └── selenium-screenshot-1.png  
├── testcases                 # Test case files categorized by features  
│   └── create_org_admin      # Tests for organization creation feature  
│       ├── tc002_create_org_admin.robot  
│       └── tc017_create_org_admin.robot  
├── .gitignore                # Git ignore file  
├── execute.sh                # Shell script to run tests  
├── README.md                 # Project overview and documentation  
└── requirements.txt          # Dependencies for the project  
```

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Python**: Version 3.7 or higher
- **pip**: Latest version
- **Required Libraries**:
  - `requirements.txt`: Able to install all required library from this file

## Installation

To set up the project locally, follow these steps:

1. **Clone the Repository**:

2. **Install Dependencies**:
    ```bash
    pip install -r requirements.txt
    ```
    
## Usage

### Running Tests
To execute the test cases, use the following command from `execute.sh` file



# To follow when implement the case

## 1. General Guidelines

- **Descriptive Test Names**: Test cases should have meaningful names that describe their purpose and expected outcome.
- **Readable Documentation**: Include documentation in both English and local languages if necessary, ensuring all team members can understand the purpose of the test cases.
- **Reusable Keywords**: Use custom keywords wherever possible to avoid duplication and improve maintainability.

---

## 2. File Structure

- **Organize by Functionality**: Group test cases by functionality or module within the application, as seen with `farmer_list_success`.
- **Use of Resources**: Keep common setup tasks in external resource files (e.g., `${CURDIR}/../../resources/import.robot`).

---

## 3. Naming Conventions

### 3.1 Test Case Names

- **Descriptive Names**: Test cases should have descriptive names that explain the test scenario. Use CamelCase with underscores for separation where appropriate.
- **Test case title format**: {{Testrail_automation_id}}_{{platform (UI/API)}} - {{Test case title}}.
  
  Example:
  - ✅ `C001_UI - Verify User Can Login Success Redirect To Home Page`
  

### 3.2 Keyword Names

- **High-Level Keywords**: Keywords should represent high-level actions and encapsulate common behavior.
  
  Example:
  - ✅ `Get officer user data from API`
  - ✅ `Verify response status code should be equal as`

### 3.3 Variable Names

- **Descriptive and Consistent**: Use descriptive names for variables and avoid abbreviations that may confuse readers.
  
  Example:
  - ✅ `${response}`, `${officer_response}`
  - ❌ `${res}`

---

## 4. Test Case Structure

Each test case should follow this structure:

1. **Documentation**: Briefly explain the purpose of the test in the `Documentation` field.
2. **Tags**: Use tags to categorize and organize tests (e.g., `regression`, `farmer_list_success`).
3. **Test Steps**: Use reusable keywords for the main steps.
4. **Assertions**: Place assertions clearly at the end of the test to verify the expected outcome.

Example:
```robot
*** Test Cases ***
C001_UI - Verify User Can Login Success Redirect To Home Page
    [Tags]    status:ready    automation_id:c001    test_type:regression    priority:high    platform:ui    feature:login    function:login
    [Documentation]    Verify user can login with valid account and redirect to home page
    login_feature.Input Email Password And Sign In To Login  ${login_goody.email_admin}  ${login_goody.password_admin}
    home_feature.Verify Page Display Home Component
```

---

## 5. Keyword Design

- **Reusable Custom Keywords**: Group common actions into reusable keywords that can be used across multiple test cases. Each keyword should encapsulate a clear action or set of actions that can be easily reused across different tests.

  Example:
  ```robot
  *** Keywords ***
  Get officer user data from API
      [Documentation]    Retrieves officer user data required for authorization in API tests
      ${response}=    GET Request    /officer/data    headers=${auth_headers}
      RETURN    ${response}
  ```

Consistent Naming: Use CamelCase or spaces between words in keyword names, making them easy to read and understand.

  Example:
   - ✅ Get Officer User Data From API
   - ❌ get_officer_user_data_from_api

---

## 6. Tags and Documentation

- **Use Tags to Organize Tests** : Tags should be used to classify tests based on functionality or purpose (e.g., `automaiton_id:c6267`,   `test_type:regression`,    `priority:high`,    `platform:ui`,    `feature:organization`,    `function:create_organization`). This allows for easier test selection and execution based on categories.

  Example:
  ```robot
  [Tags]    automaiton_id:c6267    test_type:regression    priority:high    platform:ui    feature:organization    function:create_organization
  ```

- **Clear Documentation** : Use the `[Documentation]` field to explain the test case’s purpose and expected behavior, ensuring it is understandable to other team members. Keep documentation concise but informative.

  Example:
  ```robot
  [Documentation]    Verifies GET farmer list API returns correct data based on coopId and branchCoopId
  ```

---

## 7. Assertions

- **Clear Assertions**: Ensure all test cases end with clear assertions to validate expected outcomes. Assertions should always be placed as the last step in the test case to verify that the results match the expected behavior.

  Example:
  ```robot
  Verify response status code should be equal as    ${response}    ${expected_code}
  Verify farmer list response match with expected    ${actual_responses}
  ```

- **Avoid Redundant Assertions**: Ensure that the assertions are relevant to the test objective. Avoid adding multiple redundant assertions that don’t contribute to the test’s purpose.

  Example:

 - ✅ Verify response status code should be equal as ${response} ${expected_code}
 - ❌ Log ${response.status_code} (unless it's for debugging purposes)

---
## 🔐 How to use `.env` file

The `.env` file is used to store **secret variables** for local development only.  
**⚠️ Do not push this file to the main branch or share publicly.**

### 1. Create `.env.dev` file

Create a file named `.env.dev` in the **root directory** of your project.

### 2. Add variables

Define variables in the format `KEY=value`, for example:

```.env.dev
email=testemail@gmail.com
```

### 3. Use variables in Robot Framework

In your Robot Framework test scripts, use the variable by replacing `$` with `%`. Example:

```robot
login_page.Input Email    %{email}
```

### 4. Add secret to GitHub repository (for GitHub Actions)

To run GitHub Actions with the same variables:

- Go to **GitHub repository** → **Settings** → **Secrets and variables** → **Actions**
- Click **New repository secret**
- Set:
  - **Name** = variable name (e.g., `EMAIL`)
  - **Secret** = actual value (e.g., `testemail@gmail.com`)

### 5. Set up GitHub Actions workflow

In your local project, open the workflow file:  
`.github/workflows/robotframework_ci.yml`  

Add the variable in the `env:` section, referencing the secret like this:

```yaml
env:
  email: ${{ secrets.EMAIL }}
```

##  Robot Framework - Robocop & Dry Run

- **Robocop** : Running Robocop (Static Analysis)
Robocop is a linter for Robot Framework. To check for issues in your test scripts, run:

  ```robot
  robocop
  ```

- **Dry Run** : Running Dry Run (Syntax Validation)
To validate syntax without executing test cases, use the --dryrun option:

  ```robot
  robot --dryrun -d result -v LANG:en -v IS_CICD:true -i status:ready .
  ```

---
