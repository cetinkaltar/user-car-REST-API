<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>User Car System</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // SUBMIT FORM
            $("#carForm").submit(function (event) {
                event.preventDefault();
                get();
            });
            // DO GET
            function get() {
                var formData = {
                    inputFilter: $("#inputFilter").val(),
                    sort: $("#sort").val()
                }
                var url = "?make=" + formData.inputFilter + "&sort=" + formData.sort;
                window.location.replace(url);
                // Reset FormData after Posting
                resetData();
            }
            function resetData() {
                $("#inputFilter").val("");
                $("#sort").val("");
            }
        })
    </script>
</head>

<body>
<div class="container">
    <h1>Cars</h1>
    <div class="row col-md-7 table-responsive">
        <form id="carForm" name="carForm">
            <c:if test="${not empty cars}">
                <div style="margin-bottom:20px; padding:10px; background-color:#336699; color:white;">
                    <p>Type some text to search the table for <strong>Make</strong>:</p>
                    <input class="form-control" id="inputFilter" type="text" placeholder="Search.."/>
                </div>
            </c:if>
            <table id="customerTable" class="table">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Make <select id="sort">
                        <option id="asc" value="make:asc">asc</option>
                        <option id="desc" value="make:desc">desc</option>
                    </select>
                    </th>
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
                <c:if test="${not empty car}">
                    <tr>
                        <td th:text="id">${car.id}</td>
                        <td th:text="make">${car.make}</td>
                        <td th:text="model">${car.model}</td>
                        <td th:text="numberplate">${car.numberplate}</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <button type="submit" class="btn btn-default" style="margin-left:20px; margin-right:5px">Search</button>
        </form>
    </div>
</div>
</body>
</html>