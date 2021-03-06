
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Topik"%>
<%@page import="classes.Funciones"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<!doctype html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--Favicon-->
  <link rel="apple-touch-icon" sizes="57x57" href="images/favicon/apple-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="images/favicon/apple-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="images/favicon/apple-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="images/favicon/apple-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="images/favicon/apple-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="images/favicon/apple-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="images/favicon/apple-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="images/favicon/apple-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-icon-180x180.png">
  <link rel="icon" type="image/png" sizes="192x192"  href="images/favicon/android-icon-192x192.png">
  <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="96x96" href="images/favicon/favicon-96x96.png">
  <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
  <link rel="manifest" href="images/favicon/manifest.json">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
  <meta name="theme-color" content="#ffffff">
  <!--fin favicon-->
  <script src="resources/js/jquery-1.12.3.min.js"></script>
  <% String pageName = this.getClass().getSimpleName().replaceAll("_", "."); %>
  <title>topik</title>
  
  <script>
      $(document).ready(function() {
        $('a[href="<%out.print(pageName);%>"').parent().addClass('active');
      });
      // Will also work for relative and absolute hrefs

   </script>
  <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/estilos.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
  <body>
    
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="http://topikapp-dawcampanillas.rhcloud.com">
        <img src="images/favicon/favicon-32x32.png" style="width: 20px;" alt="Topik">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp">Topiks recientes<span class="sr-only">(current)</span></a></li>
        <li><a href="create.jsp">Crear topik</a></li>
        <li class="dropdown <% 
          if (pageName.equals("topic.jsp")){
          out.print("active");
          }
          %>" >
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Ver topiks <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexionHeader = DriverManager.getConnection("jdbc:mysql://"+Funciones.dbAddress()+":3306/topik","root", "");
            Statement sHeader = conexionHeader.createStatement();
            ResultSet listadoHeader = sHeader.executeQuery ("SELECT * FROM categoria");
            while (listadoHeader.next()) { %>
            
            <li><a href="categoria.jsp?id=<%= listadoHeader.getString("idCategoria") %>">
              <%= listadoHeader.getString("nombre") %>
            </a></li>
            <%  }
              conexionHeader.close();
            %>
          </ul>
        </li>
      </ul>
      <!--<form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Buscar">
        </div>
        <button type="submit" class="btn btn-default">Buscar</button>
      </form>-->
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
