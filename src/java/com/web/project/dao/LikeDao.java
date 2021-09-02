
package com.web.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    public boolean insertLike(int pid,int uid){
        boolean f=false;
        String q="insert into liked(pId,uId) values(?,?) ";
        try {
            PreparedStatement p=this.con.prepareStatement(q);
            
//            set value
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
        } catch (SQLException ex) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
        
    }
    public int countLikeOnPost(int pid){
        int count=0;
        String q="select count(*) from liked where pid=?";
        try {
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet set= p.executeQuery();
            if(set.next()){
//                  that means first column
//                count=set.getInt(1);  
                  count=set.getInt("count(*)");
//                  first column name is count(*) both type are used
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return count;
    }
    
    public boolean isLikedByUser(int pid,int uid){
        
        boolean f=false;
        try {
            PreparedStatement p=this.con.prepareStatement("select * from liked where pId=? and uId=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set=p.executeQuery();
            if(set.next()){
                f=true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return f;
    }
    
    public boolean deleteLike(int pid,int uid){
        boolean f=false;
        
        try {
            PreparedStatement p=this.con.prepareStatement("delete from liked where pId=? and uId=? ");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
            
        } catch (SQLException ex) {
            Logger.getLogger(LikeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return f;
        
    }
    
    
}
