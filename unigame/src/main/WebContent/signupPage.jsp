<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style/style.css">
    <link rel="stylesheet" href="style/signupPage.css">
	<link rel="icon" href="../images/icon.png">

    <title>Registrati</title>
</head>

    <script>

        function checkNomeCognome(name) {
            var letters = /^[A-Za-z]+$/;
            if (name.value.match(letters)) {
                return true;
            }
        }

        function checkUsername(uname) {
            var letters = /^[A-Za-z0-9]+$/;
            if (uname.value.match(letters)) {
                return true;
            } 
        }

        function checkCodiceFiscale(cf) {
            var characters = /^[A-Za-z]{6}[0-9]{2}[a-ehlmpr-tA-EHLMPR-T]{1}[0-9]{2}([a-zA-Z]{1}[0-9]{3})[a-zA-Z]{1}$/;
            if (cf.value.match(characters)) {
                return true;
            } 
        }

        function checkEmail(email) {

        }

    </script>

    <body>
    	<%@include file="/fragments/headerNuovo.jsp" %>

        <div class="wrapper">
            <div class="form-box">
                <h2>Registrati</h2>

                <form action="SignupServlet" method="POST">
                    <div class="input-box">
                        <input type="text" requried>
                        <label>Nome</label>
                    </div>

                    <div class="input-box">
                        <input type="text" requried>
                        <label>Cognome</label>
                    </div>

                    <div class="input-box">
                        <input type="text" requried>
                        <label>Codice Fiscale</label>
                    </div>

                    <div class="input-box">
                        <input type="date" requried>
                        <label>Data di Nascita</label>
                    </div>

                    <div class="input-box">
                        <input type="tel" requried>
                        <label>Cellulare</label>
                    </div>

                    <div class="input-box">
                        <input type="email" requried>
                        <label>Email</label>
                    </div>

                    <div class="input-box">
                        <input type="text" requried> 
                        <label>Username</label>
                    </div>

                    <div class="input-box">
                        <input type="password" requried>
                        <label>Password</label>
                    </div>

                    <div class="input-box">
                        <input type="password" requried>
                        <label>Conferma Password</label>
                    </div>
                    
                    <button type="submit" class="btnLogin">Registrati</button>
                </form> 
            </div>
        </div>     
        
		<%@include file="/fragments/footer.jsp" %>
    </body>
</html>