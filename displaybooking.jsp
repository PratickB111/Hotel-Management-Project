<%@page language="java" import="java.sql.*"%>

<html>
  <body>

    <%
      
      // declaring the connection, preparedStatement and resultSet variables 
      Connection con;
      PreparedStatement ps;
      ResultSet rs;
    
      // getting the customer ID from the request
      String id = request.getParameter("id");

      // loading the MySQL driver
      Class.forName("com.mysql.jdbc.Driver");
      
      // establishing a connection to the database
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");  

      // preparing the SQL statement for selection
      ps = con.prepareStatement("SELECT * FROM customers WHERE id = ?");
   
      // setting the customer ID in the prepared statement
      ps.setString(1, id);
   
      // executing the prepared statement
      rs = ps.executeQuery();

      // checking if the customer exists
      if(rs.next()) {

        // if the customer exists, printing the customer details
        out.println("Id: " + rs.getString("id"));   
        out.println("Name: " + rs.getString("yname"));  
        out.println("Fathers Name: " + rs.getString("fname"));   
        out.println("No of Rooms: " + rs.getString("rno")); 
        out.println("Room charge: " + rs.getString("rate"));

        // calculating the payable amount
        String rno = rs.getString("rno");
        String rate = rs.getString("rate");
        int room = Integer.parseInt(rno);
        int rent = Integer.parseInt(rate);

        // printing the payable amount
        out.println("Payable Amount: " + (room * rent));
      } else {
        
        // if the customer does not exist, printing an error message
        out.println("Customer id is invalid");
      }

    %>  

  </body>
</html>
