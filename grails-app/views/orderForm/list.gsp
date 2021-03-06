
<%@ page import="com.productHub.domain.OrderForm" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orderForm.label', default: 'OrderForm')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'orderForm.id.label', default: 'Id')}" />
                        
                            <th><g:message code="orderForm.cart.label" default="Cart" /></th>
                        
                            <g:sortableColumn property="payment" title="${message(code: 'orderForm.payment.label', default: 'Payment')}" />
                        
                            <g:sortableColumn property="paymentNotes" title="${message(code: 'orderForm.paymentNotes.label', default: 'Payment Notes')}" />
                        
                            <g:sortableColumn property="paymentProof" title="${message(code: 'orderForm.paymentProof.label', default: 'Payment Proof')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'orderForm.status.label', default: 'Status')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${orderFormInstanceList}" status="i" var="orderFormInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${orderFormInstance.id}">${fieldValue(bean: orderFormInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: orderFormInstance, field: "cart")}</td>
                        
                            <td>${fieldValue(bean: orderFormInstance, field: "payment")}</td>
                        
                            <td>${fieldValue(bean: orderFormInstance, field: "paymentNotes")}</td>
                        
                            <td>${fieldValue(bean: orderFormInstance, field: "paymentProof")}</td>
                        
                            <td>${fieldValue(bean: orderFormInstance, field: "status")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${orderFormInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
