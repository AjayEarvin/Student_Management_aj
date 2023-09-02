<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<link rel="stylesheet" href="style.css">
<title>Admin page</title>
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="menu-icons">
                   <i class="fas fa-bars"></i>
                   <i class="fas fa-times"></i>
                </div>
                <a href="index.html" class="logo">STUDENT MANAGEMENT-ADMIN</a>
                <ul class="nav-list">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a href="#">ADMINISTRATION <i class="fas fa-caret-down"></i></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="addNewStudent.jsp">ADD STUDENT</a>
                            </li>
                      
                            <li>
                                <a href="addNewFaculty.jsp">ADD TEACHER</a>
                            </li>
              
                        </ul>
                    </li>
                    <li>
                        <a href="#">DETAILS<i class="fas fa-caret-down"></i></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="StudentDetails.jsp">STUDENT DETAILS</a>
                            </li>
                            <li>
                                <a href="facultyDetails.jsp">TEACHERS DETAILS</a>
                            </li>
                          
                        </ul>
                    </li>
                    <li>
                        <a href="#">MY ACCOUNT 
                            <i class="fas fa-caret-down"></i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="#">MY PROFILE</a>
                            </li>
                            <li>
                                <a href="#">CHANGE PASSWORD </a>
                            </li>
                        </ul>
                    </li>
                    <li class="move-right btn">
                        <a href="index.html">LOGOUT</a>
                    </li>
                </ul>
                
            </nav>
        </div>
    </header>


    <script src="script.js"></script>
</body>
</html>