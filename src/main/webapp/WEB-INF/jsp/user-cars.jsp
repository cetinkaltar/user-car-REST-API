<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Car System</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h1>${username} autos</h1>
    <div class="row col-md-7 table-responsive">
        <table id="customerTable" class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Make</th>
                <th>Model</th>
                <th>Numberplate</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty cars}">
                <c:forEach items="${cars}" var="car" varStatus="status">
                    <tr>
                        <td th:text="id">${car.id}</td>
                        <td th:text="make">${car.make}</td>
                        <td th:text="model">${car.model}</td>
                        <td th:text="numberplate">${car.numberplate}</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
</div>