//TSALESIS EVANGELOS
//AM: 1779

package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.CallableStatement;

import java.util.Scanner;

public class MySQL {

    public static void main(String[] args) {
      a();
      b();
      c();
      d();
    }
    
    //ΕΡΩΤΗΜΑ (α)
    public static void a(){
        boolean errorflag = false;
        int uid = -1;
        String name = "";
        
        Connection con  = null;
        Statement st = null;
        try {
			con = getConnection();
			st = con.createStatement();
        }
         catch (SQLException e){
            System.err.println("SQLException: "+ e.getMessage());
            return;
        }
        
        do {
            errorflag = false;
            System.out.println("Give uid and name of the new user:");
            Scanner in = new Scanner(System.in);
            try {
                uid = in.nextInt();
                name = in.nextLine().trim();
            }
            catch(Exception e){
                errorflag = true;
            }   
        } while (errorflag == true || uid == -1 || name.equals(""));
       
        try {
            String query = "insert into user values(" + uid + "," + "\"" + name + "\");";
            st.executeUpdate(query);
        }
        catch (SQLException e){
           System.err.println("SQLException: "+ e.getMessage());
           return;
        }
        System.out.println("("+uid+","+name+") inserted");
    }
    
    //ΕΡΩΤΗΜΑ (β)
    public static void b(){
        Connection con = null;
        Statement st = null;
        Statement st1 = null;
        ResultSet rs = null;
        
        try {
        con = getConnection();
        st = con.createStatement();
        }
         catch (SQLException e){
            System.err.println("SQLException: "+ e.getMessage());
            return;
        }
        
        try {
            String query = "select review.bid, review.stars, review.date from review,business where review.bid = business.bid and business.city = \"Ioannina\";";
            rs = st.executeQuery(query);
            while (rs.next()){
                try {
                    st1 = con.createStatement();
                }
                catch (SQLException e){
                    System.err.println("SQLException: "+ e.getMessage());
                    return;
                }
                try {
                    String query1 = "insert into review values(" + rs.getInt(1) + "," + 2000 + "," + rs.getInt(2) + "," + "\'"+ rs.getDate(3) + "\'" + ");";
                    st1.executeUpdate(query1);
                }
                catch (SQLException e){
                } 
            }
        }
        catch (SQLException e){
           System.err.println("SQLException: "+ e.getMessage());
           return;
        }
        
        System.out.println("Update successful!");      
    }
    
    //ΕΡΩΤΗΜΑ (γ)
    public static void c(){
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        try {
        con = getConnection();
        st = con.createStatement();
        }
         catch (SQLException e){
            System.err.println("SQLException: "+ e.getMessage());
            return;
        }
        
        try {
            String query = "select business.bid, business.name, count(*) from business, review where business.bid = review.bid and business.category = \"Restaurant\" and review.stars = 5 group by business.bid order by count(*) desc;";
            rs = st.executeQuery(query);
            while (rs.next()){
                System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3));                
            }
        }
        catch (SQLException e){
           System.err.println("SQLException: "+ e.getMessage());
           return;
        }  
    }
    
    
    //ΕΡΩΤΗΜΑ (δ)
    public static void d(){
        boolean errorflag = false;
        String name = "";
        
        Connection con = null;
        CallableStatement stmt = null;
        
        do {
            errorflag = false;
            System.out.println("Give business name:");
            Scanner in = new Scanner(System.in);
 
            try {
                name = in.nextLine().trim();
            }
            catch(Exception e){
                errorflag = true;
            }   
        } while (errorflag == true || name == "");
        
        try {
            con = getConnection();
            String sql ="{call reviews_stats(?, ?, ?)}";
            stmt = con.prepareCall(sql);
            
            stmt.setString(1,name);
            stmt.registerOutParameter(2, java.sql.Types.INTEGER);
            stmt.registerOutParameter(3, java.sql.Types.FLOAT);
        
            stmt.execute();
            
            System.out.println("Number of reviews: " + stmt.getInt(2));
            System.out.println("Average stars: " + stmt.getFloat(3));            
        }
        catch (SQLException e){
            System.err.println("SQLException: "+ e.getMessage());
            return;
        }  
    }
    
    
    //ΣΥΝΔΕΣΗ ΜΕ ΒΑΣΗ ΔΕΔΟΜΕΝΩΝ
    public static Connection getConnection(){
        Connection con = null;
       
        String url="jdbc:mysql://localhost:3306/set2";
        String user = "root";
        String password = "***********";
       
        try {
           con = DriverManager.getConnection(url,user,password);
        }
        catch (SQLException e){
            System.err.println("SQLException: "+ e.getMessage());
            System.exit(-1);
        }
        return con;
    }
}
