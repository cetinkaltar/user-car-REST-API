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
    <script type="text/javascript">
        $(document).ready(function () {
            // SUBMIT FORM
            $("#userForm").submit(function (event) {
                event.preventDefault();
                get();
            });

            // DO GET
            function get() {
                var formData = {
                    inputFilter: $("#inputFilter").val(),
                    sort: $("#sort").val()
                }
                var url = "?find=" + formData.inputFilter + "&sort=" + formData.sort;
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
    <h1>User</h1>
    <div class="row col-md-7 table-responsive">
        <form id="userForm">
            <c:if test="${not empty users}">
                <div style="margin-bottom:20px; padding:10px; background-color:#336699; color:white;">
                    <p>Type some text to search the table for <strong>Name</strong>:</p>
                    <input class="form-control" id="inputFilter" type="text" placeholder="Search.."/>
                </div>
            </c:if>
            <table id="customerTable" class="table">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name
                        <select id="sort">
                            <option id="asc" value="make:asc">asc</option>
                            <option id="desc" value="make:desc">desc</option>
                        </select>
                    </th>
                    <th>Cars</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty users}">
                    <c:forEach items="${users}" var="user" varStatus="status">
                        <tr>
                            <td th:text="id">${user.id}</td>
                            <td th:text="name">${user.name}</td>
                            <td th:text="cars">
                                <c:forEach items="${user.cars}" var="car" varStatus="carstatus">
                                    <p>${car.make}-${car.model}-${car.numberplate}</p>
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${not empty user}">
                    <tr>
                        <td th:text="id">${user.id}</td>
                        <td th:text="name">${user.name}</td>
                        <td th:text="cars">
                            <c:forEach items="${user.cars}" var="car" varStatus="carstatus">
                                <p>${car.make}-${car.model}-${car.numberplate}</p>
                            </c:forEach>
                        </td>
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