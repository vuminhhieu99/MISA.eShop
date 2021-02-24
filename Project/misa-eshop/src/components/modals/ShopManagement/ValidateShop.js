export  const COORDINATES = {
    shopCode: { left: "742px", top: "-6px" },
    shopName: { left: "742px", top: "42px" },
    address: { left: "742px", top: "90px" },
};


export  const TALK_VALIDATE = {
    shopCode_Empty: "Mã cửa hàng không được bỏ trống",
    shopCode_MaxLength: "Mã cửa hàng không quá 30 ký tự",
    shopName_Empty: "Tên cửa hàng không được bỏ trống",
    shopName_MaxLength: "Tên cửa hàng không quá 100 ký tự",
    address_Empty: "Địa chỉ cửa hàng không được bỏ trống",
    address_MaxLength: "Địa chỉ cửa hàng không được quá 400 ký tự"   
};

export var validateBag = {
    coordinates: COORDINATES.shopCode,
    talk: "",
    // = false nếu như dữ liệu bị sai
    success: true,
}

export function shopCode(shopCode) {
    console.log("validate shopCode");
    validateBag.success = false;
    if (shopCode == "") {        
        validateBag.coordinates = COORDINATES.shopCode;
        validateBag.talk = TALK_VALIDATE.shopCode_Empty;        
      } 
      else if (shopCode.length > 30) {    
        validateBag.coordinates = COORDINATES.shopCode;
        validateBag.talk = TALK_VALIDATE.shopCode_MaxLength;      
            
    } else {
        validateBag.success = true;
    }
    return validateBag;
}


export function shopName(shopName) {    
    validateBag.success = false;
    if (shopName == "") {        
        validateBag.coordinates = COORDINATES.shopName;
        validateBag.talk = TALK_VALIDATE.shopName_Empty;        
      } 
      else if (shopName.length > 100) {    
        validateBag.coordinates = COORDINATES.shopName;
        validateBag.talk = TALK_VALIDATE.shopName_MaxLength;      
            
    } else {
        validateBag.success = true;
    }
    return validateBag;
}

export function shopAddress(address) {    
    validateBag.success = false;
    if (address == "") {        
        validateBag.coordinates = COORDINATES.address;
        validateBag.talk = TALK_VALIDATE.address_Empty;        
      } 
      else if (address.length > 400) {    
        validateBag.coordinates = COORDINATES.address;
        validateBag.talk = TALK_VALIDATE.address_MaxLength;      
            
    } else {
        validateBag.success = true;
    }
    return validateBag;
}

    