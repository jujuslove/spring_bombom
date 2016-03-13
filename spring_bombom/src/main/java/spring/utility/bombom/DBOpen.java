package spring.utility.bombom;
 
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBOpen {
 
public static Connection getConnection(){
   Connection con = null;
    
   try {
     Class.forName(Constant.driver);
     con = DriverManager.getConnection(Constant.url, Constant.id, Constant.pass);
   } catch (Exception e) {
     e.printStackTrace();
   } 
   
   return con;
   
 }
}