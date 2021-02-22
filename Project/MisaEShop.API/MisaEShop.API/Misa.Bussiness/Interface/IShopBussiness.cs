using Misa.Common;
using Misa.Common.Requests.Shop;
using Misa.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Bussiness.Interface
{
    public interface IShopBussiness : IBaseBussiness<Shop>
    {
        /// <summary>
        /// Lấy ra danh sách cửa hàng  - kỹ thuật DI
        /// </summary>
        /// <param name="pageRequest">Mã, tên, địa chỉ, số điện thoại, mã trạng thái</param>
        /// <returns>ServiceResult</returns>
        /// create :4/2/2021
        public Task<ServiceResult> GetData(PageRequest pageRequest);

        /// <summary>
        /// Lấy ra toàn bộ danh sách cửa hàng đầy đủ  - kỹ thuật DI
        /// </summary>
        /// <returns>ServiceResult</returns>
        /// create :4/2/2021
        public Task<ServiceResult> GetFullData();
        
    }
}
