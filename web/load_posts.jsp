<%@page import="com.web.project.entities.User"%>
<%@page import="com.web.project.dao.LikeDao"%>
<%@page import="com.web.project.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.web.project.helper.THE_CONNECTION"%>
<%@page import="com.web.project.dao.Postdao"%>

<div class="row">
    <%
        User uuu=(User)session.getAttribute("currentUser");
        Thread.sleep(1000);
        Postdao d = new Postdao(THE_CONNECTION.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();

        } else {
            posts = d.getPostByCatId(cid);

        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center;'> No Post in this category...</h3>");
            return;
        }

        for (Post p : posts) {
    %> 

    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_Pics/<%= p.getpPic()%>" alt="Card image cap"  height="200" width="300" style="border: 2px solid red">
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>

            </div>
            <div class="card-footer bg-primary text-center">
                
                <%
                    LikeDao ld=new LikeDao(THE_CONNECTION.getConnection());
                
                %>
                <a href="#!" onclick="doLike(<%=p.getpId() %>,<%= uuu.getId() %>)"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getpId()) %></span></a>
                <a href="show_blog_page.jsp?post_id=<%=p.getpId() %>" class="btn btn-outline-light btn-sm">Read More...</a>

                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting"></i><span>20</span></a>




            </div>

        </div>


    </div>



    <%
        }
    %>

</div>