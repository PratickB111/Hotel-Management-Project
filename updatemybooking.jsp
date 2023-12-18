

<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    
    <body>
      
        <%

            // getting the parameters from the request
            String id = request.getParameter("id");
            String yname = request.getParameter("yname");
            String fname = request.getParameter("fname");
            String rno = request.getParameter("rno");
            String rate = request.getParameter("rate");

            // declaring the connection, prepared statement and result set variables
            Connection con;
            PreparedStatement ps;
            ResultSet rs;

            // loading the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");  
            
            // establishing a connection to the database            
            con = DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306","root","");

            // preparing the SQL statement for selection
            ps=con.prepareStatement("SELECT * FROM customers WHERE id = ?");
            
            // setting the customer ID in the prepared statement
            ps.setString(1, id);
            
            // executing the prepared statement            
            rs = ps.executeQuery();

            // checking if the customer exists
            if(rs.next()) {

                // if the customer exists, preparing the SQL statement for update
                ps = con.prepareStatement("UPDATE customers SET yname = ? fname = ? rno = ? WHERE id = ?");

                // setting the parameters in the prepared statement
                ps.setString(1, id);
                ps.setString(2, yname);
                ps.setString(3, fname);
                ps.setString(4, rno);

                // executing the prepared statement
                ps.execute();

                // printing the success message
                out.println("Booking Successfully Updated");
            } else {

                // if the customer does not exist, printing an error message
                out.println("ID is INVALID");
            }
        
        %>

    </body>
</html>
