<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- form tag -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!-- Number format import-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="contatiner">
		<nav class="navbar navbar-light bg-light p-3">
			<h1 class="">Pizza Pete's</h1>
			<div class="btn-group btn-group-lg" role="group"
				aria-label="Basic button group">
				<a href="/home" class="btn btn-outline-primary">Home</a> <a
					href="/order" class="btn btn-primary">Order (<c:out value="${totalOrders}"></c:out>)</a> 
				<a href="/account/${user.id}" class="btn btn-outline-primary">Account</a>
				<a href="/logout" class="btn btn-outline-primary">Logout</a>
			</div>
		</nav>

		<div class="content">
			<h1>Order:</h1>

			<c:forEach var="PizzaOrder" items="${currentOrders}">
				<div class="card">
					<div class="card-body">
						<span class="d-md-table p-2 bd-highlight">Delivery Method: <c:out value="${PizzaOrder.deliveryMethod}"></c:out></span> 
						<span class="d-md-table p-2 bd-highlight">Size: <c:out value="${PizzaOrder.size}"></c:out></span> 
						<span class="d-md-table p-2 bd-highlight">Crust: <c:out value="${PizzaOrder.crust}"></c:out></span> 
						<span class="d-md-table p-2 bd-highlight">QTY: <c:out value="${PizzaOrder.quantity}"></c:out></span> 
						<h4>Toppings:</h4>
						
						<c:if test="${PizzaOrder.hasPepperoni}">
							<span>Pepperoni</span>
						</c:if>

						<c:if test="${PizzaOrder.hasSausage}">
							<span>Sausage</span>
						</c:if>

						<c:if test="${PizzaOrder.hasMushrooms}">
							<span>Mushrooms</span>
						</c:if>

						<c:if test="${PizzaOrder.hasExtraCheese}">
							<span>Extra Cheese</span>
						</c:if>

						<c:if test="${PizzaOrder.hasOnions}">
							<span>Onions</span>
						</c:if>

						<c:if test="${PizzaOrder.hasAnchovies}">
							<span>Anchovies</span>
						</c:if>

						<c:if test="${PizzaOrder.hasEggplant}">
							<span>Eggplant</span>
						</c:if>

						<c:if test="${PizzaOrder.hasArtichokes}">
							<span>Artichokes</span>
						</c:if>

						<c:if test="${PizzaOrder.hasBroccoli}">
							<span>Broccoli</span>
						</c:if>

						<c:if test="${PizzaOrder.hasPineApple}">
							<span>Pineapple</span>
						</c:if>

						<div>
						<a href="/deleteorder/${PizzaOrder.getId()}" class="btn btn-danger">Remove From Order</a>
						</div>
					</div>
				</div>
			</c:forEach>
			
			<h4>Total Price: $<c:out value="${totalPrice}"></c:out></h4>
			
			<form:form action="/checkout" method="POST" modelAttribute="checkoutOrder">
				<input type="submit" class="btn btn-success col-sm-3" value="Checkout" />
			</form:form>
		</div>
	</div>
</body>
</html>