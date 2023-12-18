<%@ page language="java" import="java.sql.*" %>

      <% 

         // Declaring the connection, preparedStatement and ResultSet variables
         Connection con;
         PreparedStatement ps;
         ResultSet rs;
         
         // Getting the paremeters from the request
         String yname = request.getParameter("yname");
         String fname = request.getParameter("fname");
         String rno = request.getParameter("rno");  
         String rate = request.getParameter("rate");

         // Loading the MySQL driver
         Class.forName("com.mysql.jdbc.Driver");
         
         // Establishing a connecion to the database
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root",""); 

         // Preparing the SQL statment for insertion
         ps = con.prepareStatement("insert into customers(yname, fname, rno, rate) values(?, ?, ?, ?)");
         
         // Setting the paremeters in the prepared statement
         ps.setString(1, yname);
         ps.setString(2, fname);
         ps.setString(3, rno);
         ps.setString(4, rate);
      
         // Executing the prepared statement
         ps.execute();

         // Printing the success message
         out.println("Room Booked Successfully");
      %>
   </body>
</html>
