

<%@page import="com.web.project.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--css..........-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 99%, 67% 95%, 28% 100%, 0 90%, 0 0);
            }
        </style>
    </head>
    <body>
        <!--navbar.....-->
        <%@include file="normal_navbar.jsp" %>
        <main class="d-flex align-items-center primary-background banner-background " style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">

                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login here</p>

                            </div>
                            <%
                                Message msg = (Message) session.getAttribute("message");
                                if (msg != null) {
                            %>
                            <div class="alert <%=msg.getCssClass()%>" role="alert">
                               <%=msg.getContent()%>
                            </div>


                            <%
                                session.removeAttribute("message");
                                }


                            %>
                            <div class="card-body">
                                <form action="LoginServlet" method="POST">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary ">Submit</button>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </main>







        <!--javascript.....-->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/MyJs.js" type="text/javascript"></script>

    </body>
</html>
