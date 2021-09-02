//DAO Means Data Access Object
package com.web.project.dao;

import com.web.project.entities.Category;
import com.web.project.entities.Post;
import com.web.project.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Postdao {

    Connection con;

    public Postdao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String query = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);

            while (set.next()) {
                int cid = set.getInt("cId");
                String cName = set.getString("cName");
                String cDiscription = set.getString("cDiscription");
                Category c = new Category(cid, cName, cDiscription);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;

        try {
            String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId)values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
//    get all the post

    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList();
         
        try {
            PreparedStatement p = con.prepareStatement("select * from posts order by pDate desc");
            ResultSet set = p.executeQuery();
            while(set.next()){
                int pId=set.getInt("pId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp pDate=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                Post post=new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(post);
                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Postdao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
//   get all post by id

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList();
         PreparedStatement p;
        try {
            p = con.prepareStatement("select * from posts where catId=? order by pDate desc");
            p.setInt(1,catId);
            ResultSet set = p.executeQuery();
            while(set.next()){
                int pId=set.getInt("pId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp pDate=set.getTimestamp("pDate");
              
                int userId=set.getInt("userId");
                Post post=new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(post);
                
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(Postdao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;

    }
    
    
    public Post getPostByPostId(int postId) {
        String query="select * from posts where pId=?";
        Post post=null;
        try {
              PreparedStatement p=this.con.prepareStatement(query);
              p.setInt(1, postId);
              
              ResultSet set=p.executeQuery();
              if(set.next()){
                post=new Post();
                int pId=set.getInt("pId");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp pDate=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                post=new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                
                  
              }
              
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
    

}
