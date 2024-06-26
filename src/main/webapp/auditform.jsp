<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Audit Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f7ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            width: 60%;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 51, 102, 0.1);
            padding: 20px;
            border-radius: 8px;
        }
        h1, h2 {
            text-align: center;
            color: #003366;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }
        input[type="text"],
        input[type="email"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="file"] {
            margin-top: 5px;
        }
        button {
            background-color: #003366;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #002147;
        }
        .suggestion-box {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background-color: #fff;
            border: 1px solid #ccc;
            border-top: none;
            border-radius: 0 0 5px 5px;
            z-index: 100;
            max-height: 200px;
            overflow-y: auto;
            display: none;
        }
        .suggestion-box ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        .suggestion-box li {
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .suggestion-box li:hover {
            background-color: #f0f0f0;
        }
        .annex-clause {
            position: relative;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Findings Form</h1>
    <form action="processAuditform.jsp" method="post" enctype="multipart/form-data" onsubmit="showNotification()">
        <h2>Audit Information</h2>
        <label for="audit_department">Audit Department:</label>
        <input type="text" name="audit_department" id="audit_department" required>
        <label for="audit_name">Audit Name:</label>
        <input type="text" name="audit_name" id="audit_name" required>
        <label for="start_date">Start Date:</label>
        <input type="date" name="start_date" id="start_date" required>
        <label for="end_date">End Date:</label>
        <input type="date" name="end_date" id="end_date" required>

        <h2>Auditor</h2>
        <div id="auditorsContainer">
            <label for="uname">Auditor Name:</label>
            <input type="text" name="uname" id="uname" required>
            <label for="uemail">Auditor Email:</label>
            <input type="email" name="uemail" id="uemail" required>
            <label for="auditorid">Auditor ID:</label>
            <input type="text" name="auditorid" id="auditorid" required>
        </div>

        <h2>Auditee</h2>
        <label for="auditeename">Auditee Name:</label>
        <input type="text" name="auditeename" id="auditeename" required>
        <label for="auditeedepartment">Auditee Department:</label>
        <input type="text" name="auditeedepartment" id="auditeedepartment" required>

        <h2>Findings</h2>
        <label for="findings">Enter Findings:</label>
        <textarea name="findings" id="findings" required></textarea>
        <label for="picture">Upload Picture:</label>
        <input type="file" name="picture" id="picture">

        <h2>Annex</h2>
        <div class="annex-clause">
            <label for="annex">Annex:</label>
            <input type="text" name="annex" id="annex" autocomplete="off">
            <div class="suggestion-box">
                <ul id="annex-suggestions"></ul>
            </div>
        </div>

        <h2>Clause</h2>
        <div class="annex-clause">
            <label for="clause">Clause:</label>
            <input type="text" name="clause" id="clause" autocomplete="off">
            <div class="suggestion-box">
                <ul id="clause-suggestions"></ul>
            </div>
        </div>

        <br><br>
        <button type="submit">Submit Audit</button>
    </form>
</div>

<script>
    function showNotification() {
        alert("Findings have been submitted!");
    }

    const annexInput = document.getElementById('annex');
    const clauseInput = document.getElementById('clause');
    const annexSuggestionsBox = document.getElementById('annex-suggestions');
    const clauseSuggestionsBox = document.getElementById('clause-suggestions');

    const annexList = [
        "Annex A: Faculty Profiles",
        "Annex B: Course Catalog",
        "Annex C: Academic Calendar",
        "Annex D: Research Publications",
        "Annex E: Student Handbook",
        "Annex F: Budget Allocation",
        "Annex G: Infrastructure Details",
        "Annex H: Academic Policies",
        "Annex I: Student Enrollment Statistics",
        "Annex J: Staff Directory"
    ];

    const clauseList = [
        "Clause 1: Admission Procedures",
        "Clause 2: Student Enrollment Statistics",
        "Clause 3: Faculty Recruitment and Evaluation",
        "Clause 4: Student Assessment and Grading Policies",
        "Clause 5: Research Funding and Grants",
        "Clause 6: Campus Facilities Management",
        "Clause 7: Quality Assurance and Accreditation",
        "Clause 8: Student Support Services",
        "Clause 9: Financial Management and Budgeting",
        "Clause 10: Academic Partnerships and Collaborations"
    ];

    function handleInput(inputElement, suggestionBox, list) {
        inputElement.addEventListener("input", function() {
            const inputValue = this.value.toLowerCase();
            suggestionBox.innerHTML = "";

            if (inputValue.length > 1) {
                const filteredSuggestions = list.filter(item =>
                    item.toLowerCase().includes(inputValue)
                );

                if (filteredSuggestions.length > 0) {
                    filteredSuggestions.forEach(item => {
                        const listItem = document.createElement("li");
                        listItem.textContent = item;
                        listItem.addEventListener("click", function() {
                            inputElement.value = this.textContent;
                            suggestionBox.innerHTML = "";
                            suggestionBox.parentElement.style.display = "none";
                        });
                        suggestionBox.appendChild(listItem);
                    });

                    suggestionBox.parentElement.style.display = "block";
                } else {
                    suggestionBox.parentElement.style.display = "none";
                }
            } else {
                suggestionBox.parentElement.style.display = "none";
            }
        });
    }

    handleInput(annexInput, annexSuggestionsBox, annexList);
    handleInput(clauseInput, clauseSuggestionsBox, clauseList);

    document.addEventListener("click", function(event) {
        if (!annexInput.contains(event.target) && !clauseInput.contains(event.target) &&
            !annexSuggestionsBox.contains(event.target) && !clauseSuggestionsBox.contains(event.target)) {
            document.querySelectorAll('.suggestion-box').forEach(box => {
                box.parentElement.style.display = "none";
            });
        }
    });
</script>
</body>
</html>
