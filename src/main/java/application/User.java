//package application;
//
//import java.sql.*;
//
//import javax.faces.bean.ManagedBean;
//import javax.faces.bean.RequestScoped;
//import javax.faces.context.FacesContext;
//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.naming.NamingException;
//import javax.sql.DataSource;
//
//@ManagedBean(name = "user")
//@RequestScoped
//public class User {
//
//    private String firstName = null;
//    private String lastName = null;
//    private String email;
//    private String password;
//    private String dbPassword;
//    private String dbName;
//    private String sex;
//
//    public User() {
//        try {
//            Context ctx = new InitialContext();
//        } catch (NamingException e) {
//            e.printStackTrace();
//        }
//    }
//    public String getWelcomeMessage(){
//        if(firstName != null)
//        return "Hello " + firstName;
//        return "";
//    }
//    public String getLastNameMessage(){
//        if(lastName != null)
//        return "And your last name is " + lastName;
//        return "";
//    }
//    public String getDbPassword() {
//        return dbPassword;
//    }
//
//    public String getDbName() {
//        return dbName;
//    }
//
//    public String getFirstName() {
//        return firstName;
//    }
//
//    public void setFirstName(String name) {
//        this.firstName = name;
//    }
//
//    public String getLastName() {
//        return lastName;
//    }
//
//    public void setLastName(String lastName) {
//        this.lastName = lastName;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public String add() {
//        InitConnection initConnection = new InitConnection().invoke();
//        Connection con = initConnection.getCon();
//        String password = initConnection.getPassword();
//
//        int i = 0;
//        if (firstName != null) {
//            PreparedStatement ps = null;
//            try {
//                if (con != null) {
//                    String sql = "INSERT INTO user(firstname, password, lastname, email) VALUES(?,?,?,?)";
//                    ps = con.prepareStatement(sql);
//                    ps.setString(1, firstName);
//                    ps.setString(2, this.password);
//                    ps.setString(3, lastName);
//                    ps.setString(4, email);
//                    i = ps.executeUpdate();
//                    System.out.println("Data Added Successfully");
//                }
//
//            } catch (Exception e) {
//                System.out.println("zepsuło sie "+e);
//            } finally {
//                try {
//                    con.close();
//                    ps.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        if (i > 0) {
//            return "success";
//        } else
//            return "unsuccess";
//    }
//
//    public void dbData(String uName) {
//        InitConnection initConnection = new InitConnection().invoke();
//        Connection con = initConnection.getCon();
//        String password = initConnection.getPassword();
//        if (uName != null) {
//            PreparedStatement ps = null;
//            ResultSet rs = null;
//
//
//            try {
//                if (con != null) {
//                    String sql = "select firstname,password from user where firstname = '"
//                            + uName + "'";
//                    ps = con.prepareStatement(sql);
//                    rs = ps.executeQuery();
//                    rs.next();
//                    dbName = rs.getString("firstname");
//                    dbPassword = rs.getString("password");
//                }
//            } catch (SQLException sqle) {
//                sqle.printStackTrace();
//            }
//        }
//    }
//
//
//    public String login() {
//        dbData(firstName);
//        if (firstName.equals(dbName) && password.equals(dbPassword)) {
//            return "output";
//        } else
//            return "invalid";
//    }
//
//    public void logout() {
//        FacesContext.getCurrentInstance().getExternalContext()
//                .invalidateSession();
//        FacesContext.getCurrentInstance()
//                .getApplication().getNavigationHandler()
//                .handleNavigation(FacesContext.getCurrentInstance(), null, "/login.xhtml");
//    }
//
//    public String getSex() {
//        return sex;
//    }
//
//    public void setSex(String sex) {
//        this.sex = sex;
//    }
//
//    private class InitConnection {
//        private Connection con;
//        private String password;
//
//        public Connection getCon() {
//            return con;
//        }
//
//        public String getPassword() {
//            return password;
//        }
//
//        public InitConnection invoke() {
//            con = null;
//
//            String url = "jdbc:mysql://localhost:3306/appdb";
//
//            String username = "root";
//            password = "";
//
//            try {
//
//                try {
//                    Class.forName("com.mysql.jdbc.Driver");
//                } catch (ClassNotFoundException e) {
//                    e.printStackTrace();
//                }
//
//                con = DriverManager.getConnection(url, username, password);
//                // System.out.println("Connection established"+connect);
//
//            } catch (SQLException ex) {
//                System.out.println("in exec");
//                System.out.println(ex.getMessage());
//            }
//            return this;
//        }
//    }
//}
