using Misa.Bussiness.Interface;
using Misa.Common;
using Misa.Common.Entities;
using Misa.Common.Enum;
using Misa.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Bussiness.Version1
{
    public class UserBussiness : BaseBussiness<User>, IUserBussiness
    {        
        private IBaseBussiness<User> _baseBussiness;


        public UserBussiness( IBaseBussiness<User> baseBussiness, IBaseData<User> baseData) : base(baseData)
        {
           
            _baseBussiness = baseBussiness;
        }


        public override async Task<ServiceResult> Insert(User user)
        {
            ServiceResult serviceResult = new ServiceResult();
            _baseBussiness.ValidateObject(ref serviceResult, ref user);
            if (serviceResult.MISAeShopCode == MISAeShopServiceCode.BadRequest)
            {
                return serviceResult;
            }
            return await _baseBussiness.Insert(user);
        }

       
    }
}
