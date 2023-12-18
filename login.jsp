
<%@page language="java" import="java.sql.*"%>

<html>
    <body>

        <% 

            // declaring the connection, preparedStatement and ResultSet variables
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
        
            // getting the username and password from the request
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");

            // loading the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");  

            // Establishing a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");  

            // preparing the SQL statement for selection
            ps = con.prepareStatement("SELECT * FROM users WHERE username = ? and password = ?");
    
            // setting the username and password in the prepared statement
            ps.setString(1, name);
            ps.setString(2, pass);  

            // executing the prepared statement
            rs = ps.executeQuery();

            // checking if the user exists
            if(rs.next()) {

                // if the user exists, redirecting to the welcome page
                response.sendRedirect("welcome.jsp");
            } else {
                
                // if the user does not exist, redirecting to the error page
                response.sendRedirect("error.html");
            }
   
        %>
          
    </body>
</html>
