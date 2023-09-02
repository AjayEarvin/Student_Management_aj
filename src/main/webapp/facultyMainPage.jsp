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
<title>Faculty Page</title>
</head>
<body>

    <header>
        <div class="container">
            <nav>
                <div class="menu-icons">
                   <i class="fas fa-bars"></i>
                   <i class="fas fa-times"></i>
                </div>
                <a href="index.html" class="logo">STUDENT MANAGEMENT-FACULTY</a>
                <ul class="nav-list">
                    
                      <li>
                        <a href="#">SUBJECT/DEPARMENT OF STUDENTS <i class="fas fa-caret-down"></i></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="facultySubjectMark.jsp">UPDATE SUBJECTS</a>
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