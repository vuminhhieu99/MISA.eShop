using Misa.Common.Requests.Shop;
using Misa.Common.Results.Models;
using Misa.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Data.Interfaces
{
    public interface IShopData : IBaseData<Shop>
    {
        /// <summary>
        /// Lấy danh sách thông tin cửa hàng đầy đủ - kỹ thuật DI
        /// </summary>
        /// <param name="pageRequest">Mã, tên, địa chỉ, số điện thoại, mã trạng thái </param>
        /// <returns>danh sách cửa hàng</returns>
        /// create:5/2/2021
        public Task<IEnumerable<ShopResult>> GetData(PageRequest pageRequest);

        /// <summary>
        /// Lấy danh sách đầy đủ thông tin cửa hàng - kỹ thuật DI
        /// </summary>
        /// <returns>danh sách cửa hàng</returns>
        /// create:5/2/2021
        public Task<IEnumerable<ShopResult>> GetData();

        /// <summary>
        /// Lấy danh sách cửa hàng theo mã - kỹ thuật DI
        /// </summary>
        /// <param name="shopCode"> mã cửa hàng</param>
        /// <returns>danh sách cửa hàng</returns>
        /// create: 5/2/2021
        public Task<IEnumerable<Shop>> GetByShopCode(string shopCode);

        /// <summary>
        /// lấy danh sách cửa hàng theo số điện thoại - kỹ thuật DI
        /// </summary>
        /// <param name="phone"> số điện thoại</param>
        /// <returns>danh sách cửa hàng</returns>
        /// create: 5/2/2021
        public Task<IEnumerable<Shop>> GetByPhone(string phone);

        /// <summary>
        /// Lất danh sách cửa hàng theo mã số thuế - kỹ thuật DI
        /// </summary>
        /// <param name="taxCode">taxCode</param>
        /// <returns>danh sách cửa hàng</returns>
        public Task<IEnumerable<Shop>> GetByTaxCode(string taxCode);
    }
}
