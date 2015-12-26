<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!-- navbar -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">
					CatálogoNet - Admin
				</a>
			</div>
			<c:url var="home" value="/adminadmin/home"/>
			<p class="navbar-text navbar-right"><a href="${home}" class="navbar-link">Logout <span class="glyphicon glyphicon-chevron-right"></span></a></p>
		</div>
	</nav>
	<!-- ./ navnar -->