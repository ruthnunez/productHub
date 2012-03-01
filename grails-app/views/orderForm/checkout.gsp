
<%@ page import="com.productHub.domain.Cart" %>
<%@ page import="com.productHub.domain.PaymentType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cart.label', default: 'Cart')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${orderFormInstance}">
            <div class="errors">
                <g:renderErrors bean="${orderFormInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="payment"><g:message code="orderForm.payment.label" default="Payment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderFormInstance, field: 'payment', 'errors')}">
									<select name="payment" id="payment" class="value ${hasErrors(bean: orderFormInstance, field: 'payment', 'errors')}">
										<g:if test="${orderFormInstance?.cart?.store?.acceptsDirect}">
											<option value="${PaymentType.DIRECT_PAYMENT.name()}">Direct Payment</option>
										</g:if>
										<g:if test="${orderFormInstance?.cart?.store?.acceptsMoneyTransfer}">
											<option value="${PaymentType.MONEY_TRANSFER.name()}">Money Transfer</option>
										</g:if>
									</select>
								</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="paymentNotes"><g:message code="orderForm.paymentNotes.label" default="Payment Notes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderFormInstance, field: 'paymentNotes', 'errors')}">
                                    <g:textField name="paymentNotes" value="${orderFormInstance?.paymentNotes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="paymentProof"><g:message code="orderForm.paymentProof.label" default="Payment Proof" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderFormInstance, field: 'paymentProof', 'errors')}">
                                    <input type="file" id="paymentProof" name="paymentProof" />
                                </td>
                            </tr>
							<g:hiddenField name="cartInstance" value="${cartInstance?.id}" />
                        </tbody>
                    </table>
                </div>
				<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
			</g:form>
			
			
            
    </body>
</html>
