/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JTable;
import java.sql.*;


/**
 *
 * @author WIN7i
 */
public class database {
    
            
    public Connection conn;
    public Statement statement;
    public Connection openConnection()
    {
        if(conn == null)
        {
            String url="jdbc:mysql://localhost/";
            String dbName = "quizup";
            String driver = "com.mysql.jdbc.Driver";
            String userName = "root";
            String password = "";
            
            
            try
            {
                Class.forName(driver);
                this.conn = (Connection)DriverManager.getConnection(url+dbName,userName,password);
                System.out.println("connection successful 1");
                statement= conn.createStatement();
                           System.out.println("connection successful 2");
                             Statement stmt = conn.createStatement();
           // String sql="INSERT INTO user_details (username,password,gmail_id) VALUES('ghirihari','06071967','ghirihari@gmail.com')";
            //stmt.executeUpdate(sql);  
  /*          String sql1 = "SELECT * from qna ";
            ResultSet rs = stmt.executeQuery(sql1);
            int i=0;
            String []name=new String[3];
            int [] car_no=new int[3];
            String []team=new String[3];
            String [] nation=new String[3];
            int [] points=new int[3];
            
            while(rs.next()){
                //Retrieve by column name
                System.out.println(rs.getString("question"));
                
                i++;    
            }
            
            /////////procedure/////////////////////////////   
  //          CallableStatement stm = conn.prepareCall("{CALL checker(?,?)}");
      //      stm.setInt(1,4);
       //     stm.setString(2,"dsa");
         //   stm.execute();
            
            
           CallableStatement fun = conn.prepareCall("{ ? = call get_answer(?)}");
            fun.setInt(2, 3);
            fun.registerOutParameter(1, Types.VARCHAR);
            fun.execute();
            String count = fun.getString(1);
             System.out.println(count);
          
     */
            
            
            
            
            
            }
            catch (ClassNotFoundException | SQLException sqle)
            {
                System.out.println("connection failed");
            }
        }
        return conn;
    }
    
    public void driverwins(String [] columnNames,String [][] data) throws SQLException
    {
        Statement stmt = conn.createStatement();
            String sql1 = "SELECT * from drivers ";
        //{ "Kundan Kumar Jha", "4031", "CSE" },
        // { "Anand Jha", "6014", "IT" } };
        ResultSet rs = stmt.executeQuery(sql1);
        int i=0;
            String []name=new String[3];
            int [] car_no=new int[3];
            String []team=new String[3];
            String [] nation=new String[3];
            int [] points=new int[3];
            
            
            
            while(rs.next()){
                //Retrieve by column name
                name[i]  = rs.getString("name");
                car_no[i] = rs.getInt("car_no");
                team[i] = rs.getString("team");
                nation[i] = rs.getString("nation");
                points [i]= rs.getInt("wins");
                
                data[i][0]=name[i];
                data[i][1]=Integer.toString(car_no[i]);
                data[i][2]=team[i];
                data[i][3]=nation[i];
                data[i][4]=Integer.toString(points[i]);
                
                i++;    
            }
        }
    
    void schedule() throws SQLException
     {
        CallableStatement statement1 = conn.prepareCall("{call insertschedule(?, ?, ?)}");
         {
              

            statement1.setString(1, "Monte Carlo");
            statement1.setString(2, "France");
            statement1.setString(3, "2000-05-15");
            
 
            statement1.execute();
            statement1.close();
 
            System.out.println("Stored procedure called successfully!");
            
        } 
     }
    
    void constructor(String [] columnNames,String [][] data) throws SQLException
    {
        Statement stmt = conn.createStatement();
           String sql = "SELECT * from constructor order by points";
            
           
        //{ "Kundan Kumar Jha", "4031", "CSE" },
        // { "Anand Jha", "6014", "IT" } };
        try (ResultSet rs = stmt.executeQuery(sql)) {
            //{ "Kundan Kumar Jha", "4031", "CSE" },
            // { "Anand Jha", "6014", "IT" } };
            int i=0;
            String []name=new String[3];
            String [] country=new String[3];
            ;
            int [] points=new int[3];
            while (rs.next()) {
                //Retrieve by column name
                name[i]  = rs.getString("name");
                country[i] = rs.getString("country");
                points [i]= rs.getInt("points");
                
                data[i][0]=name[i];
                data[i][2]=country[i];
                data[i][3]=Integer.toString(points[i]);
                
                i++;    
            }
            // adding it to JScrollPane
        }
         
         }
    
    }

