<%@ page language="java" import="java.sql.*" %>

   <% 

      // declaring the connection, prepared statement and result set variable
      Connection con;
      PreparedStatement ps;
      ResultSet rs;
    
      // getting the parameters from the request
      String name = request.getParameter("name");
      String gender = request.getParameter("gender");
      String address = request.getParameter("address");
      String city = request.getParameter("city");
      String mno = request.getParameter("mno");
      String emailid = request.getParameter("emailid");
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      
      // loading the MySQL driver
      Class.forName("com.mysql.jdbc.Driver");
      
      // establishing a connection to the database      
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");  
      
      // preparing the SQL statement for selection
      ps = con.prepareStatement("SELECT * FROM users WHERE username = ?");

      // setting the username in the prepared statement
      ps.setString(1, username);

      // executing the prepared statement
      rs = ps.executeQuery();

      // checking if the user exists
      if(rs.next()) {

         // if the user exists, printing an error message and a link to the new user page
         out.println("Already Registered User <br> <br>")  ;
         out.println("<a href = newuser.html> New User </a>");
      } else {

         // if the user does not exist, preparing the SQL statement for insertion
         ps=con.prepareStatement("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
         
         // setting the parameters in the prepared statement
         ps.setString(1, name);
         ps.setString(2, gender);
         ps.setString(3, address);
         ps.setString(4, city);
         ps.setString(5, mno);
         ps.setString(6, emailid);
         ps.setString(7, username);
         ps.setString(8, password);

         // executing the prepared statement
         ps.execute();

         // printing the success message
         out.println("<b>User Registered Successfully<br>");         
      }

   %>
   <br>
   
</body>
</html>
