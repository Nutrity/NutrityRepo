<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="vendor/datepicker/fonts/icomoon/style.css">
    <link rel="stylesheet" href="vendor/datepicker/css/rome.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="vendor/datepicker/css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="vendor/datepicker/css/style.css">
    <title>Calendar #7 (inline)</title>
  </head>
  <body>

  <div class="content">
    <div class="container text-left">
      <div class="row justify-content-center">
        <div class="col-md-10 text-center">
          <input type="text" class="form-control w-25 mx-auto mb-3" id="result" placeholder="Select date" disabled="">
          <form action="#" class="row">
            <div class="col-md-12">
              <div id="inline_cal"></div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>    
    <script src="vendor/datepicker/js/popper.min.js"></script>
    <script src="vendor/datepicker/js/bootstrap.min.js"></script>
    <script src="vendor/datepicker/js/rome.js"></script>
    <script src="vendor/datepicker/js/main.js"></script>
  </body>
</html>