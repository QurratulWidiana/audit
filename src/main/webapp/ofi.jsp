<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Opportunity for Improvement (OFI)</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    #ofiForm {
      width: 80%;
      max-width: 800px;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      overflow-y: auto; /* Add scroll when content exceeds the height */
    }
    h1{
        text-align: center;
    }
    h2 {
      color: #333;
    }

    label {
      display: block;
      margin-bottom: 8px;
    }

    input, select {
      width: 100%;
      padding: 8px;
      margin-bottom: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 8px;
      text-align: left;
    }

    th {
      background-color: #f2f2f2;
    }

    button {
      background-color:  #0d6efd;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
    }

    button:hover {
      background-color: #003366;
    }
  </style>
</head>
<body>

  <div id="ofiForm">
    <h1>Opportunity for Improvement</h1>

    <!-- Section 1: Audit Details -->
    <h2>Section 1: Audit Details</h2>
    <label for="auditDate">Audit Date:</label>
    <input type="date" id="auditDate" required>

    <label for="auditor">Auditor:</label>
    <input type="text" id="auditor" required>

    <label for="process">Process:</label>
    <input type="text" id="process" required>

    <label for="auditType">Audit Type:</label>
    <select id="auditType" required>
      <option value="QMS">QMS</option>
      <option value="ISMS">ISMS</option>
      <option value="academicQuality">Academic Quality</option>
    </select>

    <!-- Section 2: Table for Clauses/Annexes and Suggestions -->
    
    <table>
      <thead>
        <tr>
          <th>Clause/Annex</th>
          <th>Suggestions for Improvement</th>
        </tr>
      </thead>
      <tbody id="ofiTableBody">
        <!-- Rows will be dynamically added here -->
      </tbody>
    </table>

    <!-- Button to add a new row -->
    <button type="button" onclick="addRow()">Add Row</button>

    <!-- Submit button -->
    <button type="submit">Submit</button>
  </div>

  <script>
    function addRow() {
      const tableBody = document.getElementById('ofiTableBody');
      const newRow = tableBody.insertRow();

      const cell1 = newRow.insertCell(0);
      const clauseInput = document.createElement('input');
      clauseInput.type = 'text';
      cell1.appendChild(clauseInput);

      const cell2 = newRow.insertCell(1);
      const suggestionInput = document.createElement('input');
      suggestionInput.type = 'text';
      cell2.appendChild(suggestionInput);
    }
  </script>

</body>
</html>
