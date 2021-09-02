<%@page import="java.util.ArrayList"%>
<%@page import="com.web.project.entities.Category"%>
<%@page import="com.web.project.dao.Postdao"%>
<%@page import="com.web.project.helper.THE_CONNECTION"%>
<%@page import="com.web.project.entities.Message"%>
<%@page import="com.web.project.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
         <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
        <title>Profile Page</title>
        <!--css-->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 99%, 68% 90%, 34% 100%, 0 90%, 0 0);
            }
             body{
                background: url(img/image.jpg);
                
                /*cover hole background*/
                background-size: cover;
                
                /*background is fixed*/
                background-attachment: fixed;     
            }
        </style>
        <!--end of css-->
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
                        <a class="nav-link" href="#"><span class="fa fa-handshake-o"></span>LearnCode with Guruji <span class="sr-only">(current)</span></a>
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

        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4 " >
                    <!--first col-->
                    <div class="col-md-4">
                        <!--Show list of categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <%
                                Postdao dao = new Postdao(THE_CONNECTION.getConnection());
                                ArrayList<Category> list1 = dao.getAllCategories();
                                for (Category cc : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getcId() %>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getcName()%></a>
                            <%
                                }


                            %>


                        </div>

                    </div>
                    <!--Second col-->
                    <div class="col-md-8" >
                        <!--Show post-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-3" >Loading...</h3>

                        </div>
                        <div class="container" id="post-container">

                        </div>
                    </div>

                </div>
            </div>
        </main>

        <!--End main body of the page-->
        <!--profile model-->
        <!--search bootstrap 4 modal-->

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


        <!--loading post using ajax--> 
        <script>
            
            function getPosts(catId,temp){
                $("#loader").show()
                $("#post-container").hide()
                $(".c-link").removeClass('active');
                
                
                
                  $.ajax({
                    url: "load_posts.jsp",
                    data:{cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $("#post-container").show()
                        $('#post-container').html(data);
                        $(temp).addClass('active')
                    }

                })
            }
            
            
            $(function (e) {
                let allpostRef=$(".c-link")[0]
                getPosts(0,allpostRef)
              

            })

        </script>

    </body>
</html>
