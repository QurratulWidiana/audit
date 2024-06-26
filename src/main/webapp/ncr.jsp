<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Non-Conformance Reporting</title>
  <style>
    body, html {
      
      margin: 0;
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f4;
    }

    body {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #formContainer {
      width: 100%;
      display: flex;
      justify-content: center;
    }

    #ncrForm {
      width: 80%;
      max-width: 800px;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      overflow-y: auto; /* Add scroll when content exceeds the height */
    }

    .form-section {
      margin-bottom: 20px;
    }
    h1{
        color:#001f3f;
        text-align: center;
    }
    h2 {
      color: #333;
    }

    label {
      display: block;
      margin-bottom: 8px;
    }

    input, select, textarea {
      width: 100%;
      padding: 8px;
      margin-bottom: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    textarea {
      resize: vertical;
    }

    button {
      background-color: #0d6efd;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      align-content: center;
    }

    button:hover {
      background-color: #003366;
    }

    input[readonly] {
      background-color: #eee;
    }
  </style>
</head>
<body>

  <div id="formContainer">
    <form id="ncrForm">
        <h1>Non-conformance Reporting</h1>
      <!-- Section 1: Audit Details -->
      <div class="form-section">
        <h2>Section 1: Audit Details</h2>
        <label for="auditDate">Audit Date:</label>
        <input type="date" id="auditDate" required>

        <label for="ncrRefNo">NCR Reference No:</label>
        <input type="text" id="ncrRefNo" required>

        <label for="ncrCategory">NCR Category:</label>
        <select id="ncrCategory" required>
          <option value="major">Major</option>
          <option value="minor">Minor</option>
        </select>

        <label for="process">Process:</label>
        <input type="text" id="process" required>

        <label for="auditType">Audit Type:</label>
        <select id="auditType" required>
          <option value="qms">QMS</option>
          <option value="isms">ISMS</option>
          <option value="academic">Academic Quality</option>
        </select>

        <label for="auditorName">Auditor Name:</label>
        <input type="text" id="auditorName" value="John Doe" readonly>
      </div>

      <!-- Section 2: NCR Details -->
      <div class="form-section">
        <h2>Section 2: NCR Details</h2>
        <label for="standardRequirements">Standard Requirements:</label>
        <textarea id="standardRequirements" required></textarea>

        <label for="findings">Findings:</label>
        <textarea id="findings" required></textarea>

        <label for="evidence">Evidence:</label>
        <input type="file" id="evidence">

        <label for="date">Date:</label>
        <input type="date" id="date" required>

        <label for="auditee">Auditee:</label>
        <input type="text" id="auditee" required>
      </div>

      <!-- Section 3: Corrective Action Management -->
    <h2>Section 3: Corrective Action Management</h2>
    <label for="causes">Analysis the Causes of Non-Compliance:</label>
    <textarea id="causes" required></textarea>

    <label for="amendment">Amendment:</label>
    <textarea id="amendment" required></textarea>

    <label for="amendmentAction">Amendment Action:</label>
    <textarea id="amendmentAction" required></textarea>

    <label for="amendmentActionDate">Amendment Action Date:</label>
    <input type="date" id="amendmentActionDateStart" required>
    <input type="date" id="amendmentActionDateEnd" required>

    <label for="auditedBy">Audited By:</label>
    <input type="text" id="auditedBy" required>

 

      <button type="submit">Submit</button>

    </form>
  </div>

  <script>
    // You can add JavaScript for additional functionality or validation if needed
  </script>

</body>
</html>