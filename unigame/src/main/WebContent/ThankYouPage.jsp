<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
   %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Unigame | Thank you</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body >
    <%@include file="/fragments/headerNuovo.jsp" %>
        <div class="vh-100 d-flex justify-content-center align-items-center" style="background-color: #776CF5;">
            <div>
                <div class="mb-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-success" width="75" height="75"
                        fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                        <path
                            d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                    </svg>
                </div>
                <div class="text-center">
                    <h1>Grazie!</h1>
                    <p>Ti abbiamo inviato un'email contenente il codice di attivazione e/o i dettagli sulla spedizione dei tuoi prodotti. </p>
                    <a href="index.jsp"><b>Home</b></a>
                </div>
            </div>
             </div>
             
            <%@include file="/fragments/footer.jsp" %>
    </body>

</html>