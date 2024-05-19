<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Apply for Job</title>
    <script type="text/javascript">
        function validateForm() {
            var firstName = document.forms["applyJobForm"]["first_name"].value;
            var lastName = document.forms["applyJobForm"]["last_name"].value;
            var email = document.forms["applyJobForm"]["email"].value;
            var address = document.forms["applyJobForm"]["address"].value;
            var city = document.forms["applyJobForm"]["city"].value;
            var state = document.forms["applyJobForm"]["state"].value;
            var zip = document.forms["applyJobForm"]["zip"].value;
            var country = document.forms["applyJobForm"]["country"].value;
            var eduLevel = document.forms["applyJobForm"]["edu_level"].value;
            var eduType = document.forms["applyJobForm"]["edu_type"].value;
            var resume = document.forms["applyJobForm"]["resume"].value;
            var employed = document.forms["applyJobForm"]["employed"].checked;
            var employer = document.forms["applyJobForm"]["current_employer"].value;
            var yearsOfExp = document.forms["applyJobForm"]["years_of_exp"].value;
            
            // Validate required fields
            if (firstName == "" || lastName == "" || email == "" || address == "" || city == "" || state == "" || zip == "" || country == "" || eduLevel == "" || eduType == "" || resume == "") {
                alert("All fields marked with * are required.");
                return false;
            }

            // Validate zip code as integer
            if (isNaN(zip)) {
                alert("Zip code must be an integer.");
                return false;
            }

            // Validate numeric values
            if (employed && (employer == "" || isNaN(yearsOfExp) || yearsOfExp < 0)) {
                alert("Please provide valid information for current employer and years of experience.");
                return false;
            }

            return true;
        }

        function toggleEmployerFields() {
            var employed = document.getElementById('employed').checked;
            document.getElementById('employerFields').style.display = employed ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <h1>Apply for Job</h1>
    <form name="applyJobForm" action="submit_application.jsp" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
        <label for="first_name">First Name: *</label><br>
        <input type="text" id="first_name" name="first_name"><br><br>
        
        <label for="last_name">Last Name: *</label><br>
        <input type="text" id="last_name" name="last_name"><br><br>
        
        <label for="email">Email: *</label><br>
        <input type="email" id="email" name="email"><br><br>
        
        <label for="address">Address: *</label><br>
        <input type="text" id="address" name="address"><br><br>
        
        <label for="city">City: *</label><br>
        <input type="text" id="city" name="city"><br><br>
        
        <label for="state">State: *</label><br>
        <input type="text" id="state" name="state"><br><br>
        
        <label for="zip">Zip: *</label><br>
        <input type="text" id="zip" name="zip"><br><br>
        
        <label for="country">Country: *</label><br>
        <select id="country" name="country">
            <option value="">Select</option>
            <option value="USA">USA</option>
            <option value="Canada">Canada</option>
            <option value="UK">UK</option>
            <option value="India">India</option>
        </select><br><br>
        
        <label for="edu_level">Education Level: *</label><br>
        <select id="edu_level" name="edu_level">
            <option value="">Select</option>
            <option value="High School">High School</option>
            <option value="Bachelor's">Bachelor's</option>
            <option value="Master's">Master's</option>
            <option value="PhD">PhD</option>
        </select><br><br>
        
        <label for="edu_type">Education Type: *</label><br>
        <select id="edu_type" name="edu_type">
            <option value="">Select</option>
            <option value="Full-time">Full-time</option>
            <option value="Part-time">Part-time</option>
            <option value="Online">Online</option>
        </select><br><br>
        
        <label for="resume">Resume: *</label><br>
        <input type="file" id="resume" name="resume"><br><br>
        
        <label for="cover_letter">Cover Letter (Optional):</label><br>
        <textarea id="cover_letter" name="cover_letter" rows="4" cols="50"></textarea><br><br>
        
        <label for="employed">Are you employed?</label><br>
        <input type="checkbox" id="employed" name="employed" onclick="toggleEmployerFields()"><br><br>
        
        <div id="employerFields" style="display:none;">
            <label for="current_employer">Current Employer: *</label><br>
            <input type="text" id="current_employer" name="current_employer"><br><br>
            
            <label for="years_of_exp">Years of Experience: *</label><br>
            <input type="text" id="years_of_exp" name="years_of_exp"><br><br>
        </div>
        
        <label for="jobs">Jobs you want to apply:</label><br>
        <select id="jobs" name="jobs" multiple>
            <option value="job1">Job 1</option>
            <option value="job2">Job 2</option>
            <option value="job3">Job 3</option>
            <!-- Add dynamic job options here -->
        </select><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>