<%@page import="com.web.project.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.web.project.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.project.entities.Category"%>
<%@page import="com.web.project.entities.Post"%>
<%@page import="com.web.project.helper.THE_CONNECTION"%>
<%@page import="com.web.project.dao.Postdao"%>
<%@page import="com.web.project.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>



<%    int postId = Integer.parseInt(request.getParameter("post_id"));

    Postdao d = new Postdao(THE_CONNECTION.getConnection());
    Post p = d.getPostByPostId(postId);


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 99%, 68% 90%, 34% 100%, 0 90%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px
            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
                text-decoration: underline;
            }
            .post-userinfo{
                 font-style: italic;
                font-size: 18px;
                text-decoration: underline;
              
            }
            .row-user{
                border: 1px solid rgb(140, 115, 115);
                padding-top: 15px;
            }
            body{
                background: url(img/image.jpg);
                
                /*cover hole background*/
                background-size: cover;
                
                /*background is fixed*/
                background-attachment: fixed;     
            }
        </style>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v11.0" nonce="IOEjQqg3"></script>
        <!--end of css-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%>|| Learn with guruji</title>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background " id="navbar">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-certificate"></span>  MyGuruji</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-handshake-o"></span>LearnCode with Guruji <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-gears"></span>Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementaion</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-phone-square"></span>Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-model"><span class="fa fa fa-edit"></span>Do Post</a>

                </ul>
                <ul  class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%=user.getName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                    </li>

                </ul>
            </div>
        </nav>
        <!--end of navbar-->


        <!--main content of body-->

        <div class="container my-4">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white ">
                            <h4 class="text-center post-title "><%= p.getpTitle()%></h4>

                        </div>
                        <div class="card-body">

                            <img class="card-img-top" src="blog_Pics/<%= p.getpPic()%>" alt="Card image cap"  style="border: 2px solid red">
                             
                            <div class="container">
                                <div class="row my-2 row-user">
                               
                                    <div class="col-md-8">
                                        <%
                                              UserDao ud=new UserDao(THE_CONNECTION.getConnection());
                                              
                                        %>
                                        
                                        
                                        <p class="post-userinfo"> <a href="#!"><%= ud.getUserByUserId(p.getUserId()).getName()   %></a> has posted :</p>
                                    </div>
                                     <div class="col-md-4">
                                         <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())  %></p>
                                        
                                    </div>
                                   

                               
                            </div>
                            </div>
                            
                            <p class="post-content"><%= p.getpContent()%></p>
                            <br>
                            <br>
                            <br>
                            <div class="post-code"> 
                                <pre><%= p.getpCode()%></pre>
                            </div>
                        </div>
                        <div class="card-footer primary-background">
                            
                            <%
                                LikeDao ld=new LikeDao(THE_CONNECTION.getConnection());
                                
                            %>
                            
                            <a href="#!" onclick="doLike(<%=p.getpId() %>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getpId()) %></span></a>


                           

                        </div>
                            <div class="card-footer">
                                <div class="fb-comments" data-href="http://localhost:9595/WebProject/show_blog_page.jsp?post_id=<%= p.getpId() %>" data-width="" data-numposts="5"></div>
                               
                            </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end main content of body-->




        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">MyGuruji</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
                            <!--Details-->
                            <div id="profile-details">

                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:</th>
                                            <td><%=user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status:</th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on:</th>
                                            <td><%=user.getDatetime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->
                            <div id="profile-edit" style="display:none">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%=user.getGender().toUpperCase()%></td>
                                        </tr>

                                        <tr>
                                            <td>About :</td>
                                            <td>
                                                <textarea rows="3" class="form-control " name="user_about"><%=user.getAbout()%>
                                                    
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile</td>
                                            <td> <input type="file" name="image" class="form-control"></td>
                                        </tr>


                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">

                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile model-->

        <!--Add post model-->

        <div class="modal fade" id="add-post-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPostServlet" method="POST" id="add-post-form" ">
                            <div class="form-group">
                                <select class="form-control" name="cId">
                                    <option selected disabled="">----Select Category----</option>
                                    <%
                                        Postdao postd = new Postdao(THE_CONNECTION.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {

                                    %>
                                    <option value="<%= c.getcId()%>"> <%= c.getcName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                                <div class="form-group">
                                    <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height: 200px"></textarea>
                                </div>

                                <div class="form-group">
                                    <textarea name="pCode" class="form-control" placeholder="Enter your Program (if any)" style="height: 200px"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Select your pic...</label>
                                    <br>
                                    <input name="pic" type="file"/>
                                </div>


                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-secondary primary-background text-white">Post</button>
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary " data-dismiss="modal">Close</button>

                    </div>


                </div>
            </div>
        </div>

        <!--End add post model-->


        <!--javascript.....-->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/MyJs.js" type="text/javascript"></script>
        <!--SweetAlert CDN-->
        <script src=https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js></script>
        <script>
            $(function () {
                let editStatus = false;
                $("#edit-profile-button").click(function () {
                    if (editStatus === false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit");

                    }

                });

            });
        </script>

        <!--now Add post Js-->
        <script>

            $(function () {


                console.log("Loaded.......");
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);





//                    send register servlet
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'post',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === "done") {
                                swal("Good job!", "Saved Successfully!", "success");

                            } else {
                                swal("Error!", "Something went wrong Please Try again!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong Please Try again!", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });


        </script>
        <!--End post Js-->


    </body>
</html>
