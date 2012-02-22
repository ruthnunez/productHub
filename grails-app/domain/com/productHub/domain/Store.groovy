package com.productHub.domain

class Store {
	String storeName
	String storeCode
	String description
	String meetUpLocations
	float rating
	
	static hasMany = [products: Product, orderforms: OrderForm]
	static belongsTo = [user: User]
	
	
	String accountDetails
	
	boolean acceptsDirect = false
	boolean acceptsPayPal = false
	boolean acceptsMoneyTransfer = false

    static constraints = {
		storeName (unique:true, blank:false, size: 5..20)
		storeCode (unique:true, blank:false, size: 5..8)
		user (validator: { val, obj -> 
			switch(obj.user.userRole) {
				case RoleType.ROLE_ADMINISTRATOR:
				case RoleType.ROLE_CLIENT:
					return ['invalidaccount']
					break
				
				case RoleType.ROLE_VENDOR:
					boolean isValid=false
					if(val) {
						isValid=true
					}

					if (isValid ==false) {
						return ['nodepot']
					} 
					
					return isValid
					
					break
			}
		})
		
	accountDetails(nullable:true, validator: {val, obj ->
		if(obj.acceptsMoneyTransfer && !val) {
			return ['nodetails']
		} else {
			return true
		}
	})
		
    }
}
