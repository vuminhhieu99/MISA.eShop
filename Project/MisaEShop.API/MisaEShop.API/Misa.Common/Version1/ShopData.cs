using Dapper;
using Misa.Common.Requests.Shop;
using Misa.Common.Results.Models;
using Misa.Data.Entities;
using Misa.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Data.Version1
{
    ///DbConnection<Shop>: chỉ định lớp cha nếu như không dùng kỹ thuật DI
    public class ShopData: DbConnection<Shop>, IShopData   
    {
        IBaseData<Shop> _baseData;
        public ShopData(IBaseData<Shop> baseData) : base()
        {
            _baseData = baseData;
        }
        /// <summary>
        ///  Lấy danh sách thông tin cửa hàng đầy đủ
        ///  ...
        /// </summary>
        /// <param name="pageRequest"> Mã, tên, địa chỉ, số điện thoại, mã trạng thái</param>
        /// <returns>danh sách cửa hàng</returns>
        /// create:5/2/2021
        public async Task<IEnumerable<ShopResult>> GetData(PageRequest pageRequest)
        {           
            var queryString = "SelectShopResult_Proc";
            var properties = typeof(PageRequest).GetProperties();
            var parameters = new DynamicParameters();
            foreach (var property in properties)
            {
                
                var propertyName = property.Name;
                if (propertyName == "PageIndex" || propertyName == "PageSize")
                    continue;
                var propertyValue = property.GetValue(pageRequest);
                if(propertyValue == null)
                {
                    propertyValue = "";
                }
                parameters.Add($"@{propertyName}", propertyValue);

            }

            return await _baseData.GetData<ShopResult>(queryString, parameters, CommandType.StoredProcedure);
        }

        /// <summary>
        /// Lấy danh sách đầy đủ thông tin nhân
        /// </summary>        
        /// <returns>danh sách cửa hàng </returns>
        /// create:5/2/2021
        public async Task<IEnumerable<ShopResult>> GetData()
        {
            var procName = "SelectShopResultAll_Proc";            
            return await _baseData.GetData<ShopResult>(procName, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// Lấy danh sách cửa hàng theo mã
        /// </summary>
        /// <param name="shopCode"> mã cửa hàng</param>
        /// <returns>danh sách cửa hàng</returns>
        /// create: 5/2/2021
        public async Task<IEnumerable<Shop>> GetByShopCode(string shopCode)
        {
            var query = $"SELECT * FROM Shop WHERE ShopCode = '{shopCode}'";
            return await _baseData.GetData(query);
        }

        /// <summary>
        /// Lấy danh sách cửa hàng theo số điên thoại 
        /// </summary>
        /// <param name="phone">số điện thoại</param>
        /// <returns>danh sách cửa hàng</returns>
        /// create: 5/2/2021
        public async Task<IEnumerable<Shop>> GetByPhone(string phone)
        {
            var query = $"SELECT * FROM Shop WHERE Phone = '{phone}'";
            return await _baseData.GetData(query);
        }

        /// <summary>
        /// Lấy danh sách cửa hàng theo mã số thuế
        /// </summary>
        /// <param name="taxCode">Mã số thuế</param>
        /// <returns>danh sách cửa hàng</returns>
        /// create: 5/2/2021
        public async Task<IEnumerable<Shop>> GetByTaxCode(string taxCode)
        {
            var query = $"SELECT * FROM Shop WHERE TaxCode = '{taxCode}'";
            return await _baseData.GetData(query);
        }
    }
}
