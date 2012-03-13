
<%@ page import="com.productHub.domain.Store" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${storeInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storeInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.storeName.label" default="Store Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storeInstance, field: "storeName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.storeCode.label" default="Store Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storeInstance, field: "storeCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${storeInstance?.user?.id}">${storeInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.accountDetails.label" default="Bank Account Details" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storeInstance, field: "accountDetails")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.acceptsDirect.label" default="Accepts Direct" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${storeInstance?.acceptsDirect}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.acceptsMoneyTransfer.label" default="Accepts Money Transfer" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${storeInstance?.acceptsMoneyTransfer}" /></td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storeInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.meetUpLocations.label" default="Meet Up Locations" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: storeInstance, field: "meetUpLocations")}</td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="store.products.label" default="Products" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${storeInstance.products}" var="p">
                                    <li><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    </tbody>
                </table>
				<h1>Ratings</h1>
				<g:form>
                    <g:hiddenField name="id" value="${storeInstance?.id}" />
					<g:textField name="rating" maxlength="1" />
                    <g:textField name="remarks"/>
                    <g:actionSubmit class="btn" action="addComment" value="${message(code: 'default.button.addComment.label', default: 'Add Comment')}" />
                </g:form>
				
					<g:each in="${storeInstance.comments}" var="p">
					<table class="orders">
						<tr class="prop">
						<td><g:link controller="user" action="show" id="${p.id}">${p.author.username}</g:link></td>
						<td>${p.rating}</td>
						</tr>
						
						<tr class="prop">
						<td colspan="2">${p.remarks}</td>
						</tr>
					</table>
					</g:each>
				
				
				
            </div>
            
        </div>
    </body>
</html>
