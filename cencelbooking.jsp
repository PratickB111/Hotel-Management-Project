
<%@page language="java" import="java.sql.*"%>

<html>
    
    <body bgcolor="red">
        
        <%
            // Getting the customer ID from the request
            String id=request.getParameter("id");
        
            // Declaring the connection, PreparedStatement and ResultSet variables
            Connection con;
            PreparedStatement ps;
            ResultSet rs;

            // Loading the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");  

            // Establishing a connection to the database
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");  

            // Preparing the SQL statement for selection
            ps = con.prepareStatement("SELECT * FROM CUSTOMERS where id=?");
            ps.setString(1,id);

            // Executing the prepared statement
            rs = ps.executeQuery();

            // checking if the customer exists
            if(rs.next()) {

                // if the customer exists, preparing the SQL statement for deletion
                ps=con.prepareStatement("DELETE FROM customers where id=?");   
                ps.setString(1,id);

                // executing the prepared statement
                ps.execute();

                // printing the success message
                out.println("Booking Cancelled.");
            } else {

                // if the customer does not exist, printing an error message
                out.println("CUSTOMERID is INVALID");
            }
        %>       
    </body>
</html>
