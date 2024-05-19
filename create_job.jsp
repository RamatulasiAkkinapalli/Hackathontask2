<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Enter Job Data</title>
    <script type="text/javascript">
        function validateForm() {
            var title = document.forms["jobForm"]["title"].value;
            var type = document.forms["jobForm"]["type"].value;
            var department = document.forms["jobForm"]["department"].value;
            var country = document.forms["jobForm"]["country"].value;
            var description = document.forms["jobForm"]["description"].value;
            var openingDate = document.forms["jobForm"]["openingDate"].value;
            var currentDate = new Date().toISOString().split('T')[0];

            if (title == "" || type == "" || department == "" || country == "" || description == "" || openingDate == "") {
                alert("All fields marked with * are required.");
                return false;
            }
            if (openingDate > currentDate) {
                alert("Opening date cannot be in the future.");
                return false;
            }
            return true;
        }

        window.onload = function() {
            document.getElementById('openingDate').value = new Date().toISOString().split('T')[0];
        }
    </script>
</head>
<body>
    <h1>Enter Job Data</h1>
    <form name="jobForm" action="submit_job.jsp" onsubmit="return validateForm()" method="post">
        <label for="title">Title: *</label><br>
        <input type="text" id="title" name="title"><br><br>
        
        <label for="type">Type: *</label><br>
        <select id="type" name="type">
            <option value="">Select</option>
            <option value="Full-time">Full-time</option>
            <option value="Part-time">Part-time</option>
            <option value="Contract">Contract</option>
        </select><br><br>
        
        <label for="department">Department: *</label><br>
        <select id="department" name="department">
            <option value="">Select</option>
            <option value="Engineering">Engineering</option>
            <option value="Marketing">Marketing</option>
            <option value="Sales">Sales</option>
            <option value="HR">HR</option>
        </select><br><br>
        
        <label for="country">Country: *</label><br>
        <select id="country" name="country">
            <option value="">Select</option>
            <option value="USA">USA</option>
            <option value="Canada">Canada</option>
            <option value="UK">UK</option>
            <option value="India">India</option>
        </select><br><br>
        
        <label for="description">Description: *</label><br>
        <textarea id="description" name="description" rows="4" cols="50"></textarea><br><br>
        
        <label for="openingDate">Opening Date: *</label><br>
        <input type="date" id="openingDate" name="openingDate"><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>