
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!--css..........-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <!--Font awesome cdn-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 99%, 67% 95%, 28% 100%, 0 90%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background p-5 banner-background" style="padding-bottom: 50px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register here

                        </div>
                        <div class="card-body">
                            <form id="reg_form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio"   id="gender" name=gender value="Male">Male
                                    <input type="radio"   id="gender" name=gender value="Female">Female

                                </div>
                                <div class="form-group">
                                    <textarea name="about" id=""  class="form-control" rows="5" placeholder="Enter some thing about your self"></textarea>
                                </div>

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree term and condition</label>
                                </div>
                                <br>
                                <div class="container text-center" style="display: none;" id="loader" >
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h1>Please wait...</h1>
                                </div>

                                <button  type="submit" class="btn btn-primary" id="submit_btn">Submit</button>
                            </form>

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
         <!--Sweet Alert cdn-->
         <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(function () {
                console.log("Loaded.......");
                $("#reg_form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $("#submit_btn").hide();
                    $("#loader").show();



//                    send register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'post',
                        data: form,
                        success: function (data) {
                            console.log(data);
                            $("#submit_btn").show();
                            $("#loader").hide();
                           if(data.trim()==="done"){
                                swal("We Are Successfully Registered...Redirecting to login page")
                                    .then((value) => {
                                        window.location="login_page.jsp";
                                    });
                                }else{
                                    swal(data);
                                }

                        },
                        error: function (jqXHR) {
                            console.log(jqXHR);
                            $("#submit_btn").show();
                            $("#loader").hide();
                             swal("Something Went Wrong...Try again")
                            
                           


                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>
    </body>
</html>
